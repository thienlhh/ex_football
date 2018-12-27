defmodule ExFootball.Player do
  use ExFootball, :helper

  def all!(client, filters \\ []) do
    client |> get!("/players#{build_filters(filters)}")
  end

  def find!(client, id, filters \\ []) do
    client |> get!("/players/#{id}#{build_filters(filters)}")
  end

  def matches(client, id, filters \\ []) do
    client |> get!("/players/#{id}/matches#{build_filters(filters)}")
  end
end
