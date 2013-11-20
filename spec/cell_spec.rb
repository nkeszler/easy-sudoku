require_relative "../lib/cell.rb"

describe Cell do
	let(:cell) {Cell.new}

	it "Should have a value" do
		cell.value = "5"
		expect(cell.value).to eq("5")
	end

	it "Should have a position" do
		cell.position = {:y_index => 3, :x_index =>1}
		expect(cell.position).to eq({:y_index => 3, :x_index => 1})
	end

	it "Should know if its solved" do
		cell.value = "5"
		expect(cell.solved?).to be_true
		cell.value = "0"
		expect(cell.solved?).not_to be_true
	end

end