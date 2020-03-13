# # # TA_CLIO_Reading_Journal

#Gems
require 'tty-box'
require 'tty-prompt'
require 'tty-font'
require 'terminal-table'

#Method file
require_relative 'kleio_classes_methods'

prompt = TTY::Prompt.new
name = prompt.ask("Hey there, I'm Kleio - what's your name?", required: true)
puts app_greeting(name)

prompt = TTY::Prompt.new
user_input = prompt.keypress(
    "Press space or enter to continute", keys: [:space, :return]
)

initialise_app = true

while initialise_app == true

user_input = main_menu()

    if user_input == 4
        initialise_app = false
    end

end

