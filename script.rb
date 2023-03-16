require_relative 'lib/item'
require_relative 'lib/cart'
require_relative 'lib/checkout'

PROMOTIONAL_RULES = [
	OpenStruct.new(type: :spend_over_60),
	OpenStruct.new(type: :reduce_red_scarf_price),
]

co = Checkout.new(PROMOTIONAL_RULES)
co.scan("001")
co.scan("002")
co.scan("003")
puts co.total # expect: 66.78

co = Checkout.new(PROMOTIONAL_RULES)
co.scan("001")
co.scan("003")
co.scan("001")
puts co.total # expect: 36.95

co = Checkout.new(PROMOTIONAL_RULES)
co.scan("001")
co.scan("002")
co.scan("001")
co.scan("003")
puts co.total # expect: 73.76