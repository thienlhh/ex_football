defmodule ExFootball.MatchTest do
  use ExUnit.Case, async: true

  setup_all do
    api_token = Application.get_env(:ex_football, :api_token)
    {:ok, client: ExFootball.Client.new(api_token)}
  end

  describe "all!/2" do
    test "return all matches of current day", context do
      res = context[:client] |> ExFootball.Match.all!()

      assert length(res.body["matches"]) > 0
    end
  end
end
