defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    lc_base = String.downcase(base)
    sorted = sort(lc_base)

    Enum.filter(candidates, fn candidate ->
      lc_candidate = String.downcase(candidate)

      lc_candidate != lc_base and sort(lc_candidate) == sorted
    end)
  end

  defp sort(s) do
    s
    |> String.graphemes
    |> :lists.sort()
  end
end