defmodule ExFootball do
  @moduledoc """
  """
  def fetch(client, resource, sub_resource \\ :empty, params \\ []) do
    client
    |> build_uri(resource, sub_resource, params)
    |> HTTPoison.get("x-auth-token": client.api_token)
    |> handle_response()
  end

  def build_uri(client, resource, sub_resource, params) do
    uri = "#{client.api_uri}/#{resource}"
    filter = build_params(params)

    case params do
      [{:id, resource_id} | _rest] -> uri <> "/#{resource_id}/#{sub_resource}/?#{filter}"
      ^params -> uri <> "/?#{filter}"
    end
  end

  def handle_response({:ok, %{status_code: status_code, body: body}}) do
    {
      status_code |> check_status(),
      body |> Poison.Parser.parse!(%{})
    }
  end

  def handle_response({:error, error}), do: {:error, error}

  defp build_params(params) do
    params
    |> Enum.map(&compile_param/1)
    |> Enum.join("&")
  end

  defp compile_param({key, value}) when key != :id do
    "#{Atom.to_string(key)}=#{value}"
  end

  defp compile_param(_), do: ""

  defp check_status(200), do: :ok
  defp check_status(_), do: :error
end
