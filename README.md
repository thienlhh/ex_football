[![Build Status](https://travis-ci.org/thienlhh/ex_football.svg?branch=master)](https://travis-ci.org/thienlhh/ex_football)
[![Coverage Status](https://coveralls.io/repos/github/thienlhh/ex_football/badge.svg?branch=master)](https://coveralls.io/github/thienlhh/ex_football?branch=master)
[![Latest Version](https://img.shields.io/hexpm/v/ex_football.svg)](https://hex.pm/packages/ex_football)

# ExFootball

Simple Elixir client for football-data.org API v2

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_football` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_football, "~> 0.3.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_football](https://hexdocs.pm/ex_football).

## Contribution
Clone repository
```
> git clone https://github.com/thienlhh/ex_football.git
> cd ex_football
> mix deps.get
```

Create `secret.exs` file in the /config directory, don't forget to add this file to gitignore:
```
use Mix.Config

config :ex_football, api_token: "football_data_api_token"
```

Run test
```
mix test
```