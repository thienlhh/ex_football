defmodule ExFootball.ClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  describe "get!/2" do
    test "return result with status 200" do
      use_cassette "client.get!" do
        response =
          ExFootball.Client.new("api_token")
          |> ExFootball.Client.get!("/competitions")

        assert response.status == 200
      end
    end

    test "return invalid token error" do
      use_cassette "client.get!error" do
        response =
          ExFootball.Client.new(nil)
          |> ExFootball.Client.get!("/competitions")

        assert response.status == 400
        assert response.body["message"] == "Your API token is invalid."
      end
    end
  end
end
