{ pkgs ? import <nixpkgs>{} }:
let
  goatcounter = pkgs.buildGoModule rec {
    pname = "goatcounter";
    version = "530ab5edff553923fb04d9e1b1a9771f8a6d0461";

    src = pkgs.fetchFromGitHub {
      owner = "arp242";
      repo = "goatcounter";
      rev = version;
      hash = "sha256-8n6d89pm8Itm9OodF3SdXplOKf3ocxSWgZ+VE7FyX68=";
    };

    preBuild = ''
      sed -i 's#1.23.0#1.22.0#' go.mod
    '';

    vendorHash = "sha256-8W/xQ8jkNjjmaAvdoY/66HCW7dA+pFC4MVc17J/3B5o=";
    subPackages = [ "cmd/goatcounter" ];
    modroot = ".";

    allowReference = true;
    ldflags = [
      "-s"
      "-w"
      "-X zgo.at/goatcounter.Version=${version}"
    ];

    meta = {
      description = "Easy web analytics. No tracking of personal data. ";
      mainProgram = "goatcounter";
      homepage = "https://github.com/arp242/goatcounter";
      license = pkgs.lib.licenses.eupl12;
    };
  };

  entrypoint = pkgs.writeShellScript "entrypoint.sh" ''
    ${goatcounter}/bin/goatcounter serve \
      -port "''${GC_PORT}" \
      -listen "''${GC_LISTEN}" \
      -db "''${GC_DB}" \
      -tls "''${GC_TLS}" \
      -errors "''${GC_ERRORS}" \
      -email-from "''${GC_EMAIL_FROM}" \
      -smtp "''${GOATCOUNTER_SMTP}" \
      -automigrate
  '';
in {
  img = pkgs.dockerTools.buildImage {
    name = "docker.io/andrewzah/goatcounter";
    tag = "${goatcounter.version}";

    #copyToRoot = pkgs.buildEnv {
    #  name = "img-root";
    #  paths = [ pkgs.bashInteractiveFHS pkgs.coreutils-full ];
    #  pathsToLink = [ "/bin" ];
    #};

    config = {
      entrypoint = [ "${entrypoint}" ];
      exposedPorts = { "3443" = {}; };
    };
  };
}
