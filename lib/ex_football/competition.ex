defmodule ExFootball.Competition do
  @moduledoc """
  Football data competition resources [Compitition](www.football-data.org/documentation/api#competition)
  """

  use ExFootball

  @doc """
  Get all competitions
  """
  def all!(client, filters \\ []) do
    client |> get!("/competitions#{build_filters(filters)}")
  end

  @doc """
  Get a competition with given id
  """
  def find!(client, id) do
    client |> get!("/competitions/#{id}")
  end

  @doc """
  Get all matches of a competition
  """
  def matches!(client, id, filters \\ []) do
    find!(client, "#{id}/matches#{build_filters(filters)}")
  end

  @doc """
  Get all teams of a competition
  """
  def teams!(client, id, filters \\ []) do
    find!(client, "#{id}/teams#{build_filters(filters)}")
  end

  @doc """
  Get all standings of a competition
  """
  def standings!(client, id, filters \\ []) do
    find!(client, "#{id}/standings#{build_filters(filters)}")
  end

  @doc """
  Get all scorers of a competition
  """
  def scorers!(client, id, filters \\ []) do
    find!(client, "#{id}/scorers#{build_filters(filters)}")
  end
end
