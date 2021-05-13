# Package

version       = "0.1.0"
author        = "drruruu ☔"
description   = "Keyed-hash message authentication code generator"
license       = "MIT"
srcDir        = "src"
bin           = @["hmac"]


# Dependencies

requires "nim >= 1.4.6"
requires "nimcrypto >= 0.5.4"
