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

## Parsing behaviour

Phoenix seamlessly deals with POST requests in a lot of cases. It reads the `Content-Type` header and performs appropriate parsing.
It can seamlessly deal with `application/x-www-form-urlencoded` and `application/json` POST request.

We have a route and controller action to demonstrate it. See PollsWeb.API.HomeController.create_poll.

An `application/json` POST request works.

    curl -v -d '{"company": "Ascend", "category": "org"}' -H "Content-Type: application/json" http://localhost:4000/api/polls/

A `application/x-www-form-urlencoded` request works as well.

    curl -v -d 'company=Ascend' -d 'category=org' http://localhost:4000/api/polls/

## Database interaction

Phoenix uses `Ecto` to interact with the database.

The following command creates the database.

    mix ecto.create

The following command creates a schema

    mix phx.gen.schema User users name:string email:string
    mix phx.gen.schema Poll polls questiontring

Once the schema is created, it needs to be appliced in the database.

    mix ecto.migrate

Once the database is created, you can execute the following commands. You need to start an interactive shell using `iex -S mix`.

Insert a poll

    alias Polls.Poll
    alias Polls.Repo
    Repo.insert(%Poll{question: "What is your name?"})

## Project Navigation

### Mix

Mix is Elixir's build tool. A good place to start navigating a Mix application is `mix.exs`.

It tells about the application name, main application module, dependencies, Elixir version and much more.

Mix discovers the modules to make available using `elixirc_paths`.

Try `iex -S mix` and the following commands.

    Polls.MixProject.project()[:elixirc_paths]

We have added `script` directory to elixirc_paths(), hence file `person.ex` is discoverable now.

    Person.greet("bob")

Check the application name:

    Polls.MixProject.project()[:app]

The Mix project has `use Mix.Project` as the first line. `use` is a macro that inject behaviour into the module that uses it. Having this line forces us to implement the needed **callbacks** `project` and `application` inside `Polls.MixProject`.

### OTP Application

The next logical step after `mix.exs` is the main application module. The main application module is `Polls.Application` defined in `lib/polls/application.ex`.

The main application module is a OTP application. It must have `use Application` as the first statement.

### Supervisor

A `children` needs to be passed to `Supervisor.start_link`. `children` is a list of dependencies to start before starting the actual application.
The entries of `children` can either by a module or a tuple. The entry could be `Polls.Repo` or it could be `{Phoenix.PubSub, name: Polls.PubSub}`.

Ultimately, Supervisor needs to call `start_link` on every child. If we specify a tuple, then the second entry of the tuple is used as an argument to start_link, i.e `Phoenix.PubSub.start_link(name: Polls.PubSub)`.

# Learnings

- Route > Controller > View > Template
- View: Function Component and Template File
- Controllers are modules, Actions are function
- Controller Functions take two arguments: connection and parameters
- Views take a single argument: assigns
- Pipelines allow a set of Plugs to be applied to differet sets of routes
- Scopes enable us to segregate the routes
- Once a route matches, Phoenix applies all the plugs defined in all the piplines associated with the scope
- Ecto repositories are interface into the storage system

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
