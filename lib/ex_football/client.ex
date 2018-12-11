defmodule ExFootball.Client do
  defstruct api_token: nil, api_uri: nil

  @api_base_url "http://api.football-data.org/v2"

  def new(%ExFootball.Client{} = client, token) do
    %{client | api_token: token, api_uri: "#{@api_base_url}"}
  end
end
