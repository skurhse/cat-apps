import nimcrypto
import os

var
  input: string = stdin.readAll()
  params: seq[TaintedString] = commandLineParams() 
  key: string

key = params[0]
echo sha256.hmac(key, input)
