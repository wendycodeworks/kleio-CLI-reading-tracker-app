# 1     Scope & purpose 

## 1.1     What is Kleio?

Kleio is an application designed to help users keep track of their books as they read. It acts as a reading log that allows users to record books in three different lists: current reads, future reads and past reads. This allows the user to keep an updated repository of the books they have read, will read or are currently reading.  



## 1.2     Why Kleio?

Book logs have been used by countless teachers, writers and avid bookworms over the past few decades. It’s found to be a great way to track and build healthy reading habits and observe trends in personal taste. With a book log, you might identify a favourite genre, or author, or simply find a common theme in your reads. Kleio is a reading companion that can help you stay motivated to read more. The book log feature will track and count the number of books you have read, giving you a visual representation of your progress.



## 1.3     Who is this for?

Kleio is for any book enthusiast, teacher, writer or parent. From a seasoned reader to a newly anointed bookworm, anyone can find benefit from keeping a book log. 



## 1.4     How will they use it?

Once the app is installed, the user can start adding books to any of the three logs. Current reads are for books that the user has already started and has not completed. For books that the user has read prior to using the app, those will go into the Past reads list. And if the user encounters a book that they would like to read later but is unable to start the read today, they can add that to their Future reads list. The user can also edit their book logs if they have made a mistake or would like to reassign books to different lists, for example once the user has finished a book in Current reads they can assign the book to Past reads.



# 2     Features

## 2.1     Navigation

Kleio features a simple navigation from a main menu. The menu offers 4 options: ‘Add book’, ‘Check log’, ‘Manage Log’, and ‘Exit’. Upon selecting a menu option, the user will call a corresponding method, for example if the user were to select ‘Add book’ the add_book function will be prompted for inputs for the Book class instance. The add_book function will also prompt the user for a log and once selected the newly created instance will be stored as an array to be called upon in other methods. The ‘Exit’ option allows for a straightforward way to quit the app. 

​        

## 2.2     Book items 

Book items are created through the add_book() method. When this method is called, the user is prompted to enter the values for the record. The user is then prompted selected a book log; upon completion of the method the book item will be appended to the selected array. The user can view, edit and delete this record through the navigation menus with the help of some other methods. 

## 2.3     Book log

The three books logs are intuitive way to track and sort the book items, especially if the user has reading goals. The user can also view and manage their logs. Book items are stored as arrays and have been formatted into a user-friendly table to view their logs. Using the terminal-table gem, the array data displays as a tabular format allowing for easier viewing of the log. If users try to view an empty book log, they will encounter a warning message and be prompted back to the main menu. 



# 3     User interaction

## 3.1     Instructions

### 3.1.1    Main Menu

App will open at the main menu. 

```ruby
### Select an action: (Use ↑/↓ arrow keys, press Enter to select)

### ‣ Add book

###  Check log

###  Manage log

###  Exit
```



### 3.1.2    Add Book

The ‘Add book’ selection will allow you to create a new book to a log of your choice. 

```ruby
### ‣ Add book
```

Follow the prompts to add the details of your book. In this version you will only need the title and author. Once the details have been entered, choose a log.

```ruby
### Please enter title: *The Hobbit*

### Please enter author: *J. R. R. Tolkien*

### Which log would you like to add this book to? (Use ↑/↓ arrow keys, press Enter to select)

###  Current Reads

###  Future Reads

### ‣ Past Reads

###  Cancel
```

You will then be prompted back to the main menu.

### 3.1.3    Check log

The ‘Check log’ selection will allow you to view the contents of any log.

```ruby
### ‣ Check log
```

In this sub menu, you have the option to view any one of the logs available to you.

```ruby
### Please select a log: (Use ↑/↓ arrow keys, press Enter to select)

### ‣ Current Reads

### Future Reads

### Past Reads

### Cancel
```

In the log will display in a table format with total number of books in a box directly below.

### 3.1.4    Manage log

The ‘Manage log’ selection will allow you to edit and remove book records from any log.

```ruby
### ‣ Manage log
```

This will take you to the 'Edit book' and 'Delete book' selections.

#### 3.1.4.1     Edit book

```ruby
### Select an action: (Use ↑/↓ arrow keys, press Enter to select)

### ‣ Edit book

###  Delete book

###  Back
```

You will need to search for the record in the correct log - if the item is not in the log, Kleio will prompt you back to select a different log.

#### 3.1.4.2     Delete book

To delete a book, you will need to navigate to the 'Delete book' selection.

```ruby
### Select an action: (Use ↑/↓ arrow keys, press Enter to select)

###  Edit book

### ‣Delete book

###  Back
```

There you will need to search and locate the record before you are then prompted to delete the record. 

## 3.2     Usage

 Kleio can be used on a daily or weekly basis, depending on how frequently you find and finish your books. 

## 3.3     Error handling

Empty logs - logs that do not contain any entries will not display anything but an error message that will prompt you back to main menu.

Empty entries - when prompted for a value you must enter a value and not leave the input empty; a space won't work either. If you need to exit, you will need to reach the log prompt. 

No records - if you are searching for an unrecorded item you will be prompted with a search item. You may have check another log, and if it is not in the other logs, you will need it add the item as a new record.

# 4     User flow

 

![img](file:///C:/Users/wendy/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png)

# 5     Implementation plan

## 5.1     Feature checklist

 ![image-20200313165623891](C:\Users\wendy\AppData\Roaming\Typora\typora-user-images\image-20200313165623891.png)

## 5.2     Feature prioritisation

The main functions for book items and book logs will be prioritised. The user must be able to create a record and view their book logs at the bare minimum. Once that has been successfully implemented, builds for edit and delete functions will begin.  

## 5.3     Project life

Main features are to be completed within 21 working hours, this includes build and testing. Other features will be added on an ongoing basis.

# 6     Help 

## 6.1     How to install application

1. Clone with https://github.com/wendycodeworks/terminal_app_reading_journal.git or download the zip file by pasting this in a new tab: https://github.com/wendycodeworks/terminal_app_reading_journal/archive/master.zip

2. If you have downloaded the zip file, make sure you unzip the files.

3. Open the CLI and locate the file

4. Run with the following command

   ```ruby
   ruby kleio_app
   ```

5. Enjoy!

### 6.1.1    Tests

 When you first install the application, you can test it with the following cases:

Add book

 1. Open app to main menu

 2. Select 'Add book'

 3. Enter the title and author of the book

 4. Select the log to assign the book

 5. Return to the main menu

 6. Check the log for the item

    Expected results: Book title and author are stored in the corresponding columns; total has been increase by 1.

Delete book (continued from Add book)

 1. Go to 'Manage log'

 2. Select 'Delete book'

 3. Enter the book details you've just added (can be partial, just make sure it's capitalised)

 4. Once item is located, confirm delete

 5. Return to main menu

 6. Check the log for the item

    Expected result: The record has been removed and the total is now down by 1. 

## 6.2     Operation dependencies

This application requires the installation of the following gems:

```
require 'tty-box'
require 'tty-prompt'
require 'tty-font'
require 'terminal-table'
```



## 6.3     System/hardware requirements

You will need Ruby installed. If you don't have it installed, download Ruby [here](https://www.ruby-lang.org/en/downloads/).

This application can run in most command line interfaces. Please let me know if it's not working for you.