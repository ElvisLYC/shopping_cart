class Checkout
	require 'ostruct'
	# define the products
	PRODUCTS = {
		"001" => Item.new("001", "Red Scarf", 9.25),
		"002" => Item.new("002", "Silver Cufflinks", 45.00),
		"003" => Item.new("003", "Silk Dress", 19.95),
	}

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @cart = Cart.new
  end

  def scan(code)
    @cart.add_item(PRODUCTS[code])
  end

  def total
    total_price = @cart.total

    # apply promotions
    PROMOTIONAL_RULES.each do |rule|
      case rule.type
      when :spend_over_60
        total_price *= 0.9 if total_price > 60
      when :reduce_red_scarf_price
        count = @cart.count("001")
        total_price -= (count * 0.75) if count >= 2
      end
    end

    total_price.round(2)
  end
end