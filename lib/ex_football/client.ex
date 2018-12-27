defmodule ExFootball.Client do
  defstruct api_token: nil

  @end_point "http://api.football-data.org/v2"

  def new(api_token) do
    %__MODULE__{api_token: api_token}
  end

  def set_api_token(%__MODULE__{} = client, new_token) do
    Map.put(client, :api_token, new_token)
  end

  def get!(client, path) do
      process_url(path)
      |> HTTPoison.get!("x-auth-token": client.api_token)
      |> process_response()
  end

  def from_json!(data) do
    Poison.decode!(data)
  end

  defp process_url(url) do
    @end_point <> url
  end

  defp process_response(res) do
    %ExFootball.Client.Response{
      status: res.status_code,
      body: from_json!(res.body),
      headers: res.headers
    }
  end
end
