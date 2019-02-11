defmodule ExFootballTest do
  use ExUnit.Case, async: true
  doctest ExFootball

  setup do
    {:ok, api_token: Application.get_env(:ex_football, :api_token)}
  end
end
