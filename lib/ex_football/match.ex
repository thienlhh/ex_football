defmodule ExFootball.Match do
  use ExFootball

  def all!(client, filters \\ []) do
    client |> get!("/matches#{build_filters(filters)}")
  end

  def find!(client, id) do
    client |> get!("/matches/#{id}")
  end
end
