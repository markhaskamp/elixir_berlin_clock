defmodule BerlinClockTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "line 1. even seconds" do
    assert ("*" == BerlinClock.berlin_second({1,1,2}))
  end

  test "line 1. odd seconds" do
    assert ("." == BerlinClock.berlin_second({1,1,1}))
  end

  test "line 2. 5 hour dots" do
    assert ("...." == BerlinClock.berlin_5_hour({0,0,0}))
    assert ("...." == BerlinClock.berlin_5_hour({1,0,0}))
    assert ("...." == BerlinClock.berlin_5_hour({2,0,0}))
    assert ("...." == BerlinClock.berlin_5_hour({3,0,0}))
    assert ("...." == BerlinClock.berlin_5_hour({4,0,0}))
    assert ("*..." == BerlinClock.berlin_5_hour({5,0,0}))
    assert ("**.." == BerlinClock.berlin_5_hour({10,0,0}))
    assert ("***." == BerlinClock.berlin_5_hour({15,0,0}))
    assert ("****" == BerlinClock.berlin_5_hour({20,0,0}))
    assert ("****" == BerlinClock.berlin_5_hour({21,0,0}))
  end


  test "line 3. 1 hour dots" do
    assert ("...." == BerlinClock.berlin_1_hour({0,0,0}))
    assert ("*..." == BerlinClock.berlin_1_hour({1,0,0}))
    assert ("**.." == BerlinClock.berlin_1_hour({2,0,0}))
    assert ("***." == BerlinClock.berlin_1_hour({3,0,0}))
    assert ("****" == BerlinClock.berlin_1_hour({4,0,0}))
  end

  test "line 4. 5 minute dots" do
    assert ("..........." == BerlinClock.berlin_5_minute({0, 3, 0}))
    assert ("*.........." == BerlinClock.berlin_5_minute({0, 8, 0}))
  end

  test "00:00:00" do
    assert ["*", "....", "....", "...........", "...."] == BerlinClock.parse_time({0, 0, 0})
  end

  test "13:17:01" do
    assert [".", "**..", "***.", "***........", "**.."] == BerlinClock.parse_time({13, 17, 01})
  end

  test "23:59:59" do
    assert [".", "****", "***.", "***********", "****"] == BerlinClock.parse_time({23, 59, 59})
  end

end


