defmodule ListHelper do
  @doc """
  Sums the element of a list
  """
  @spec sum(List.t()) :: Number.t()
  def sum(list) do
    do_sum(0, list)  
  end

  defp do_sum(current_sum, []) do
    current_sum
  end

  defp do_sum(current_sum, [head | tail]) do
    do_sum(head + current_sum, tail)
  end

  @doc """
  Computes the length of a list
  """
  @spec list_len(List.t()) :: Number.t()
  def list_len(list) do
    accumulator = 0

    do_list_len(accumulator, list)
  end

  defp do_list_len(accumulator, []) do
    accumulator
  end

  defp do_list_len(accumulator, [_ | tail]) do
    do_list_len(accumulator + 1, tail)
  end


  @doc """
  Builds a list from a range of numbers
  """
  @spec range(Number.t(), Number.t()) :: List.t()
  def range(a, b) when a === b, do: [a]

  def range(a, b) when a > b, do: {:error, "a is greater than b"}

  def range(a, b) when a < b do
    do_range([], a, b)
  end

  defp do_range(list, a, b) when a === b do
    [a | list]
  end

  defp do_range(list, a, b) do
    list = [b | list]
    
    do_range(list, a, b - 1)
  end

  @doc """
  Filters all positive integers from a list
  """
  @spec positive(List.t()) :: List.t()
  def positive(list) do
    do_positive(list, [])
  end

  defp do_positive([], accumulator) do
    Enum.reverse(accumulator)
  end

  defp do_positive([head | tail], accumulator) when head > 0 do
    do_positive(tail, [head | accumulator])
  end

  defp do_positive([_ | tail], accumulator) do
    do_positive(tail, accumulator)
  end
end