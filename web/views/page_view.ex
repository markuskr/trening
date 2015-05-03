defmodule ElixirTrening.PageView do
  use ElixirTrening.Web, :view

  defmodule Participant do
    defstruct name: "", goal: 30, current: 0 
  end

  @spec participant_1() :: Participant
  def participant_1 do
    %Participant{name: "Kjersti", goal: 40, current: 10}
  end

  @spec participant_2() :: Participant
  def participant_2 do
    %Participant{name: "Markus", goal: 30, current: 20}
  end
  
  @spec ahead?(Participant, Participant) :: boolean
  def ahead?(participant_1, participant_2) do
    participant_1.current >= participant_2.current
  end
end
