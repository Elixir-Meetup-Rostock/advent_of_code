defmodule AdventOfCode.Day1 do
  defp calories() do
    {:ok, content} = File.read("./cache/day1_1.txt")

    content
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(&get_elf/1)
    |> Enum.map(&sum_elf_calories/1)
  end

  def part_1() do
    calories()
    |> Enum.max()
  end

  def part_2() do
    calories()
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp get_elf(input), do: String.split(input, "\n")

  defp sum_elf_calories(list) do
    list |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end
end
