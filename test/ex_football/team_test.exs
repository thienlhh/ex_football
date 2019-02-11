defmodule ExFootball.TeamTest do
  use ExUnit.Case, async: true

  setup_all do
    api_token = Application.get_env(:ex_football, :api_token)
    {:ok, client: ExFootball.Client.new(api_token)}
  end

  describe "all!/1" do
    test "return all teams", context do
      res = context[:client] |> ExFootball.Team.all!()

      assert length(res.body["teams"]) > 0
    end
  end

  describe "find!/2" do
    test "return a team", context do
      res = context[:client] |> ExFootball.Team.find!(69)

      assert res.body["id"] == 69
      assert res.body["name"] == "Queens Park Rangers FC"
    end
  end
end
