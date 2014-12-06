defmodule BerlinClockTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "even seconds" do
    assert ("*" == BerlinClock.berlin_second({1,1,2}))
  end

  test "odd seconds" do
    assert ("." == BerlinClock.berlin_second({1,1,1}))
  end

  #  test "00:00:00" do
  #    assert ["*", "....", "....", "...........", "...."] == BerlinClock.parse_time("00:00:00")
  #  end
end


#  (is (= '("*" "...." "...." "..........." "....") (berlin-clock (parse-time "00:00:00"))))
# (is (= '("." "**.." "***." "***........" "**..") (berlin-clock (parse-time "13:17:01"))))
# (is (= '("." "****" "***." "***********" "****") (berlin-clock (parse-time "23:59:59"))))) 
