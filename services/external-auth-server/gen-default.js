const jwt = require("jsonwebtoken");
const utils = require("../src/utils");

const config_token_sign_secret =
  process.env.EAS_CONFIG_TOKEN_SIGN_SECRET ||
  utils.exit_failure("missing EAS_CONFIG_TOKEN_SIGN_SECRET env variable");
const config_token_encrypt_secret =
  process.env.EAS_CONFIG_TOKEN_ENCRYPT_SECRET ||
  utils.exit_failure("missing EAS_CONFIG_TOKEN_ENCRYPT_SECRET env variable");

let config_token = {
  eas: {
    plugins: [
	    {
    type: "oidc",
    issuer: {
        discover_url: "https://idp.zah.rocks/auth/realms/lilac/.well-known/openid-configuration",
    },
    client: {
        client_id: "eas",
        client_secret: "4e45c140-dee7-4d8f-b2a5-d681a021f505"

    },
    scopes: ["openid", "email", "profile"], // must include openid
    custom_authorization_parameters: {},
    redirect_uri: "https://eas.zah.rocks/oauth/callback",
    features: {
        cookie_expiry: false,
        userinfo_expiry: 86400,
        session_expiry: 604800,
        session_expiry_refresh_window: 86400,
        session_retain_id: true,
        refresh_access_token: true,
        fetch_userinfo: true,
        introspect_access_token: false,
        introspect_expiry: 86400,

        /** possible values are id_token, access_token, or refresh_token */
        authorization_token: "access_token"
    },
    assertions: {
        exp: true,
        nbf: true,
        iss: true,
        userinfo: [],
        id_token: [],
        access_token: []
    },
    xhr: {
        //defaults to 302 but could be set to anything
        //if set to 401 the response will include a WWW-Authenticate header with proper realm/scopes
        redirect_http_code: 302,

        //if set to true, the browser will be redirected to the referer
        use_referer_as_redirect_uri: true
    },
    csrf_cookie: {
        enabled: true, //can disable the use of csrf cookies completely
        domain: "zah.rocks", //defaults to request domain, could do sso with more generic domain
        path: "/",
        //httpOnly: true,
        //secure: false,
        //sameSite: lax,
    },
    cookie: {
        //name: "__company_session",//default is _oeas_oauth_session
        domain: "zah.rocks", //defaults to request domain, could do sso with more generic domain
        path: "/",
        //httpOnly: true,
        //secure: false,
        //sameSite: lax,
    },
    // see HEADERS.md for details
    custom_error_headers: {},
    custom_service_headers: {},
}
    ], 
  }
};

config_token = jwt.sign(config_token, config_token_sign_secret);
const config_token_encrypted = utils.encrypt(
  config_token_encrypt_secret,
  config_token
);

//console.log("token: %s", config_token);
//console.log("");

console.log("encrypted token (for server-side usage): %s", config_token_encrypted);
console.log("");

console.log(
  "URL safe config_token: %s",
  encodeURIComponent(config_token_encrypted)
);
console.log("");
