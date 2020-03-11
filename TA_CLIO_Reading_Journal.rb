# # # TA_CLIO_Reading_Journal

#Gems
require 'tty-box'
require 'tty-prompt'
require 'pastel'
require 'tty-font'
require 'terminal-table'

#Method file
require_relative 'reading_journal_classes_methods'


initialise_app = true
name = "Reader"
app_greeting(name)
puts "I'm Clio - your reading companion." 

while initialise_app == true

user_input = main_menu()

    if user_input == 4
        initialise_app = false
    end

end

# @user_goal = []

# #   Goals Method
# # Setting reading goal
# def set_goals()
#     # Prompt user to set a goal 
#     puts "Enter a number of books you would like to read:"
#     @goal_num = gets.chomp.to_i
#     prompt = TTY::Prompt.new
#     question = "When would you like to achieve this by?"
#     choices = [{"A year" => 1}, {"A month" => 2}]
#     user_input = prompt.select(question, choice
#     return "You have set your goal to #{@goal_num} books in #{goal_set(user_input)}. Nice work!"
# end

# def goal_set(user_input)
#     if user_input ==  1
#         user_input = "a year"
#     elsif user_input ==  2
#         user_input = "a month"
#     end
#     return user_input
# end

# ## View progress based on current reading habits
# def view_progress
#     # Do in progress

#     # check past reads

#     # compare to current goals

#     # if complete all current reads return progress

#     # if complete all future reads return progress

# end

# set_goals()