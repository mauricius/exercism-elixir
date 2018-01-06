defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.
  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    if !String.match?(string, ~r{[^10]}) do
      String.graphemes(string)
      |> Enum.map(&String.to_integer/1)
      |> Enum.reverse
      |> Enum.with_index
      |> Enum.map(fn({v, i}) -> :math.pow(2, i) * v end)
      |> Enum.sum
    else
      0
    end
  end
end