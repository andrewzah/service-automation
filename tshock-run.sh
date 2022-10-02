#!/bin/bash

set -euxo pipefail

mono TerrariaServer.exe \
  -world ~/.local/share/Terraria/Worlds/LabChicanery.wld \
  -config tshock/config.json
