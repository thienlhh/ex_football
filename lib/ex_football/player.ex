defmodule ExFootball.Player do
  use ExFootball

  def find!(client, id) do
    client |> get!("/players/#{id}")
  end

  def matches(client, id, filters \\ []) do
    client |> get!("/players/#{id}/matches#{build_filters(filters)}")
  end
end
