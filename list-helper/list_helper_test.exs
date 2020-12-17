if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("list_helper.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule ListHelperTest do
  use ExUnit.Case

  test "the sum returns 0 if the list is empty" do
    assert ListHelper.sum([]) === 0
  end

  test "the sum returns the element if the list contains only one element" do
    assert ListHelper.sum([3]) === 3
  end

  test "the sum returns the the sum of all the elements of the list" do
    assert ListHelper.sum([1,2,3,4]) === 10
  end


  test "the length returns 0 if the list is empty" do
    assert ListHelper.list_len([]) === 0
  end

  test "the length returns 1 the list contains only one element" do
    assert ListHelper.list_len([3]) === 1
  end

  test "the length returns the the size of the list" do
    assert ListHelper.list_len([1,2,3,4]) === 4
  end


  test "the range returns a list with one element if the numbers of the range are equal" do
    assert ListHelper.range(1, 1) === [1]
  end

  test "the range returns an error if the first element is bigger than the second" do
    assert ListHelper.range(2, 1) === {:error, "a is greater than b"}
  end

  test "the range returns a list with all numbers in the given range" do
    assert ListHelper.range(1, 4) === [1,2,3,4]
  end


  test "the positive returns an empty list if the input list is empty" do
    assert ListHelper.positive([]) === []
  end

  test "the positive returns the same list if it does not contain negative numbers" do
    assert ListHelper.positive([1,2,3,4]) === [1,2,3,4]
  end

  test "the positive returns the list without negative numbers" do
    assert ListHelper.positive([-2, -1, 1, 2, 3, 4]) === [1,2,3,4]
  end

  test "the positive removes also the number zero" do
    assert ListHelper.positive([-1, 0, 1, 2, 3, 4]) === [1,2,3,4]
  end
end