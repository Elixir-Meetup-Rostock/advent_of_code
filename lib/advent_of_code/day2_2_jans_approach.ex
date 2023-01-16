defmodule Day2.Rules do
  @tokens %{
    "A" => :rock,
    "B" => :paper,
    "C" => :scissors,
    "X" => :loss,
    "Y" => :draw,
    "Z" => :win
  }

  @points %{
    rock: 1,
    paper: 2,
    scissors: 3,
    loss: 0,
    draw: 3,
    win: 6
  }

  def rps(a, a), do: :draw

  def rps(:rock, :paper), do: :loss
  def rps(:rock, :scissors), do: :win

  def rps(:paper, :rock), do: :win
  def rps(:paper, :scissors), do: :loss

  def rps(:scissors, :rock), do: :loss
  def rps(:scissors, :paper), do: :win

  @options @tokens |> Map.take(["A", "B", "C"]) |> Map.values()
  def points(token), do: Map.get(@points, token)

  def generate_result_list() do
    for t <- @options do
      for t2 <- @options do
        {{t, t2}, rps(t, t2)}
      end
    end
    |> List.flatten()
    |> Map.new()
  end




  def token(letter), do: Map.get(@tokens, letter)
end

defmodule Day2.Part2 do
  alias Day2.Rules

  @results Rules.generate_result_list()

  defp grade([a, b]), do: Rules.points(Rules.rps(b, a)) + Rules.points(b)

  def part_2() do
    "lib/day2/input.txt"
    |> File.stream!()
    |> Enum.reduce(0, &parse_line/2)
  end

  defp parse_line(line, acc) do
    line
    |> String.trim_trailing("\n")
    |> String.split()
    |> Enum.map(&Rules.token/1)
    |> find_response()
    |> grade()
    |> Kernel.+(acc)
  end

  defp find_response([t1, t2]) do
    @results
    |> Enum.find(fn
      {{_, ^t1}, ^t2} -> true
      _ -> false
    end)
    |> elem(0)
    |> elem(0)
    |> then(&[t1, &1])
  end
end
