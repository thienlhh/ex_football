defmodule ExFootball.Client do
  @moduledoc """
  Struct which represents the ExFootball client
  """
  defstruct api_token: nil

  @end_point "http://api.football-data.org/v2"

  @doc """
  Create new Exfootball client

  ## Examples:
  ```
  iex> client = ExFootball.Client.new("api_token")
  %ExFootball.Client{api_token: "api_token"}
  ```

  """
  def new(api_token) do
    %__MODULE__{api_token: api_token}
  end

  def get!(client, path) do
    process_url(path)
    |> HTTPoison.get!("x-auth-token": client.api_token)
    |> process_response()
  end

  defp from_json!(data) do
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
