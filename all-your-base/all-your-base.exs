defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """
  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b) do
    with {:ok} <- check_positive_list(digits),
         {:ok} <- check_valid_list(digits, base_a) do
      cond do
        base_a > 1 and base_b > 1 and digits != [] ->
          digits
          |> Enum.with_index
          |> Enum.reduce(0, fn({num, idx}, acc) ->
              acc + (num * :math.pow(base_a, (Enum.count(digits) - idx - 1)) |> round)
          end)
          |> Integer.digits(base_b)
        true ->
          nil
      end
    else
      nil
    end
  end

  def check_positive_list(digits) do
    case digits |> Enum.all?(&(&1 > -1)) do
      true -> {:ok}
      _ -> nil
    end
  end

  def check_valid_list(digits, base) do
    case digits |> Enum.all?(&(&1 < base)) do
      true -> {:ok}
      _ -> nil
    end
  end
end


IO.inspect AllYourBase.convert([1, 0, 1], 2, 10)