def day_trader(trader_price_array)
  result = nil
  if !trader_price_array.nil? && trader_price_array.instance_of?(Array) && trader_price_array.length >= 2 && trader_price_array.all? { |element| element.is_a?(Integer) || element.is_a?(Float) }
    price_min, price_max = nil, nil
    index_for_price_min, index_for_price_max = 0, 0
    trader_price_array.each_with_index do |element, index|
      price_min, index_for_price_min = element, index if price_min.nil? || (price_max.nil? && element < price_min && trader_price_array.length-1 > index) || (!price_max.nil? && index < index_for_price_max && element < price_min)
      price_max, index_for_price_max = element, index if (price_max.nil? && index > index_for_price_min) || (!price_max.nil? && index > index_for_price_min && element > price_max)
    end
    result = [index_for_price_min, index_for_price_max]
  end
  result
end

puts "#{day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])}" # => [1, 4] because $15 - $3 == $12
