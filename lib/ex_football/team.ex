defmodule ExFootball.Team do
  use ExFootball

  def all!(client) do
    client |> get!("/teams")
  end

  def find!(client, id) do
    client |> get!("/teams/#{id}")
  end
end
