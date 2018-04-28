defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_char_list(text)
    |> Enum.map_join(fn c ->
      cond do
        c >= 65 && c <= 90 ->
          <<65 + rem(c - 65 + shift, 26)::utf8>>

        c >= 97 && c <= 122 ->
          <<97 + rem(c - 71 + shift, 26)::utf8>>

        true ->
          <<c::utf8>>
      end
    end)
  end
end

IO.inspect RotationalCipher.rotate("Attack at dawn", 13)