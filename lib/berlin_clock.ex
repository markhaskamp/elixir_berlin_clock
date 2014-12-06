defmodule BerlinClock do

#  l1: 1 column,   even/odd
#  l2: 4 columns,  5 hours per
#  l3: 4 columns,  1 hour per
#  l4: 11 columns, 5 minutes per
#  l5: 4 columns,  1 minute per

  # {h, m, s} = :erlang.time 
  def parse_time(s) do
  end

  def berlin_second({_h, _m, s}) when (rem(s,2) == 0), do: "*"
  def berlin_second(_), do: "."

  def berlin_5_hour({h, _m, _s}) do
    on_count = round(Float.floor(h / 5))
    b_5_on(on_count)
  end

  def b_5_on(0), do: "...."
  def b_5_on(1), do: "*..."
  def b_5_on(2), do: "**.."
  def b_5_on(3), do: "***."
  def b_5_on(4), do: "****"



end
