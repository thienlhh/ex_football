defmodule ExFootball do
  @moduledoc """
  Simple Elixir client for football-data.org API v2
  """

  @end_point "http://api.football-data.org/v2"

  @doc """
  Fetch data from football-data resources

  ## Examples
    Get all competitions
    ```
    > ExFootball.fetch("api_token", "competitions")
    ```

    Get upcoming matches for Premier League
    ```
    > ExFootball.fetch("api_token", "competitions", "matches", [id: "PL", status: "SCHEDULED"])
    ```

    Get all matches of the Champions League
    ```
    > ExFootball.fetch("api_token", "competitions", "matches", [id: "CL"])
    ```
  """
  @spec fetch(binary, binary, binary, Keyword.t) :: {:ok, term} | {:error, term}
  def fetch(api_token, resource, sub_resource \\ "", params \\ []) do
    build_uri(resource, sub_resource, params)
    |> append_params(params)
    |> process_url()
    |> HTTPoison.get("x-auth-token": api_token)
    |> handle_response()
  end

  defp process_url(url) do
    @end_point <> url
  end

  defp handle_response({:ok, %{status_code: status_code, body: body}}) do
    {
      status_code |> check_status(),
      body |> Poison.Parser.parse!(%{})
    }
  end

  defp handle_response({:error, error}), do: {:error, error}

  defp build_uri(resource, sub_resource, params) do
    case Keyword.get(params, :id) do
      resource_id when is_bitstring(resource_id) ->
        "/#{resource}/#{resource_id}/#{sub_resource}"

      nil ->
        "/#{resource}"
    end
  end

  defp append_params(url, params) do
    filter =
      params
      |> Enum.map(&compile_param/1)
      |> Enum.join("&")

    url <> "?#{filter}"
  end

  defp compile_param({key, value}) when key != :id do
    "#{Atom.to_string(key)}=#{value}"
  end

  defp compile_param(_), do: ""

  defp check_status(200), do: :ok
  defp check_status(_), do: :error
end
