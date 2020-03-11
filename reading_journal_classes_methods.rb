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

# Goals Method
## Setting reading goal
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

# Book methods
## Creating a record of a book to be stored in one of 3 lists
def add_book()
    puts "Please enter book title:"
    @title = gets.chomp
    puts "Please enter author:"
    @author = gets.chomp

    prompt = TTY::Prompt.new
    question = "Please choose a log:"
    choices = [{"Current reads" => 1}, {"Future reads" => 2}, {"Past reads" => 3}]
    list_choice = prompt.select(question, choices)

    title = Book.new(@title, @author)

    if list_choice == 1
         @current_reads << [@title, @author]
         return_to_mm
    elsif list_choice == 2
         @future_reads << [@title, @author]
         return_to_mm
    elsif list_choice == 3
         @past_reads << [@title, @author]
         return_to_mm
    end
    return title
end

#change title, author or progess
def edit_book
    # select array
        list_choice = log_edit_selection('Please select a log')
        #identify entry in chosen array
        log = list_choice
        prompt = TTY::Prompt.new
        search_result = prompt.ask("Search by title or author:")

        exist = false

        for i in 0..log.length-1
            if log[i][0].include?(search_result)
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
    if exist == false
        p 'invalid input'
     end
end
    
def delete_book(title)

end

# User reading log functions 
## Check/view logs
def check_log()
    system("clear")
    
   list_choice = log_selection("Please select a log:")
    
    if list_choice == 1
        total_current = @current_reads.count()
        if total_current > 0
            table = Terminal::Table.new :title => "Current Reads", :headings => ['Title', 'Author'], :rows => @current_reads
            table.style = {:all_separators => true}
            puts table
            box = TTY::Box.info("Total current reads: #{total_current}")
            print box
            return_to_mm
        else
            error_in_log
            return_to_mm
        end
    elsif list_choice == 2
        total_future = @future_reads.count()
        if total_future > 0
            puts @future_reads
            box = TTY::Box.info("Total future reads: #{total_future}")
            print box
        else
            error_in_log
            return_to_mm()
        end
    else list_choice == 3 
        total_past = @past_reads.count()
        if total_past > 0
            table = Terminal::Table.new :past_reads => @past_reads
            puts table
            box = TTY::Box.info("Total past reads: #{total_past}")
            print box
        else
            error_in_log
            return_to_mm()
        end
    end
end

# def collect_quote()

# end

# def quote_generator()

# end

#   Error Handling

def error_in_log
    error = TTY::Box.warn("Sorry log is empty. Return to main menu to add a book to this log.")
    puts error
end

#   Info messages to user

def start_greeting
    font = TTY::Font.new(:doom)
    pastel = Pastel.new
    puts pastel.white(font.write("Hello!"))
end

#   Navigation Methods

def main_menu_action(user_input)   
    # user_input = log_selection("Please select a log:")
    #add new book to log
    if user_input ==  1
        add_book()
    #check log
        elsif user_input ==  2
        check_log()
    # manage log
        elsif user_input == 3
        edit_book
    # exit app
        elsif user_input ==  4
        puts "You can check out any time you like but you can never leave. *Guitar riffs*"
    end
end

# returns user to main menu
def return_to_mm()
    prompt = TTY::Prompt.new
    prompt.yes?("Would you like to return to the main menu?")
    system("clear")
end

#returns list choice int. value
def log_selection(question)
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

# returns associated list choice array
def log_edit_selection(question)
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
end