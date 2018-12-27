defmodule ExFootball.Filters do
  def build_filters(filters) when length(filters) > 0 do
    res =
      filters
      |> Enum.map(&compile_param(&1))
      |> Enum.join("&")

    "?" <> res
  end

  def build_filters([]), do: ""

  defp compile_param({key, value}), do: "#{Atom.to_string(key)}=#{value}"
end
