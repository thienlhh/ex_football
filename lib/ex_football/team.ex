defmodule ExFootball.Team do
  @moduledoc """
  Football data [team](www.football-data.org/documentation/api#team) API
  """

  use ExFootball

  @doc """
  Get all teams
  """
  def all!(client) do
    client |> get!("/teams")
  end

  @doc """
  Get a team with given id
  """
  def find!(client, id) do
    client |> get!("/teams/#{id}")
  end
end
