class Cell

	attr_accessor :value
	attr_accessor :position

	def solved?
		self.value.to_i > 0
	end
	
end