# TA_CLIO_Reading_Journal

require_relative 'reading_journal_classes_methods'
require 'tty-prompt'

initialise_app = true
name = "Reader"
app_greeting(name)
puts "I'm Clio - your reading companion. I help you stay on track with your reading goals." 

while initialise_app == true

user_input = main_menu()

    if user_input == 4
        initialise_app = false
    end

end

