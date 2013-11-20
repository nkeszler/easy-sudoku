class Grid

	attr_accessor :cells

	def convert_num_to_cell(num)
		cell = Cell.new
		cell.value = num
		cell
	end

	def extract_row_as_cells(split_array)
		split_array.slice!(0,9).map do |num|   
			convert_num_to_cell(num)
		end
	end

	def extract_all_rows(split_array)
		9.times.map {extract_row_as_cells(split_array)}
	end

	def convert_to_2d_array(puzzle)
		array_2d = extract_all_rows(puzzle.split(""))
	end

	def determine_box(y_index, x_index)
		box = x_index / 3 + (y_index / 3) * 3 
	end

	def assign_positions(rows)
		rows.each_with_index do |row, y_index|
			assign_cell_positions_in(row, y_index)
		end
	end

	def assign_cell_positions_in(row, y_index)
		row.each_with_index do |cell, x_index|
			cell.position = {:y_index => y_index, :x_index => x_index, :box => determine_box(y_index, x_index)}
		end
	end

	def initialize(puzzle)
		self.cells = assign_positions(convert_to_2d_array(puzzle))
	end
	
end