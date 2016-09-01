# Based on @veelenga's solution

defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a) do
    :equal
  end
  def compare(a, b) do
    cond do
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?(a, b) when length(a) > length(b), do: false
  defp sublist?(a, b) do
    if same_leading_elements?(a, b) do
      true
    else
      sublist?(a, tl(b))
    end
  end

  # If and b have the same heads, repeatedly chop off the heads,
  # and compare the tails, until the shorter list is empty
  defp same_leading_elements?([], _), do: true
  defp same_leading_elements?([h | tail_a], [h | tail_b]) do
    same_leading_elements?(tail_a, tail_b)
  end
  defp same_leading_elements?(_, _), do: false
end
