defmodule AdventOfCode.Day2JansApproach do
  @tokens %{
    "A" => :rock,
    "B" => :paper,
    "C" => :scissors,
    "X" => :rock,
    "Y" => :paper,
    "Z" => :scissors
  }

  @points %{
    rock: 1,
    paper: 2,
    scissors: 3
  }

  defp rps(a, a), do: 3

  defp rps(:rock, :paper), do: 0
  defp rps(:rock, :scissors), do: 6
  defp rps(:paper, :rock), do: 6
  defp rps(:paper, :scissors), do: 0
  defp rps(:scissors, :rock), do: 0
  defp rps(:scissors, :paper), do: 6
  defp token(letter), do: Map.get(@tokens, letter)
  defp grade([a, b]), do: rps(b, a) + Map.get(@points, b)

  def part_1() do
    "./cache/day2.txt"
    |> File.stream!()
    |> Enum.reduce(0, &parse_line/2)
  end

  defp parse_line(line, acc) do
    line
    |> String.trim_trailing("\n")
    |> String.split()
    |> Enum.map(&token/1)
    |> grade()
    |> Kernel.+(acc)
  end
end
