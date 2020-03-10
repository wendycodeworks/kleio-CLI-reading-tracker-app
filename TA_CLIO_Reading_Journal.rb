# TA_CLIO_Reading_Journal

require_relative 'reading_journal_classes_methods.rb'

# puts "Hello there! What's your name?"

# name = gets.chomp 

# puts "Hi #{name}, I'm CLIO - your reading companion. 
# \n I help you stay on track with your reading goals. 
# \n What would you like to do? 
# \n Select by entering a number:"
# puts "1. Check Log"
# puts "2. View progress"
# puts "3. Add/Edit/Delete Book"
# puts "4. Exit"

# action_selection = gets.chomp
# action(action_selection)

pickles = add_book()
system("clear")
p pickles

