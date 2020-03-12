# Terminal-app Reading Journal Classes & Methods

# User input variables
@user_log = ["Current Reads", "Future Reads", "Past Reads"]
@current_reads = [["Cat in the Hat", "Dr Seuss"], ["Alice in Wonderland", "Lewis Carol"]]
@future_reads  = [["Beyond Infinity", "Eugene Cheng"], ["Create Dangerously", "Albert Camus"]]
@past_reads    = []
# @goals = {}
# @progress = {}

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
    puts title_box("Add Book")
    @title = add_dets("Please enter title:")
    @author = add_dets("Please enter author:")
 
    list_choice = view_log('Which log would you like to add this book to?')

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

def add_dets(question)
    prompt = TTY::Prompt.new
    answer = prompt.ask(question, required: true)
     if answer == "<"
     end
     return answer
end

# search for and change book item
def edit_book()
    puts title_box("Edit book in a log")
    list_choice = edit_log('Please select a log')
    #identify entry in chosen array
    log = list_choice
    search_result = add_dets("Search by title or author:")

    exist = false

        for i in 0..log.length-1
            if log[i][0].include?(search_result.to_s)
                puts log[i]
                user_input = add_dets("Please enter new title details:")
                log[i][0] = user_input
                puts "Record updated to #{log[i][0]} by #{log[i][1]}"
                exist = true
            elsif log[i][1].include?(search_result)
                puts "Record located. #{log[i]}"
                user_input = add_dets("Please enter new author details:")
                log[i][1] = user_input
                puts "Record updated to #{log[i][0]} by #{log[i][1]}"
                exist = true
            end
        end 
    if exist == false
        search_error()
     end
    back_to_main()
end

# search for and delete book item      
def delete_book()
        puts title_box("Delete book from a log")
        list_choice = edit_log("Please select a log: ")
        log = list_choice
        search_result = add_dets("Search by title or author:")
        exist = false
        for i in 0..log.length-1
            if log[i][0].include?(search_result)
                puts log[i]
                results = confirm("Record located. Would you like to delete record?")
                    if results == true
                    log.delete(log[i]) 
                    puts "Record deleted."
                    else
                    list_choice
                    end
                    exist = true
            elsif log[i][1].include?(search_result)
               puts log[i]
                prompt = TTY::Prompt.new
                results = confirm("Record located. Would you like to delete record?")
                    if results == true
                    log.delete(log[i]) 
                    puts "Record deleted."
                    else
                    list_choice
                    end
                    exist = true
                end 
            end
        if exist == false
        search_error()
     end
     back_to_main()
end

# Check/view logs
def check_log()
    system("clear")
   puts title_box("Check Log")
   list_choice = view_log("Please select a log:")
    if list_choice == 1
        puts check_log_display(@current_reads, @current_reads.count(), @user_log[0])
    elsif list_choice == 2
        puts check_log_display(@future_reads, @future_reads.count(), @user_log[1])
    elsif list_choice == 3 
        puts check_log_display(@past_reads, @past_reads.count(), @user_log[2])
    end
end

#   Error Handling

# Error Prevention
def title_box(input)
    system("clear")
    box = TTY::Box.frame(width: 61, align: :center, padding: 1, border: :thick, title: {top_center: " Hello, it's Kleio "}) do
        "#{input}" end
    return box
end

# Opening an empty log
def empty_log()
    error = TTY::Box.warn("Sorry log is empty. Return to main menu to add a book to this log.")
    puts error
end

# Editing/Deleting a log - unable to locate record
def search_error()
    error = TTY::Box.warn("Sorry no record found. Try another log.")
    puts error
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
    user_input = nil
    while user_input != 4
        system("clear")
        puts title_box("Main Menu")
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
        else user_input == 4
            return user_input
        end
    end
end

# Manage Log Menu
def manage_log()
    system("clear")
    puts title_box("Manage Log")
    prompt = TTY::Prompt.new
    question = "Select an action:"
    choices = [{"Reassign book" => 1}, {"Edit book" => 2}, {"Delete book" => 3}, {"Back" => 4} ]
        user_input = prompt.select(question, choices)
        if user_input == 1
            p "Feature coming soon!"
        elsif user_input == 2
            edit_book()
        elsif user_input == 3
            delete_book()
        elsif user_input == 4
            back_to_main()
        end
end

# Return to main menu
def back_to_main()
    prompt = TTY::Prompt.new
    user_input = prompt.keypress(
        "Press space or enter to return to main menu", keys: [:space, :return]
    )
    system("clear")
end

# Confirmation
def confirm(question)
    prompt = TTY::Prompt.new
    results = prompt.yes?(question)
     if results == true
        return results
     else 
        back_to_main()
     end
end

# Log methods

# Complete log display
def check_log_display(list_choice, total_amount, log_name)
    system("clear")
    if total_amount > 0
        table = Terminal::Table.new :title => "#{log_name}", :headings => ['Title', 'Author'], :rows => list_choice, :style => {:width => 100}
        table.style = {:all_separators => true}
        puts table
        box = TTY::Box.frame(width: 100, height: 5, align: :center, padding: 1, border: :thick, title: {top_center: ' TOTAL '}) do
            "#{total_amount} books"
            end
        puts box
    else
       empty_log()
    end
end 

# Return list choice as an integer (for viewing of logs)
def view_log(question)
    prompt = TTY::Prompt.new
    choices = [{"Current reads" => 1}, {"Future reads" => 2}, {"Past reads" => 3}, {"Cancel" => 4}]
    list_choice = prompt.select(question, choices)
        if list_choice == 1
            return list_choice
        elsif list_choice == 2
            return list_choice
        elsif list_choice == 3
            return list_choice
        else list_choice == 4
            back_to_main()
        end
    return list_choice
end

# Returns list choice as array
def edit_log(question)
    system("clear")
    prompt = TTY::Prompt.new
    choices = [{"Current reads" => 1}, {"Future reads" => 2}, {"Past reads" => 3}]
    list_choice = prompt.select(question, choices)
        if list_choice == 1
            list_choice = @current_reads
        elsif list_choice == 2
           list_choice = @future_reads
        else list_choice == 3
            list_choice = @past_reads
        end
    return list_choice
end