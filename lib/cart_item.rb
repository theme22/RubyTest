class CartItem
		
	attr_reader :object, :quantity, :subtotal, :price

	def initialize(object, params = {})
		@object = object
		@quantity = 1
		@subtotal = object.price
		@price = object.price
		
		if params != nil
			params.each { |key,val| self.instance_variable_set("@#{key}", val) }
		end
	end
	
	def alter_quantity(quantity = 1)
		@quantity += quantity
		self.calculate_subtotal
	end
	
	def set_quantity(quantity = 1)
		@quantity = quantity
		self.calculate_subtotal
	end
	
	def calculate_subtotal
		@subtotal = @quantity * @price
	end
	
	def to_h
		{"code" => @object.code, "name" => @object.name, "quantity" => @quantity, "price" => @price, "subtotal" => @subtotal}
	end
end