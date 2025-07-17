defmodule PollsWeb.PollsHTML do
  use PollsWeb, :html

  def detail(assigns) do
    ~H"""
      Polls Detail for {assigns.poll_id}!
    """
  end

  embed_templates "polls_html/*"
end
