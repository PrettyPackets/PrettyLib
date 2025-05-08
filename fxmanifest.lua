fx_version "cerulean"
game "gta5"
lua54 "yes"
use_experimental_fxv2_oal "yes"
name "PrettyPacketLib"
author "PrettyPacket"


version "0.0.1"

shared_scripts {
    "shared/*.lua",
}


client_scripts {
    "client/*.lua",
    "client/functions/*.lua",
    "client/functions/bridge/*.lua",
    "client/functions/inventory/*.lua"
}

server_scripts {
    "server/*.lua",
    "server/functions/*.lua",
    "server/functions/bridge/*.lua",
    "server/functions/inventory/*.lua"
}


escrow_ignore {
}

dependency '/assetpacks'
dependency '/assetpacks'