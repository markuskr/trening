defmodule ElixirTraining.ErrorView do
  use ElixirTraining.Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Server internal error"
  end

  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
