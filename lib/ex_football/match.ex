defmodule ExFootball.Match do
  use ExFootball, :helper

  def all!(client, filters \\ []) do
    client |> get!("/matches#{build_filters(filters)}")
  end

  def find!(client, id, filters \\ []) do
    client |> get!("/matches/#{id}#{build_filters(filters)}")
  end
end
