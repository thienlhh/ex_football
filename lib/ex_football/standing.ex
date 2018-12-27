defmodule ExFootball.Standing do
  use ExFootball, :helper

  def all!(client) do
    client |> get!("/standings")
  end

  def find!(client, id) do
    client |> get!("/standings/#{id}")
  end
end
