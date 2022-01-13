Usage 🐱
```
revel run -a app &>/dev/null &
pid=$!
curl localhost:9000/hello?name=revel
curl localhost:9000/goodbye
kill $pid
```
