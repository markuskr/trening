defmodule ElixirTrening.PageView do
  use ElixirTrening.Web, :view
  alias ElixirTrening.Training

  defmodule Participant do
    defstruct name: "", goal: 30, current: 0 
  end
 
  def csrf_token do
    Plug.CSRFProtection.get_csrf_token
  end

  @spec participant_1() :: Participant
  def participant_1 do
    %Participant{name: Application.get_env(:elixir_trening, ElixirTrening.Participant1)[:name], goal: 40, current: 10}
  end

  @spec participant_2() :: Participant
  def participant_2 do
    %Participant{name: Application.get_env(:elixir_trening, ElixirTrening.Participant2)[:name], goal: 40, current: 11}
  end
  
  @spec ahead?(Participant, Participant) :: boolean
  def ahead?(participant_1, participant_2) do
    participant_1.current >= participant_2.current
  end
end
