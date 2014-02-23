require 'test/unit'
require './test_engine'
Dir["../lib/*.rb"].each {|file| require file }

class TestAdd < Test::Unit::TestCase
  
	def test_cart_population01
		
		# Set up test combination
		cart = TestEngine.cart_fill(TestEngine.cart_setup, ["GR1","SR1","GR1","GR1","CF1"]);
		
		# Assert
		assert(cart.Total == 22.45, "Fatal error: #{cart.Total} != 22.45")
	end
	
	def test_cart_population02
		
		# Set up test combination
		cart = TestEngine.cart_fill(TestEngine.cart_setup, ["GR1","GR1"]);
		
		# Assert
		assert(cart.Total == 3.11, "Fatal error: #{cart.Total} != 3.11")
	end
	
	def test_cart_population03
		
		# Set up test combination
		cart = TestEngine.cart_fill(TestEngine.cart_setup, ["SR1","SR1","GR1","SR1"]);
		
		#Render.Cart(cart)
		
		# Assert
		assert(cart.Total == 16.61, "Fatal error: #{cart.Total} != 16.61")
	end
	
end





