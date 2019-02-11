defmodule ExFootball.ClientTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, api_token: Application.get_env(:ex_football, :api_token)}
  end

  describe "get!/2" do
    test "return result with status 200", context do
      response =
        ExFootball.Client.new(context[:api_token])
        |> ExFootball.Client.get!("/competitions")

      assert response.status == 200
    end

    test "return invalid token error" do
      response =
        ExFootball.Client.new(nil)
        |> ExFootball.Client.get!("/competitions")

      assert response.status == 400
      assert response.body["message"] == "Your API token is invalid."
    end
  end
end
