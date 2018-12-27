defmodule ExFootball do
  @moduledoc """
  Simple Elixir client for football-data.org API v2
  """

  @doc false
  def helper do
    quote do
      import ExFootball.Client
      import ExFootball.Filters
    end
  end

  @doc false
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
