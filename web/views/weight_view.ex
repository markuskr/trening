defmodule ElixirTrening.WeightView do
  use ElixirTrening.Web, :view

  def csrf_token do
    Plug.CSRFProtection.get_csrf_token
  end

end
