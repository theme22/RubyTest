module CartElement

	class Product

		attr_accessor :code, :name, :price, :type

		def initialize(params)
			params.each { |key,val| self.instance_variable_set("@#{key}", val) }
			@type = "Product"
		end
	end
	
	class Discount

		attr_accessor :code, :name, :trigger, :threshold, :price, :type
		
		def initialize(params)
			params.each { |key,val| self.instance_variable_set("@#{key}", val) }
			@type = "Discount"
		end
		
	end
	
	class DiscountBulk < CartElement::Discount
					
		def initialize(params)
			super(params)
		end
		
		def calculate(products)
		
			# Get product thast causes the trigger (main in a group, when handing out group discounts)
			product = products.find { |item| item.object.code == @trigger }
			
			discount = 0
			quantity = 0
			
			if product.quantity >= @threshold
				discount = @price
				quantity = product.quantity
			end
			
			result = {"quantity" => quantity, "price" => discount, "subtotal" => quantity * discount}
		end
		
	end
		
	class DiscountBlock < CartElement::Discount
		
		def initialize(params)
			super(params)
		end
		
		def calculate(products)
		
			# Get product thast causes the trigger (main in a group, when handing out group discounts)
			product = products.find { |item| item.object.code == @trigger }
			
			discount = 0
			quantity = 0
			
			if product.quantity >= @threshold
				discount = @price
				quantity = (product.quantity / @threshold).floor()
			end
			
			result = {"quantity" => quantity, "price" => discount, "subtotal" => quantity * discount}
		end
		
	end

end