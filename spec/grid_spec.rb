require_relative "../lib/grid.rb"

describe Grid do
	
	let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
	let(:grid) {Grid.new(puzzle)}

	it "Should convert puzzle string into 2-Dimensional array of Cells" do
		expect(grid.cells.class).to eq(Array)
		expect(grid.cells[0].class).to eq(Array)
		expect(grid.cells[0][0].class).to eq(Cell)
	end

	it "Should know where each cell is located and its value" do
		expect(grid.cells[2][5].value).to eq("8")
		expect(grid.cells[2][5].position).to eq({:y_index => 2, :x_index => 5, :box => 1})
		expect(grid.cells[0][8].position[:box]).to eq(2)
		expect(grid.cells[6][2].position[:box]).to eq(6)
	end

	it "Should be able to determine a cells neighbors" do
		
	end


end 