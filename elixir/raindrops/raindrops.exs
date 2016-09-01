defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @sounds %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @spec convert(pos_integer) :: String.t
  def convert(number) do
    result = ""

    result = if prime_factor?(number, 3) == 0, do: result <> @sounds[3], else: result
    result = if prime_factor?(number, 5) == 0, do: result <> @sounds[5], else: result
    result = if prime_factor?(number, 7) == 0, do: result <> @sounds[7], else: result

    if result == "" do
      to_string(number)
    else
      result
    end
  end

  defp prime_factor?(number, divisor) do
    rem(number, divisor)
  end
end
