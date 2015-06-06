defmodule ElixirTraining.PageView do
  use ElixirTraining.Web, :view
 
  def csrf_token do
    Plug.CSRFProtection.get_csrf_token
  end
  
  @spec ahead?(Participant, Participant) :: boolean
  def ahead?(participant_1, participant_2) do
    participant_1.current >= participant_2.current
  end
end
