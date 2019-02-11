defmodule ExFootball do
  @moduledoc """
  Simple Elixir client for football-data.org API v2
  """

  @doc false
  defmacro __using__(_opts) do
    quote do
      import ExFootball.Client
      import ExFootball.Filters
    end
  end
end
