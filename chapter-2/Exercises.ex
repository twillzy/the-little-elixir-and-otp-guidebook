defmodule Exercises do
  def sum(list) do
    Enum.reduce(list, fn(x, acc) -> x + acc end)
  end

  def sqr_sum10(list) do
    Enum.map_reduce(list, 10, fn(x, acc) -> { x * x, x + acc } end)
  end

  def flat_reverse_sqrt(list) do
    Enum.map(Enum.reverse(List.flatten(list)), fn(x) -> x * x end)
  end

  def flat_reverse_sqrt_pipe(list) do
    list
    |> List.flatten
    |> Enum.reverse
    |> Enum.map(fn(x) -> x * x end)
  end

  # deprecated and will be removed
  def crypto(secret) do
    :crypto.md5(secret)
  end
end
