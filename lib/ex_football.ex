defmodule ExFootball do
  @moduledoc """
  Elixir client for football-data.org
  """

  use HTTPoison.Base

  @end_point "http://api.football-data.org/v2"

  def fetch(api_token, resource, sub_resource \\ "", params \\ []) do
    build_url(resource, sub_resource, params)
    |> append_params(params)
    |> ExFootball.get("x-auth-token": api_token)
    |> handle_response()
  end

  def process_url(url) do
    @end_point <> url
  end

  def process_headers(headers) do
    case headers do
      [{"x-auth-token", _}] -> headers
      _ -> []
    end
  end

  defp handle_response({:ok, %{status_code: status_code, body: body}}) do
    {
      status_code |> check_status(),
      body |> Poison.Parser.parse!(%{})
    }
  end

  defp handle_response({:error, error}), do: {:error, error}

  defp build_url(resource, sub_resource, params) do
    case Keyword.get(params, :id) do
      nil -> "/#{resource}"
      resource_id -> "/#{resource}/#{resource_id}/#{sub_resource}"
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
