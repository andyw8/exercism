defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """

  @days_in_earth_year 365.25
  @seconds_in_an_hour 60
  @minutes_in_an_hour 60
  @hours_in_a_day 24
  @seconds_in_earth_day @seconds_in_an_hour * @minutes_in_an_hour * @hours_in_a_day
  @orbital_periods %{
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    neptune: 164.79132,
    uranus: 84.016846
  }

  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / (@seconds_in_earth_day * orbital_period_in_earth_days(planet))
  end

  defp orbital_period_in_earth_days(planet) do
    @orbital_periods[planet] * @days_in_earth_year
  end

end
