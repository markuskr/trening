defmodule ElixirTraining.PageController do
  use ElixirTraining.Web, :controller

  require Logger
  import ElixirTraining.Authenticator
  alias ElixirTraining.Training
  alias ElixirTraining.Motivation
  plug :action


  defmodule Participant do
    defstruct name: "", goal: 15, current: 0, message: ""
  end 

  def motivation(goal, current) do
    all_motivations = Repo.all(from m in Motivation, order_by: m.priority, select: m.content)
    amount_motivations = length(all_motivations)

    index = max(round(Float.ceil((current / goal) * amount_motivations)), 1) 
    Enum.at(all_motivations, index - 1)
  end 
  
  def info(participant) do
    [email: email, name: name, goal: goal] = participant
    current_round = Application.get_env(:elixir_training, ElixirTraining.Round)[:current]
    
    current_amount = Repo.one(from t in Training, where: t.user == ^email and t.version == ^current_round, select: count(t.id))
    message = motivation(goal, current_amount)
    %Participant{name: name, goal: goal, current: current_amount, message: message}
  end

  def index(conn, _params) do
    participant1 = info(Application.get_env(:elixir_training, ElixirTraining.Participants)[:participant1]) 
    participant2 = info(Application.get_env(:elixir_training, ElixirTraining.Participants)[:participant2]) 

    current_round = Application.get_env(:elixir_training, ElixirTraining.Round)[:current]

    case is_authenticated?(conn) do
      {:ok, user} -> 
        trainings = Repo.all(
          from t in Training,
          where: t.user == ^user and t.version == ^current_round, 
          order_by: [desc: t.inserted_at],
          limit: 5,  
          select: t)
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
