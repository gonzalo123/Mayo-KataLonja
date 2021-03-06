class Fisherman

  attr_reader :stock, :markets
  attr_writer :stock

  def initialize(name)
    @name     = name
    @markets  = []
    @distance = {}
  end

  def stock_value_in(market)
    market.value_of(@stock)
  end

  def set_distance_from_market(market, distance)
    @distance[market] = distance
  end

  def truck_charges_for(market)
    5 + 2 * @distance[market]
  end

  def stock_depreciation_for(market)
    stock_value_in(market) * @distance[market] / 100 / 100
  end

  def net_incomes_in(market)
    stock_value_in(market) - stock_depreciation_for(market) - truck_charges_for(market)
  end

  def knows_market(market)
    @markets << market
  end

  def best_market
    potential_incomes = @markets.collect { |market|
      {:market => market, :income => net_incomes_in(market)} }
    potential_incomes.max { |x, y| x[:income] <=> y[:income] }[:market]
  end

end