# Rack 😹
- https://rack.github.io/
- https://github.com/rack/rack

## Usage

```
bundle install
bundle exec thin start &>/dev/null &
curl 'http://127.0.0.1:3000/hello?name=whiskers'
curl 'http://127.0.0.1:3000/goodbye'
kill $pid
```
