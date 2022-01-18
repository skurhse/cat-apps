# Grape 🐱
- http://www.ruby-grape.org
- https://github.com/ruby-grape/grape

## Usage
```bash
bundle install
rackup &>/dev/null &
pid=$!
curl http://localhost:9292/hello?name=grape
curl http://localhost:9292/goodbye
kill $pid
```
