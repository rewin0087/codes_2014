module Direction
	# NORTH
	NORTH = "N"
	# WEST
	WEST = "W"
	# EAST
	EAST = "E"
	# SOUTH
	SOUTH = "S"
	# MOVE
	MOVE = "M"
	# LEFT
	LEFT = "L"
	# RIGHT
	RIGHT = "R"

	# move rover from its position to the next position
	def move_forward
		case @facing_direction

		when NORTH
			@y_position += 1
		when WEST
			@x_position -= 1
		when EAST
			@x_position += 1
		when SOUTH
			@y_position -= 1
		end
	end

	# rotate rover from current facing direction to next direction
	def rotate_rover facing
		case facing

		when RIGHT
			turn_right
		when LEFT
			turn_left
		end
	end

	# change current facing to the left of the current direction
	def turn_left
		case @facing_direction

		when NORTH
			@facing_direction = WEST
		when WEST
			@facing_direction = SOUTH
		when EAST
			@facing_direction = NORTH
		when SOUTH
			@facing_direction = EAST
		end
	end

	# change current facing to the right of the current direction
	def turn_right
		case @facing_direction

		when NORTH
			@facing_direction = EAST
		when WEST
			@facing_direction = NORTH
		when EAST
			@facing_direction = SOUTH
		when SOUTH
			@facing_direction = WEST
		end
	end
end