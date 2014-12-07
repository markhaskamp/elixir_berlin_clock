defmodule BerlinClock do

#  l1: 1 column,   even/odd
#  l2: 4 columns,  5 hours per
#  l3: 4 columns,  1 hour per
#  l4: 11 columns, 5 minutes per
#  l5: 4 columns,  1 minute per

  # {h, m, s} = :erlang.time 

  def parse_time(t) do
    [berlin_second(t),
     berlin_5_hour(t),
     berlin_1_hour(t),
     berlin_5_minute(t),
     berlin_1_minute(t)]
  end

  def berlin_second({_h, _m, s}) when (rem(s,2) == 0), do: "*"
  def berlin_second({_h, _m, _s}), do: "."

  def berlin_5_hour({h, _m, _s}) do
    foo(4, h)
  end

  def berlin_1_hour({h, _m, _s}) do
    b_1_h(rem(h,5))
  end

  def berlin_5_minute({_h, m, _s}) do
    foo(11, m)
  end

  def berlin_1_minute({_h, m, _s}) do
    b_1_h(rem(m, 5))
  end

  defp b_1_h(0), do: "...."
  defp b_1_h(1), do: "*..."
  defp b_1_h(2), do: "**.."
  defp b_1_h(3), do: "***."
  defp b_1_h(4), do: "****"

  def foo(lights, h) do
      1..lights 
      |> Enum.map(fn(n) -> 
          if(h >= (n*5)) do
            '*'
          else
            '.'          
          end
         end)

      |> Enum.reduce(fn(c, acc) -> acc ++ c end)
      |> to_string
  end

end

