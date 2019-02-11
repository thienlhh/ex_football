defmodule ExFootball.Client.Response do
  @moduledoc """
  Struct which represents the ExFootball API response data
  """
  defstruct [
    :body,
    :headers,
    :status
  ]
end
