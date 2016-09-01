defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp shouting?(input) do
    String.upcase(input) == input and at_least_one_upper_case_letter?(input)
  end

  defp question?(input) do
    String.last(input) == "?"
  end

  defp silence?(input) do
    String.codepoints(input)
    |> Enum.all?(fn (char) -> char == " " end)
  end

  defp at_least_one_upper_case_letter?(input) do
    Regex.match?(~r/[[:upper:]]/, input)
  end
end
