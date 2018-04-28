defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  def insert(nil, value), do: new(value)

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(%{data: data, left: left, right: right}, value) do
    if value <= data do
      %{data: data, left: insert(left, value), right: right}
    else
      %{data: data, left: left, right: insert(right, value)}
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    in_order(tree, [])
    |> Enum.reverse
  end

  def in_order(nil, accum) do
    accum
  end

  def in_order(tree, accum) do
    left = in_order(tree.left, accum)
    middle = [tree.data | left]
    in_order(tree.right, middle)
  end
end