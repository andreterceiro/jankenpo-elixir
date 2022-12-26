defmodule Game do

    # Main method - the game
    def execute do
        user_choice = IO.gets("Choose 1 for paper, 2 for rock or 3 for scissors: ")  |> String.trim_trailing

        if (user_choice != "1" && user_choice != "2" && user_choice != "3") do
            IO.puts("You need to choose 1, 2 ou 3")
        else
            user_final_string_choice = get_string_choice(user_choice)
            computer_string_choice = get_string_choice(:rand.uniform(3))
          
            if (
                (user_final_string_choice == "Paper" && computer_string_choice == "Rock") ||
                (user_final_string_choice == "Rock" && computer_string_choice == "Scissors") ||
                (user_final_string_choice == "Scissors" && computer_string_choice == "Paper")
            ) do
                IO.puts("You win")
            else
                if (user_final_string_choice == computer_string_choice) do
                    IO.puts("Draw")
                else
                    IO.puts("Computer win")
                end
            end

            IO.puts(["You selected: ", user_final_string_choice])
            IO.puts(["Computer selected: ", computer_string_choice])
        end
    end

    #
    # Makes a map of the received number to a string:
    # 1 - Paper
    # 2- Rock
    # 3 - Scissors
    #
    # @param integer n The humber to be mapped to a string
    #
    # @return String The string related to the number received
    #
    def get_string_choice(n) do
        cond do
            n == "1" || n == 1 ->
                "Paper" 
            n == "2" || n == 2 ->
                "Rock"
            n == "3" || n == 3 ->
                "Scissors"
        end
    end
end

Game.execute