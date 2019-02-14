defmodule ExFootball.MatchTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    {:ok, client: ExFootball.Client.new("api_token")}
  end

  describe "all!/2" do
    test "return all matches of current day", context do
      use_cassette "match.all!" do
        res = context[:client] |> ExFootball.Match.all!()

        assert res.body["matches"] != nil
      end
    end
  end
end
