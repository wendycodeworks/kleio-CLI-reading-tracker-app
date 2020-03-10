# Terminal-app Reading Journal Classes & Methods

@current_reads = ["Invisible Women", "Cat in the Hat", "Alice in Wonderland"]
@future_reads  = []
@past_reads    = []

class Book
    attr_accessor :title, :author

    def initialize(title, author)
        puts "Successfully added #{@title} by #{@author}."
    @title = title
    @author = author
    end

end

def add_book()
    puts "Please enter book title:"
    @title = gets.chomp
    puts "Please enter author:"
    @author = gets.chomp
    puts "Please choose list: \n 1. Current reads \n 2. Future Reads \n 3. Past Reads"
    list_choice = gets.chomp

    title = Book.new(@title, @author)

    if list_choice == "1"
         @current_reads << title.title
    elsif list_choice == "2"
         @current_reads << title.title
    elsif list_choice == "3"
         @current_reads << title.title
    end

    return title

end

def edit_book()

end

def book_dets(title)
    if @current_reads.include?(title)
        puts title
    end
end

def delete_book(title)

end

def check_log()
    puts "Which log would you like to view? \n 1. Current reads \n 2. Future reads \n 3. Past reads"

    check_list = gets.chomp
    
    if check_list == "1"
        puts @current_reads
    elsif check_list == "2"
        p @future_reads
    elsif check_list == "3" 
        p @past_reads
    else
        p "Oh no! Invalid selection, please enter 1, 2 or 3"
    end
end

def collect_quote()

end

def quote_generator()

end

def action(action_selection)
    
if action_selection ==  "1"
    check_log
elsif action_selection ==  "2"
    puts "Coming soon"
elsif action_selection == "3"
    puts "Coming soon"
elsif action_selection ==  "4"
    puts "You can check out but you can never leave. *Guitar riffs*"
end
end

# add_book("Harry Potter & the Chamber of Secrets")
# add_book("Harry Potter & the Philosopher's Stone")

# p check_log

# book_dets("Harry Potter & the Philosopher's Stone")
# p new_book = Book.new("Harry Potter & the Chamber of Secrets", "JK Rowling", "2003", "*****")
