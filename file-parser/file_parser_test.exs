if !System.get_env("EXERCISM_TEST_EXAMPLES") do
   Code.require_file("file_parser.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule FileParserTest do
  use ExUnit.Case

  setup do
    {:ok, file} = File.open("test.txt", [:write])

    on_exit(fn ->
      File.rm("test.txt")
    end)

    {:ok, %{f: file}}
  end

  test "the large_lines! function should return 0 if there are nolines with more than 80 characters", context do
    IO.binwrite(context.f, "hello\nworld")

    assert Enum.count(FileParser.large_lines!("test.txt")) === 0
  end

  test "the large_lines! function should return the number of lines with more than 80 characters", context do
    IO.binwrite(context.f, String.duplicate("a", 81))

    assert Enum.count(FileParser.large_lines!("test.txt")) === 1
  end

  test "the lines_length! function should return the number of lines in the file", context do
    IO.binwrite(context.f, "hello\nworld")

    assert Enum.count(FileParser.lines_length!("test.txt")) === 2
  end

  test "the longest_line_length! function should return the length of the longest line in the file", context do
    IO.binwrite(context.f, "h\nhe\nhel\nhell\nhello")

    assert FileParser.longest_line_length!("test.txt") === 5
  end

  test "the longest_line! function should return the longest line in the file", context do
    IO.binwrite(context.f, "h\nhe\nhel\nhell\nhello")

    assert FileParser.longest_line!("test.txt") === "hello"
  end

  test "the words_per_line! function should return the number of words per each line in the file", context do
    IO.binwrite(context.f, "first\nsecond line\nthird\nfourth line\nfifth")

    assert FileParser.words_per_line!("test.txt") === [1,2,1,2,1]
  end
end