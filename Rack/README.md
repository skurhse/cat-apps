Usage 🐈‍⬛

```
pid=$(./start.bash)
curl 'http://127.0.0.1:3000/hello?name=whiskers'
curl 'http://127.0.0.1:3000/goodbye'
kill $pid
```
