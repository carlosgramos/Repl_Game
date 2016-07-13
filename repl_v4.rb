
#************LOCAL VARIABLE DECLARATION******************

board = ["x", "_" ,"o"]

#******************METHODS SECTION***********************

def display_rules
puts """
             ****************************
             ****Welcome to Insanity!****
             ****************************

Rules:
 1. You can move the 'x' or 'o' to an empty hole ('_')
    in front of you.
 2. You can jump over an 'x' or 'o' to get to an empty hole in
    front of you.
 3. You can only move forward. No moving back, EVER!
 4. You win when you have moved the 'x' all the way right
    and the 'o' all the way left.
 5. In the end your board should look like this:['o', '_', 'x']
 6. After two not valid moves, you lose!
"""
end

def display_initial_board
	initial_board = ["x", "_" ,"o"]
	puts "\n"
	puts "-" * 40
	puts "This is your initial board:"
	print "*******#{initial_board}********* \n"
	puts "-" * 40
	puts "\n"
end

def display_options
	options = {
					:move_x => "1) Move x to the right",
					:jump_x => "2) Jump x to the right",
					:move_o => "3) Move o to the left",
					:jump_o => "4) Jump o to the left",
					:quit 	=> "5) Quit!"
					}
	puts "What do you want to do? (pick a number)"
	puts options.values
	print "Your choice: "
end

def display_changes_to_board(board)
	puts "\n"
	puts "-" * 40
	puts "This is what your board looks like now:"
	puts "*******#{board}********"
	puts "-" * 40
end

def display_not_a_valid_move
	puts "\n"
	puts "-" * 35
	puts "*" * 35
	puts "**** That's not a valid move! *****"
	puts "*" * 35
	puts "-" * 35
end

def move_to_the_right(my_position, position_right, board)

	board[position_right] = "x"
	board[my_position] = "_"

	if board == ["o", "_" ,"x"]
	puts"""
	\n
	****************
	****You win!****
	****************
	"""
	exit
	end
end

def jump_to_the_right(my_position, position_right, board)

	board[position_right] = "x"
	board[my_position] = "_"

	if board == ["o", "_" ,"x"]
	puts"""
	\n
	****************
	****You win!****
	****************
	"""
	exit
	end
end

def move_to_the_left(my_position, position_left, board)

	board[position_left] = "o"
	board[my_position] = "_"

	if board == ["o", "_" ,"x"]
	puts"""
	\n
	****************
	****You win!****
	****************
	"""
	exit
	end
end

def jump_to_the_left(my_position, position_left, board)

	board[position_left] = "o"
	board[my_position] = "_"

	if board == ["o", "_" ,"x"]
	puts"""
	\n
	****************
	****You win!****
	****************
	"""
	exit
	end
end

def check_bad_moves(bad_moves)
	if bad_moves < 2
		display_not_a_valid_move
	else
		display_you_lost
	end
end

def display_you_lost
	puts "\n"
	puts "*******************************"
	puts "You ran out of moves. You lost!"
	puts "*******************************"
	puts "\n"
	exit
end

def goodbye
	puts "*******************"
	puts "Thanks for playing!"
	puts "*******************"
	exit
end

#********************BEGIN GAME************
	players_move = 10

	#game finishin loop until player_input = 5


	display_rules


#BEGIN USER INTERACTION

	display_initial_board

	bad_moves = 0
	#loop do #Begin game loop  UNTIL
		# until one of three options
	until
	display_options
	#Players choice
	#overwriting player move from outside loop
	players_move = gets.chomp.to_i

		case players_move
		when 1 #move to the right
			#find out my position
			my_position = board.index("x")
			#check if my_position + 1 is empty
			position_right = my_position + 1
			#if space is empty call "move right" method and pass variables
			if board[position_right] == "_"
				move_to_the_right(my_position, position_right, board)
			else
				#increment moves exceeded
				bad_moves += 1
				check_bad_moves(bad_moves)
				display_changes_to_board(board)
				redo
			end
			display_changes_to_board(board)
		when 2 #jump x to the right
			#determine my position
			my_position = board.index("x")
			#check if position + 2 is empty
			position_right = my_position + 2
			#if space is empty call "jump to the right"
			if board[position_right] == "_"
				jump_to_the_right(my_position, position_right, board)
			else
				bad_moves += 1
				check_bad_moves(bad_moves)
				display_changes_to_board(board)
				redo
			end
			#display changes to board
			display_changes_to_board(board)
		when 3 #move to the left
			#determine my position
			my_position = board.index("o")
			#check if position to my left is empty
			position_left = my_position - 1
			#if space is empty call "move left" method
			if board[position_left] == "_"
				move_to_the_left(my_position, position_left, board)
			else
				#increment moves exceeded
				bad_moves += 1
				check_bad_moves(bad_moves)
				display_changes_to_board(board)
				redo
			end
			display_changes_to_board(board)
		when 4 #jump to the left
			#determine my position
			my_position = board.index("o")
			#check if position - 2 is empty
			position_left = my_position - 2
			#if the space is empty call "jump to the left"
			if board[position_left] == "_"
				jump_to_the_left(my_position, position_left, board)
			else
				bad_moves += 1
				check_bad_moves(bad_moves)
				display_changes_to_board(board)
				redo
			end
			#display changes to the board
			display_changes_to_board(board)
		when 5 #quit the game
			goodbye
		else #validate user input
			puts "\n"
			puts "Enter a number between 1 and 5!!"
			puts "\n"
		end #Ends the case statement
		# end until
	end#Ends the game control loop
