# Athena 😻

 - https://athenaframework.org/
 - https://github.com/athena-framework/athena

## Usage
```bash
crystal athena.cr &>/dev/null &
pid=$!
curl http://localhost:8080/hello?name=athena
curl http://localhost:8080/goodbye
kill $pid
```
