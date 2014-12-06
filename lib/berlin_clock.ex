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


end
