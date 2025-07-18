defmodule PollsWeb.Polls.PollsController do
  use PollsWeb, :controller

  def list(conn, _params) do
    render(conn, :list)
  end

  def detail(conn, params) do
    poll_id = params["poll_id"]
    IO.puts "Request for #{poll_id}"
    render(conn, :detail, poll_id: poll_id)
  end
end
