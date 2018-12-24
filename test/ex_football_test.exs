defmodule ExFootballTest do
  use ExUnit.Case, async: true
  doctest ExFootball

  setup do
    {:ok, api_token: Application.get_env(:ex_football, :api_token)}
  end

  test "get all competitions", context do
    {:ok, response} =
      context[:api_token]
      |> ExFootball.fetch("competitions")

    assert length(response["competitions"]) > 0
  end

  test "get upcoming matches for PL", context do
    {:ok, response} =
      context[:api_token]
      |> ExFootball.fetch("competitions", "matches", id: "PL", status: "SCHEDULED")

    assert length(response["matches"]) > 0
  end

  test "invalid api token" do
    {:error, error} =
      "api_token"
      |> ExFootball.fetch("competitions")

    assert error["message"] == "Your API token is invalid."
  end

  test "resource not found", context do
    {:error, error} =
      context[:api_token]
      |> ExFootball.fetch("abc")

    assert error["error"] == 404
  end
end
