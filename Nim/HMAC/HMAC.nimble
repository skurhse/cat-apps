# Package

version       = "0.1.0"
author        = "drruruu"
description   = "Keyed-hash message authentication code generator"
license       = "AGPL"
srcDir        = "src"
bin           = @["hmac"]
binDir        = "bin"


# Dependencies

requires "nim >= 1.4.6"
requires "nimcrypto >= 0.5.4"
