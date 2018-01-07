defmodule Words do
  @punctuation ~r/!|"|%|&|\$|@|%|'|\(|\)|\*|\+|,|\.|\/|:|;|<|=|>|\?|\[|\\|]|\^|_|`|\{|\||}|~/

  @doc """
  Count the number of words in the sentence.
  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> remove_punctuation
    |> String.downcase
    |> String.split
    |> occurrences
  end

  defp remove_punctuation(string) do
    # unfortunately this will remove hyphens as well
    # String.replace(string,  ~r/[\p{P}\p{S}]/, "")
    String.replace(string, @punctuation, " ")
  end

  defp occurrences(words) when is_list(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

   defp update_count(word, acc) do
    Map.update acc, word, 1, &(&1 + 1)
  end
end