module TestEngine

	def TestEngine.cart_setup
		# Set virtual discounts table
		active_discounts = Array.new
		active_discounts.push(CartElement::DiscountBlock.new({"code" => "GR1-D01", "name" => "Green tea 2 for 1", "trigger" => "GR1", "threshold" => 2, "price" => -3.11}));
		active_discounts.push(CartElement::DiscountBulk.new({"code" => "SR1-D01", "name" => "Cheaper strawberries", "trigger" => "SR1", "threshold" => 3, "price" => -0.5}));

		# Set virtual products table
		products = Array.new
		products.push(CartElement::Product.new({"code" => "GR1", "name" => "Green tea", "price" => 3.11}))
		products.push(CartElement::Product.new({"code" => "SR1", "name" => "Strawberries", "price" => 5.00}))
		products.push(CartElement::Product.new({"code" => "CF1", "name" => "Coffee", "price" => 11.23}))

		# Simulate storage access 
		cart = Cart.new({"discounts" => active_discounts, "products" => products})
	end
	
	def TestEngine.cart_fill(cart, products)
		products.each() { |code| cart.AddProduct(code) }
		cart
	end
	
end