# Rfc5849

## Introduction

This application was inspired by OAuther and oauth2 libraries from
Elixir/Erlang.

## Requirement

 * Full oauth/1 implementation (https://tools.ietf.org/html/rfc5849)
 
 * Abstract the client/server exchange method
 
 * Create a damn simple library
 
 * Offer an infrastructure to manage creds
 
 * Connection retention (based on other current http client in
   elixir/erlang)
 
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `rfc5849` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rfc5849, "~> 0.1.0"}
  ]
end
```

## Usage

```
Application.start(Rfc5849)
{:ok, ref} = Rfc5849.new()
```

## Structure

Rfc5849 is an OTP application and must be started. This application
will spawn many processes to manage oauth/1 authentication with remote
server.

```
  _____      ____________      ________            _____
 (_____)    |            |    |        |          (     )
 | ref |----| supervisor |----| client |-------->( oauth )
 (_____)    |____________|    |________|          (_____)
                       |       ________             |
                       |      |        |            |
					   +------| server |<-----------+
                       |      |________|
					   |	   __________
                       |      (__________)
                       +------|          |
					          | exchange |
							  (__________)

```

Each user must have an isolated pool of client/server to ensure that
the confidential information not leak.

```elixir
{:ok, ref} = Rfc5849.new()
```

`ref` variable will be used to exchange information with internal
service and track connection.

## Resources

 * https://tools.ietf.org/html/rfc5849
 * https://github.com/lexmag/oauther/
 * https://github.com/scrogson/oauth2
