# Installation

Start an Elixir container

    $ docker run --name phoenix -v .:/app -p 4000:400 elixir

Get an interactive shell on the running container

    $ docker exec -it phoenix bash

Install `hex` and `phoenix`.

    $ mix archive.install hex phx_new

Start a Phoenix project

    $ mix phx.new polls --no-ecto --no-live

Navigate to the project

    $ cd polls

Start the server

    $ mix phx.server

Start an interactive shell

    $ iex -S mix phx.server

Attempt invoking the following commands:

    iex> Polls.about()

    iex> PollsWeb.router()

    iex> PollsWeb.controller()

    iex> PollsWeb.html()

# Polls

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
