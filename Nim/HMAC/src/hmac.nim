import nimcrypto

var
  input: string = stdin.readAll()

echo keccak_256.digest(input) 
