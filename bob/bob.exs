
defmodule Bob do
   @doc """
  Answers to `hey` like a teenager.

  ## Examples
  iex> Bob.hey("")
  "Fine. Be that way!"

  iex> Bob.hey("Do you like math?")
  "Sure."

  iex> Bob.hey("HELLO!")
  "Whoa, chill out!"

  iex> Bob.hey("Coding is cool.")
  "Whatever."
  """
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      shouting_question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp silence?(input) do "" == String.trim(input) end
  defp question?(input) do String.ends_with?(input, "?") end
  defp shouting?(input) do input == String.upcase(input) && Regex.match?(~r/\p{L}+/, input) end
  defp shouting_question?(input) do shouting?(input) && question?(input) end
end