# Usage:
```
pid=$(scr/start.bash)
curl 'http://localhost:8080/hello?name=whiskers'
curl 'http://localhost:8080/goodbye'
kill $pid
```
