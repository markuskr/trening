defmodule ElixirTraining.LoginView do
  use ElixirTraining.Web, :view

  def csrf_token do
    Plug.CSRFProtection.get_csrf_token
  end
end
