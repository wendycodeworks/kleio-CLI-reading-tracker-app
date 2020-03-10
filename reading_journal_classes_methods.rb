# Terminal-app Reading Journal Classes & Methods

#Gems
require 'tty-box'

@current_reads = ["Invisible Women", "Cat in the Hat by Dr Seuss", "Alice in Wonderland"]
@future_reads  = []
@past_reads    = []

class Book
    attr_accessor :title, :author

    def initialize(title, author)
    @title = title
    @author = author
    puts "Successfully added #{@title} by #{@author}."
    end

end


def add_book()
    puts "Please enter book title:"
    @title = gets.chomp
    puts "Please enter author:"
    @author = gets.chomp
    puts "Please choose list: \n 1. Current reads \n 2. Future reads \n 3. Past reads"
    list_choice = gets.chomp

    title = Book.new(@title, @author)

    if list_choice == "1"
         @current_reads << "#{@title} by #{@author}"
    elsif list_choice == "2"
         @current_reads << title
    elsif list_choice == "3"
         @current_reads << title
    end

    return title

end

def edit_book()
#change title, author or progess

end

def book_dets(title)
    #each function
    if @current_reads.include?(title)
        puts title
    end
end

def delete_book(title)

end

def check_log()
    prompt = TTY::Prompt.new
    question = "Which log would you like to view?"
    choices = [{"Current reads" => 1}, {"Future reads" => 2}, {"Past reads" => 3}]
    user_input = prompt.select(question, choices)
    
    if user_input == 1
        total_current = @current_reads.count()
        if total_current > 0
            puts @current_reads
            box = TTY::Box.info("Total current reads: #{total_current}")
            print box
        else
            error_in_log
            system("clear")
            return_to_mm
        end
    elsif user_input == 2
        total_future = @future_reads.count()
        if total_future > 0
            puts @future_reads
            box = TTY::Box.info("Total future reads: #{total_future}")
            print box
        else
            error_in_log
            return_to_mm()
        end
    else user_input == 3 
        total_past = @past_reads.count()
        if total_past > 0
            puts @past_reads
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

def main_menu_action(user_input)
    
    #Add book    
    if user_input ==  1
        add_book()
    #check log
        elsif user_input ==  2
        check_log()
    # manage log
        elsif user_input == 3
        puts "Coming soon"
    # exit app
        elsif user_input ==  4
        puts "You can check out any time you like but you can never leave. *Guitar riffs*"
    end
end

def return_to_mm()
    prompt = TTY::Prompt.new
    prompt.yes?("Would you like to return to the main menu?")
    system("clear")
end

#   Error Handling

def error_in_log
    error = TTY::Box.warn("Sorry log is empty. Return to main menu to add a book to this log.")
    puts error
end