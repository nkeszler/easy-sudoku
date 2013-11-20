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
		array_of_rows = []
		9.times {array_of_rows << extract_row_as_cells(split_array)}
		array_of_rows
	end

	def convert_to_2d_array(puzzle)
		array_2d = extract_all_rows(puzzle.split(""))
	end

	def eliminate_boxes_for_y(box_options, y_index)
		case y_index
		when (0..2)
			box_options -= [3,4,5,6,7,8]
		when (3..5)
			box_options -= [0,1,2,6,7,8]
		when (6..8)
			box_options -= [0,1,2,3,4,5]
		end
		box_options
	end

	def eliminate_boxes_for_x(box_options, x_index)
		case x_index
		when (0..2)
			box_options -= [1,2,4,5,7,8]
		when (3..5)
			box_options -= [0,2,3,5,6,8]
		when (6..8)
			box_options -= [0,1,3,4,6,7]
		end
		box_options
	end

	def determine_box(y_index, x_index)
		box_options = [0,1,2,3,4,5,6,7,8]
		box_options = eliminate_boxes_for_y(box_options, y_index)
		box_options = eliminate_boxes_for_x(box_options, x_index)
		box_options[0]
	end

	def assign_positions(array_2d)
		y_index = 0
		array_2d.each do |row|
			x_index = 0
			row.each do |cell|
				box_value = determine_box(y_index, x_index)
				cell.position = {:y_index => y_index, :x_index => x_index, :box => box_value}
				x_index += 1
			end
			y_index += 1
		end
	end

	def initialize(puzzle)
		self.cells = assign_positions(convert_to_2d_array(puzzle))
	end
	
end