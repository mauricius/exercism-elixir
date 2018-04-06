defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    # unfortunately this will not split HyperText
    # Regex.replace(~r/[^a-zA-Z0-9]+/, string, " ")
    Regex.scan(~r/[A-Z]+[a-z]*|[a-z]+/, string)
    |> List.flatten()
    |> Enum.map(fn x -> String.slice(x, 0, 1) end)
    |> Enum.join("")
    |> String.upcase()
  end
end