defmodule ExFootball.Match do
  @moduledoc """
  Football data [match](www.football-data.org/documentation/api#match) API
  """

  use ExFootball

  @doc """
  Get all matches of current day
  """
  def all!(client, filters \\ []) do
    client |> get!("/matches#{build_filters(filters)}")
  end

  @doc """
  Get a match with given id
  """
  def find!(client, id) do
    client |> get!("/matches/#{id}")
  end
end
