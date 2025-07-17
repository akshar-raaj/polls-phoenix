defmodule PollsWeb.PollsHTML do
  use PollsWeb, :html

  def detail(assigns) do
    ~H"""
      Polls Detail!
    """
  end

  embed_templates "polls_html/*"
end
