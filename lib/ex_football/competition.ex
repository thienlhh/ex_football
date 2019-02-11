defmodule ExFootball.Competition do
  use ExFootball

  def all!(client, filters \\ []) do
    client |> get!("/competitions#{build_filters(filters)}")
  end

  def find!(client, id) do
    client |> get!("/competitions/#{id}")
  end

  def matches!(client, id, filters \\ []) do
    find!(client, "#{id}/matches#{build_filters(filters)}")
  end

  def teams!(client, id, filters \\ []) do
    find!(client, "#{id}/teams#{build_filters(filters)}")
  end

  def standings!(client, id, filters \\ []) do
    find!(client, "#{id}/standings#{build_filters(filters)}")
  end

  def scorers!(client, id, filters \\ []) do
    find!(client, "#{id}/scorers#{build_filters(filters)}")
  end
end
