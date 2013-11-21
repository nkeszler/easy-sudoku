require_relative "../lib/grid.rb"

describe Grid do
	
	let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
	let(:grid) {Grid.new(puzzle)}

	it "Should convert puzzle string into 2-Dimensional array of Cells" do
		expect(grid.cells.class).to eq(Array)
		expect(grid.cells[0].class).to eq(Array)
		expect(grid.cells[0][0].class).to eq(Cell)
	end

	it "Should know if its solved" do
		expect(grid.solved?).not_to be_true
	end

	it "Should know where each cell is located and its value" do
		expect(grid.cells[2][5].value).to eq("8")
		expect(grid.cells[2][5].position).to eq({:y_index => 2, :x_index => 5, :box => 1})
		expect(grid.cells[0][8].position[:box]).to eq(2)
		expect(grid.cells[6][2].position[:box]).to eq(6)
	end

	it "Should be able to determine a cells neighbors" do
		cell = Cell.new
		cell.position = {:y_index => 0, :x_index => 0, :box => 0}
		expect(grid.show_neighbors(cell)).to eq(["1","3","4","5","2","7","8","9"].sort)
	end

	it "Should solve a cell" do
		cell = Cell.new
		cell.value = "0"
		cell.position = {:y_index => 0, :x_index => 0, :box => 0}
		grid.solve_cell(cell)
		expect(cell.value).to eq("6")
	end

	it "Should solve the whole game" do
		grid.solve
		expect(grid.solved?).to be_true
		expect(grid.cells.flatten.map{|cell| cell.value}.join).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
	end


end 