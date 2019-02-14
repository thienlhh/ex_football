defmodule ExFootball.CompetitionTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    {:ok, client: ExFootball.Client.new("api_token")}
  end

  describe "all!/2" do
    test "return all competetions", context do
      use_cassette "competition.all!1" do
        res = context[:client] |> ExFootball.Competition.all!()

        assert length(res.body["competitions"]) > 0
      end
    end

    test "return competitions with filters", context do
      use_cassette "competition.all!2" do
        res = context[:client] |> ExFootball.Competition.all!(plan: "TIER_FOUR")

        assert length(res.body["competitions"]) > 0
        assert res.body["filters"] == %{"plan" => "TIER_FOUR"}
      end
    end
  end

  describe "find!/2" do
    test "resturn particular competition", context do
      use_cassette "competition.find!1" do
        res = context[:client] |> ExFootball.Competition.find!(2021)

        assert res.body["id"] == 2021
        assert res.body["name"] == "Premier League"
      end
    end

    test "return forbidden error when using TIER_ONE plan", context do
      use_cassette "competition.find!2" do
        res = context[:client] |> ExFootball.Competition.find!(2006)

        assert res.status == 403

        assert res.body["message"] ==
                 "The resource you are looking for is restricted. Please pass a valid API token and check your subscription for permission."
      end
    end
  end

  describe "matches!/3" do
    test "return matches with SCHEDULED status", context do
      use_cassette "competition.matches!" do
        res = context[:client] |> ExFootball.Competition.matches!(2021, status: "SCHEDULED")

        assert length(res.body["matches"]) > 0
        assert res.body["competition"]["id"] == 2021
        assert res.body["filters"] == %{"status" => ["SCHEDULED"]}
      end
    end
  end

  describe "teams!/3" do
    test "return all teams of particular competition", context do
      use_cassette "competition.teams!" do
        res = context[:client] |> ExFootball.Competition.teams!(2021)

        assert length(res.body["teams"]) > 0
      end
    end
  end

  describe "standings!/3" do
    test "return standings table of particular comptition", context do
      use_cassette "competition.standings!" do
        res = context[:client] |> ExFootball.Competition.standings!(2021)

        assert length(res.body["standings"]) > 0
      end
    end
  end

  describe "scorers!/3" do
    test "return standings table of particular comptition", context do
      use_cassette "competition.scorers!" do
        res = context[:client] |> ExFootball.Competition.scorers!(2021)

        assert length(res.body["scorers"]) > 0
      end
    end
  end
end
