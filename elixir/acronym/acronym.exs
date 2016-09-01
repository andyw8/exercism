defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> to_words
    |> normalize_case
    |> extract_capitals
    |> Enum.join
  end

  defp to_words(string) do
    String.split(string)
  end

  defp normalize_case(words) do
    # ensure that all words beginning with a capital letter
    Enum.map(words, &capitalize/1)
  end

  defp extract_capitals(words) do
    Enum.map(words, &extract_word_capitals/1)
  end

  defp extract_word_capitals(word) do
    Regex.scan(~r/[A-Z]/, word)
  end

  defp capitalize(word) do
    (String.first(word) |> String.upcase) <> String.slice(word, 1..-1)
  end
end
