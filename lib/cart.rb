class Cart
	
	attr_accessor :items, :total
		
	def initialize(tables)
		@items = Array.new
		@tables = tables
		@total = 0
	end

    def AddProduct(code)
		
		# Find if the product is already in the cart
		product = @items.find {|v| v.object.code == code}
		
		if product != nil
			product.alter_quantity(1);
		else
			# Storage connection simulation
			@items.push(CartItem.new(@tables["products"].find { |product| product.code == code}))
		end
	end
	
	def Total
		
		# Delete all the discount notions
		@items.delete_if { |item| item.object.type == "Discount" }
		
		# Product codes and products
		products = @items.find_all { |item| item.object.type == "Product" }
		product_codes = products.map { |item| item.object.code }
		
		# Find discounts that apply, storage connection simulation
		discounts = @tables["discounts"].find_all { |discount| product_codes.include?(discount.trigger) }
		
		discounts.each() do |discount| 
		
			# Check if the discount needs are fulfilled
			discount_data = discount.calculate(products)
			
			# If discount is active, add to cart item list
			if discount_data["subtotal"] != 0
				@items.push(CartItem.new(discount, discount_data))
			end
			
		end
		
		# Calculate total
		total = 0.0
		@items.each(){|item| total += item.subtotal}
		@total = total.round(2) # Avoid float imprecision; normally done on View level in Rails
	end
	
	def to_h
		self.Total
		items = {}
		@items.each(){|item| items[item.object.code] = item.to_h}
		@itemsHash = items
	end
end