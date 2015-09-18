defmodule ElixirTraining.PageController do
  @moduledoc """
  Generates startpage. The motivational sentences are shown based on the progress of the participant. If logged in, 
  the user can add one workout, the app shows a list of workouts for the user or the user can change to the site 
  for weight.  
  """
  use ElixirTraining.Web, :controller

  require Logger
  import ElixirTraining.Authenticator
  alias ElixirTraining.Training
  alias ElixirTraining.Motivation

  defmodule Participant do
    defstruct name: "", goal: 15, current: 0, message: ""
  end 

  def motivation(goal, current) do
    all_motivations = Repo.all(from m in Motivation, order_by: m.priority, select: m.content)
    # The last motivation is for one of the partipants won
    if current >= goal  do
      Enum.at(all_motivations, length(all_motivations) - 1)
    else 
      amount_motivations = length(all_motivations) - 1
      index = max(round(Float.ceil((current / goal) * amount_motivations)), 1) 
      Enum.at(all_motivations, index - 1)
    end 

  end 
 
  def info_per_email(email) do
    participant1 = Application.get_env(:elixir_training, ElixirTraining.Participants)[:participant1] 
    participant2 = Application.get_env(:elixir_training, ElixirTraining.Participants)[:participant2] 

    cond do 
      participant1[:email] == email -> info(participant1)
      participant2[:email] == email -> info(participant2)
    end  
   
  end

  def info(participant) do
    [email: email, name: name, goal: goal] = participant
    current_round = Application.get_env(:elixir_training, ElixirTraining.Round)[:current]
    # version is used to manage the current round. 
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
        # When logged in, the last 5 trainings are shown
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
        # If not logged in, just the score is shown
        render conn, "index.html", 
          participant1: participant1, 
          participant2: participant2, 
          authenticated: :false
          
    end 
  end
end
