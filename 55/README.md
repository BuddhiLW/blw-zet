# Differences on Jetty and Aleph (Clojure web applications libraries)

## Reitit course (Jack Schae)

When integrating `go`, `reset` and `halt` commands of `Integrant` with `Aleph`, I found it much more well behaved than `Jetty`. First thing, the `Cider repl` was consumed (the process) entirely by the server, when using `Jetty`. For some reason, this wouldn't happen with `Aleph`. So, that was pretty good, since I would like to keep using the `repl` capabilities inside Emacs, while running the server.

Second thing `Aleph` is ahead, it seems it's much more performant and it can use multi-treading easily.

Last but not least, one could easily use any `Ring` defined routing and it will be compliant with `Aleph`.

Few keywords for things change, like `stop` to `close`, from `Jetty` to `Aleph`.

Etc.



