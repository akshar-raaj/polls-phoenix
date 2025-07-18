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

If it works, you are all set!

# Overview

This repository captures my Phoenix Learning Journey!

Django provides a wonderful `polls` tutorial for people starting with Django. We are building the same `polls` application using Phoenix.

Phoenix follows a MVC framework.

## Request-Response cycle

The request reaches the `Route`. `Route` routes it to a `controller`. Controller invokes a `View`. View uses a `Function component` or a `Template File` to generate the HTML.

    Route -> Controller -> View -> Template

The `Controller` can choose to use `text` or `json` from the controller action, instead of delegating to a view using `render`. See PollsWeb.PageController.home().

In case plain render(), ~H combination or embed_templates is used, the response `Content-Type` is `text/html`.

    curl -v http://localhost:4000/polls/

In case `text()` is used in the controller action, the response `Content-Type` is `text/plain`.

    curl -v http://localhost:4000/

In case `json()` is used in the controller action, the response `Content-Type` is `application/json`.

    curl -v http://localhost:4000/api/
    curl -v -I http://localhost:4000/books/

# Learnings

- Route > Controller > View > Template
- View: Function Component and Template File
- Controllers are modules, Actions are function
- Controller Functions take two arguments: connection and parameters
- Views take a single argument: assigns
- Pipelines allow a set of Plugs to be applied to differet sets of routes
- Scopes enable us to segregate the routes
- Once a route matches, Phoenix applies all the plugs defined in all the piplines associated with the scope

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
