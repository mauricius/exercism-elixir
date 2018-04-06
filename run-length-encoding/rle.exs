defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.scan(~r/([a-zA-Z\s])\1*/, string)
    |> Enum.map_join(fn [run, c] ->
      times = String.length(run)

      if times == 1 do
        c
      else
        "#{times}#{c}"
      end
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    # The char that comes after one or more digits
    Regex.scan(~r/(\d*)(.)/, string)
    |> Enum.map_join(fn [_, n, c] ->
      times =
        if n == "" do
          1
        else
          String.to_integer(n)
        end

      String.duplicate(c, times)
    end)
  end
end