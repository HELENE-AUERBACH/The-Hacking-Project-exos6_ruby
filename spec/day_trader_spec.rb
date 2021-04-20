require_relative '../lib/day_trader.rb'

describe "the day_trader method" do
  it "should return, from the prices stored in the \"trader_price_array\" argument, the first best day to buy and the first best day to sell to make maximum profit when prices are numbers" do
    expect(day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
    expect(day_trader([17.5, 3, 3, 9, 15.0, 8, 6, 15, 10])).to eq([1, 4])
    expect(day_trader([1, 2, 3])).to eq([0, 2])
    expect(day_trader([1, 0.25, 8, 7])).to eq([1, 2])
    expect(day_trader([1, -1])).to eq([0, 1])
  end

  it "should return nil if the \"trader_price_array\" argument is nil either is NOT a nonempty array of two or more numbers" do
    expect(day_trader(nil)).to eq(nil)
    expect(day_trader([])).to eq(nil)
    expect(day_trader(["0", 5])).to eq(nil)
    expect(day_trader([1])).to eq(nil)
    expect(day_trader({"Day 1" => 17, "Day 2" => 20, "Day 3" => 5.5})).to eq(nil)
  end
end
