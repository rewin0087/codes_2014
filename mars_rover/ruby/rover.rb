require_relative 'direction_helper'

class Rover
	# x position of the rover
	attr_accessor :x_position
	# y position of the rover
	attr_accessor :y_position
	# facing direction of the rover
	attr_accessor :direction
	# command to be execute of the rover
	attr_accessor :command
	

	# final position of the rover
	def final_position
		puts "#{@x_position} #{@y_position} #{@direction}"
		{ x: @x_position, y: @y_position, final_direction: @facing_direction }
	end

	# set current coordinates position
	def coordinates position
		coordinates = position.split

		# set x position
		@x_position = coordinates[0].to_i
		# set y position
		@y_position = coordinates[1].to_i
		# set direction
		@direction = coordinates[2]
	end

	# execute the given command
	def execute_command
		command = @command.split(//)

		unless command.empty?
			@facing_direction = direction

			command.each do |action|
				if action == MOVE
					move_forward
				else
					rotate_rover action
				end
			end
		end
	end
	
	# include Direction helper
	include Direction
end