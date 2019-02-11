defmodule ExFootball.Player do
  @moduledoc """
  Football data [player](www.football-data.org/documentation/api#player) API
  """

  use ExFootball

  @doc """
  Get a player with given id
  """
  def find!(client, id) do
    client |> get!("/players/#{id}")
  end

  @doc """
  Get all matches of a player
  """
  def matches(client, id, filters \\ []) do
    client |> get!("/players/#{id}/matches#{build_filters(filters)}")
  end
end
