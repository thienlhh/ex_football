defmodule ExFootball.PlayerTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    {:ok, client: ExFootball.Client.new("api_token")}
  end

  describe "find!/2" do
    test "return a player", context do
      use_cassette "player.find!" do
        res = context[:client] |> ExFootball.Player.find!(2019)

        assert res.body["id"] == 2019
        assert res.body["name"] == "Gianluigi Buffon"
      end
    end
  end

  describe "matches!/3" do
    test "return all matches of a player", context do
      use_cassette "player.matches!" do
        res = context[:client] |> ExFootball.Player.matches(2019)

        assert length(res.body["matches"]) > 0
      end
    end
  end
end
