defmodule FileParser do
  def filter_lines!(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
  end

  @doc """
  Count large lines in a file
  """
  def large_lines!(path) do
    path
    |> filter_lines!()
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_length!(path) do
    path
    |> filter_lines!()
    |> Enum.map(&(String.length(&1)))
  end

  def longest_line_length!(path) do
    path
    |> lines_length!()
    |> Enum.max()
  end

  def longest_line!(path) do
    path
    |> filter_lines!()
    |> Enum.max_by(&(String.length(&1)))
  end

  def words_per_line!(path) do
    path
    |> filter_lines!()
    |> Enum.map(&(length(String.split(&1))))
  end
end