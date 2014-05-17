require 'rspec'
require_relative '../rover'

describe 'Rover' do
	let(:rover) { Rover.new }

	it "Move Rover from position 1 2 N with commands LMLMLMLMM" do
		rover.coordinates "1 2 N"
		rover.command = "LMLMLMLMM"

		rover.execute_command

		expected = { x: 1, y: 3, final_direction: 'N'}

		expect(
			rover.final_position
		).to eq(expected)
	end

	it "Move Rover from position 3 3 E with commands MMRMMRMRRM" do
		rover.coordinates "3 3 E"
		rover.command = "MMRMMRMRRM"

		rover.execute_command

		expected = { x: 5, y: 1, final_direction: 'E'}

		expect(
			rover.final_position
		).to eq(expected)
	end

end