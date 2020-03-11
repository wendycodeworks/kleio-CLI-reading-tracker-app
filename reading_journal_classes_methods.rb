# Terminal-app Reading Journal Classes & Methods

#Gems
require 'tty-box'
require 'tty-prompt'
require 'pastel'
require 'tty-font'
require 'terminal-table'

# User input variables
@user_log = [@current_reads, @future_reads, @past_reads]
@current_reads = [["Cat in the Hat", "Dr Seuss"], ["Alice in Wonderland", "Lewis Carol"]]
@future_reads  = []
@past_reads    = []
@goals = {}
@progress = {}

# Book class 
class Book
    attr_accessor :title, :author
    def initialize(title, author)
    @title = title
    @author = author
    puts "Successfully added #{@title} by #{@author}."
    end
end

#   Goals Method
# Setting reading goal
def set_goals
    # Prompt user to set a goal 

    # Choose a deadline (total a month/ total in year)

    # Set a number of books

    # Store goal details in user info variable

end

## View progress based on current reading habits
def view_progress
    # Do in progress

    # check past reads

    # compare to current goals

    # if complete all current reads return progress

    # if complete all future reads return progress

end

# Book & Log methods
#Creating a record of a book to be stored in one of 3 lists
def add_book()
    puts "Please enter book title:"
    @title = gets.chomp
    puts "Please enter author:"
    @author = gets.chomp

    list_choice = edit_log('Please select a log')

    title = Book.new(@title, @author)

    if list_choice == 1
         @current_reads << [@title, @author]
    elsif list_choice == 2
         @future_reads << [@title, @author]
    elsif list_choice == 3
         @past_reads << [@title, @author]
    end
    back_to_main()
end

# search for and change book item
def edit_book()
    # select array
    list_choice = edit_log('Please select a log')
    #identify entry in chosen array
    log = list_choice
    prompt = TTY::Prompt.new
    search_result = prompt.ask("Search by title or author:")

    exist = false

        for i in 0..log.length-1
            if log[i][0].include?(search_result.to_s)
                puts log[i]
                puts "Record located. Enter new title:"
                user_input = gets.chomp.to_s 
                log[i][0] = user_input
                puts "Record updated to #{log[i][0]} by #{log[i][1]}"
                exist = true
            elsif log[i][1].include?(search_result)
                puts "Record located. #{log[i]}"
                prompt = TTY::Prompt.new
                user_input = prompt.ask("Enter new author:")
                log[i][1] = user_input
                puts "Record updated to #{log[i][0]} by #{log[i][1]}"
                exist = true
            end
        end 
    if exist == false
        search_error()
     end
end

# search for and delete book item      
def delete_book()
        # select array
        list_choice = edit_log('Please select a log')
        #identify entry in chosen array
        log = list_choice
        prompt = TTY::Prompt.new
        search_result = prompt.ask("Search by title or author:")

        exist = false

        for i in 0..log.length-1
            if log[i][0].include?(search_result)
                puts log[i]
                prompt = TTY::Prompt.new
                results = prompt.yes?("Record located. Would you like to delete record?")
                    if results == true
                    log.delete(log[i]) 
                    else
                    list_choice
                    exist = true
                    end
            elsif log[i][1].include?(search_result)
               puts log[i]
                prompt = TTY::Prompt.new
                results = prompt.yes?("Record located. Would you like to delete record?")
                    if results == true
                    log.delete(log[i]) 
                    else
                    list_choice
                    exist = true
                    end
                end 
            end
        if exist == false
        search_error()
     end

end

# Check/view logs
def check_log()
    
    system("clear")
    
   list_choice = view_log("Please select a log:")

    if list_choice == 1
        total_amount = @current_reads.count()
        if total_amount > 0
            puts log_display(@current_reads)
            puts log_total_display(total_amount)
            back_to_main()
        else
            empty_log()
        end
    elsif list_choice == 2
        total_amount = @future_reads.count()
        if total_amount > 0
            puts log_display(@future_reads)
            puts log_total_display(total_amount)
            print box
        else
            empty_log()
        end
    else list_choice == 3 
        total_amount = @past_reads.count()
        if total_amount > 0
            puts log_display(@past_reads)
            puts log_total_display(total_amount)
            print box
        else
            empty_log()
        end
    end
end

# def collect_quote()

# end

# def quote_generator()

# end

#   Error Handling
# Opening an empty log
def empty_log()
    error = TTY::Box.warn("Sorry log is empty. Return to main menu to add a book to this log.")
    puts error
    back_to_main()
end

# Editing/Deleting a log - unable to locate record
def search_error()
    error = TTY::Box.warn("Sorry no record found. Try another log.")
    puts error
    back_to_main()
end

#   Greetings
# Opening 
def app_greeting(name)
    font = TTY::Font.new(:doom)
    pastel = Pastel.new
    puts pastel.white(font.write("Hello #{name}"))
end

#   Navigation Methods
# Main Menu 
def main_menu() 
    puts "Main Menu"
    prompt = TTY::Prompt.new
    question = "Select an action:"
    choices = [{"Add book" => 1}, {"Check log" => 2}, {"Manage log" => 3}, {"Exit" => 4}]
    user_input = prompt.select(question, choices) 
    #add new book to log
    if user_input ==  1
        add_book()
    #check log
    elsif user_input ==  2
        check_log()
    # manage log
    elsif user_input == 3
        manage_log()
    # exit app
    elsif user_input ==  4
            return user_input
    
    end
end

# Manage Log Menu
def manage_log()
    prompt = TTY::Prompt.new
    question = "Select an action:"
    choices = [{"Edit book" => 1}, {"Delete book" => 2}]
        user_input = prompt.select(question, choices)
        if user_input == 1
            edit_book()
        elsif user_input == 2
            delete_book()
        end
end

# Return to main menu
def back_to_main()
    prompt = TTY::Prompt.new
    user_input = prompt.keypress(
        "Press space or enter to return to main menu", keys: [:space, :return]
    )
    main_menu()
    # system("clear")
end

# Log methods
# Table display
def log_display(log)
        table = Terminal::Table.new :title => "Current Reads", :headings => ['Title', 'Author'], :rows => log, :style => {:width => 50}
        table.style = {:all_separators => true}
    return table
end

# Total reads by log display
def log_total_display(total_reads)
box = TTY::Box.frame(width: 50, height: 5, align: :center, padding: 1, border: :thick, title: {top_left: ' TOTAL '}) do
    "#{total_reads} books."
    end
return box
end

# Return list choice as an integer (for viewing of logs)
def view_log(question)
    prompt = TTY::Prompt.new
    choices = [{"Current reads" => 1}, {"Future reads" => 2}, {"Past reads" => 3}]
    list_choice = prompt.select(question, choices)
        if list_choice == 1
            return list_choice
        elsif list_choice == 2
            return list_choice
        else list_choice == 3
            return list_choice
        end
    return list_choice
end

# Returns list choice as array
def edit_log(question)
    prompt = TTY::Prompt.new
    choices = [{"Current reads" => 1}, {"Future reads" => 2}, {"Past reads" => 3}]
    list_choice = prompt.select(question, choices)
        if list_choice == 1
            list_choice = @current_reads
            return list_choice
        elsif list_choice == 2
            list_choice = @future_reads
            return list_choice
        else list_choice == 3
            list_choice = @past_reads
            return list_choice
        end
    return list_choice
end