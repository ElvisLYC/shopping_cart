class Cart
	def initialize
		@items = []
	end

	def add_item(item)
		@items << item
	end

	def total
		@items.inject(0) { |sum, item| sum + item.price }
	end

	def count(item_code)
		@items.select { |item| item.code == item_code }.count
	end
end