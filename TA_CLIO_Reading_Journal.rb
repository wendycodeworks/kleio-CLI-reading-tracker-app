# TA_CLIO_Reading_Journal

require_relative 'reading_journal_classes_methods.rb'
require 'tty-prompt'

initialise_app = true
start_greeting
name = "Reader"
puts "Hi #{name}, I'm CLIO - your reading companion. I help you stay on track with your reading goals." 

while initialise_app == true

# puts "Hello there! What's your name?"
# name = gets.chomp 

prompt = TTY::Prompt.new
question = "Select an action:"
choices = [{"Add book" => 1}, {"Check log" => 2}, {"Manage log" => 3}, {"Exit" => 4}]
user_input = prompt.select(question, choices) 

main_menu_action(user_input)

    if user_input == 4
        initialise_app = false
    else 
    end
end

