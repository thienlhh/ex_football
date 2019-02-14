defmodule ExFootball.TeamTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    {:ok, client: ExFootball.Client.new("api_token")}
  end

  describe "all!/1" do
    test "return all teams", context do
      use_cassette "team.all!" do
        res = context[:client] |> ExFootball.Team.all!()

        assert length(res.body["teams"]) > 0
      end
    end
  end

  describe "find!/2" do
    test "return a team", context do
      use_cassette "team.find!" do
        res = context[:client] |> ExFootball.Team.find!(69)

        assert res.body["id"] == 69
        assert res.body["name"] == "Queens Park Rangers FC"
      end
    end
  end
end
