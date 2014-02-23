class Render

	def Render.Cart(cart)
		
		items = cart.to_h
		
		puts "#{"Product code".ljust(12)}| #{"Name".ljust(21)} | #{"Quantity".rjust(13)} | #{"Price".rjust(12)}"
		puts "".ljust(66, "-")
		items.each(){|sym, val| puts "#{val["code"].ljust(12)} | #{val["name"].ljust(20)} | #{val["quantity"].to_s.rjust(3)} x #{sprintf('%.2f', val["price"].to_s).rjust(7)} | #{sprintf('%.2f', val["subtotal"].to_s).rjust(12)}"}
		puts "".ljust(66, "-")
		puts "Total: #{sprintf('%.2f', cart.Total.to_s).rjust(59)}"
	end

end