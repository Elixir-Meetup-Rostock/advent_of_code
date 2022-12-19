defmodule AdventOfCode.Day1 do
  def calories() do
    {:ok, content} = File.read("./cache/day1_1.txt")

    content
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(&get_elf/1)
    |> Enum.map(&sum_elf_calories/1)
    |> Enum.max()
  end

  defp get_elf(input), do: String.split(input, "\n")

  defp sum_elf_calories(list) do
    list |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end
end
