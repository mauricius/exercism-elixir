defmodule PigLatin do
  @moduledoc """
    Given a `phrase`, translate it a word at a time to Pig Latin.
    Words beginning with consonants should have the consonant moved to the end of
    the word, followed by "ay".
    Words beginning with vowels (aeiou) should have "ay" added to the end of the
    word.
    Some groups of letters are treated like consonants, including "ch", "qu",
    "squ", "th", "thr", and "sch".
    Some groups are treated like vowels, including "yt" and "xr".
  """

  @doc """
    Macro for checking special cases
  """
  defmacro qu_case(first, second) do
    quote do
      unquote(first) == "q" and unquote(second) == "u"
    end
  end

  defmacro xy_case(first) do
    quote do
      unquote(first) == "x" or unquote(first) == "y"
    end
  end

  @vowels ~w(a e i o u)

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word(&1))
    |> Enum.join(" ")
  end

  def translate_word(<<first::binary-size(1), _::binary>> = word) do
    case is_vowel?(first) do
      true -> build_vowel_word(word)
      false -> check_consonants(word)
    end
  end

  @doc """
    Define header for check_consonants
  """
  defp check_consonants(word, suffix \\ "")

  @doc """
    Base case for recursive check_consonants function
  """
  defp check_consonants("", suffix), do: build_consonant_word("", suffix)

  @doc """
    Special case for recursive check_consonants function
  """
  defp check_consonants(<<first::binary-size(1), second::binary-size(1), rest::binary>> = _word, suffix) when qu_case(first, second) do
    build_consonant_word(rest, suffix <> "qu")
  end

  @doc """
    Special case for recursive check_consonants function
  """
  defp check_consonants(<<first::binary-size(1), second::binary-size(1), rest::binary>> = word, _suffix) when xy_case(first) do
    case is_vowel?(second) do
      true -> build_consonant_word(second <> rest, first)
      false -> build_vowel_word(word)
    end
  end

  @doc """
    General case for recursive check_consonants function
  """
  defp check_consonants(<<first::binary-size(1), rest::binary>> = word, suffix) do
    case is_vowel?(first) do
      true -> build_consonant_word(word, suffix)
      false -> check_consonants(rest, suffix <> first)
    end
  end

  defp build_vowel_word(word), do: word <> "ay"

  defp build_consonant_word(rest, suffix), do: rest <> suffix <> "ay"

  @doc """
    Checks if a letter is a vowel
    ## Examples
      iex> PigLatin.is_vowel?('a')
      true
      iex> PigLatin.is_vowel?('c')
      false
  """
  def is_vowel?(letter), do: Enum.member?(@vowels, letter)
end