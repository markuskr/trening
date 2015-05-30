defmodule ElixirTrening.PageController do
  use ElixirTrening.Web, :controller

  require Logger
  import ElixirTrening.Authenticator
  alias ElixirTrening.Training
  alias ElixirTrening.Motivation
  plug :action


  defmodule Participant do
    defstruct name: "", goal: 15, current: 0, message: ""
  end 

  def motivation(goal, current) do
    all_motivations = Repo.all(from m in Motivation, order_by: m.priority, select: m.content)
    amount_motivations = length(all_motivations)

    index = max(round(Float.ceil((current / goal) * amount_motivations)), 1) 
    Enum.at(all_motivations, index)
  end 
  
  def info(participant) do
    [email: email, name: name, goal: goal] = participant
    current_amount = Repo.one(from t in Training, where: t.user == ^email, select: count(t.id))
    message = motivation(goal, current_amount)
    %Participant{name: name, goal: goal, current: current_amount, message: message}
  end

  def index(conn, _params) do
    participant1 = info(Application.get_env(:elixir_trening, ElixirTrening.Participants)[:participant1]) 
    participant2 = info(Application.get_env(:elixir_trening, ElixirTrening.Participants)[:participant2]) 
    
    case is_authenticated?(conn) do
      {:ok, user} -> 
        trainings = Repo.all(from t in Training, where: t.user == ^user, select: t)
        render conn, "index.html", 
          participant1: participant1, 
          participant2: participant2, 
          authenticated: :true, 
          current_user: user, 
          trainings: trainings
      
      {:error, _reason} ->
        render conn, "index.html", 
          participant1: participant1, 
          participant2: participant2, 
          authenticated: :false
    end 
  end
end
