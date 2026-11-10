# Community Learning Center Management System


## Application Description


The Community Learning Center Management System is a simple Dart console application designed to manage learning resources and participants.


The system allows users to add learning resources, register participants, view all records, and search for records using their ID.


## Application Features


1. **Add Learning Resource** – Allows users to add a learning resource with its ID, name, category, and quantity.
2. **Register Participant** – Allows users to register participants by entering their ID, name, and contact number.
3. **View All Records** – Displays all registered learning resources and participants.
4. **Search Record** – Searches for a resource or participant using their ID.
5. **Exit** – Closes the application.


## Dart Concepts Implemented


### 1. Dart Fundamentals
Variables and data types
String, Integer, and Boolean
User input and output
Operators
### 2. Control Structures
If/Else statements
Switch statements
While loops
For loops
Input validation and error handling
### 3. Object-Oriented Programming
Classes and Objects
Constructors
Methods
Encapsulation
Inheritance
Polymorphism
Abstract Classes
Mixins
### 4. Collections
**List** – Stores learning resources and participants.
**Map** – Stores records using their unique IDs for searching.
## Sample Test Scenarios


### Test Scenario 1: Add Learning Resource


**Input:**
Choice: 1
Resource ID: R001
Resource Name: Dart Book
Category: Programming
Quantity: 10
**Expected Output:**
text
Resource successfully added!
### Test Scenario 2: Register Participant


**Input:**
Choice: 2
Participant ID: P001
Participant Name: Juan Dela Cruz
Contact Number: 09123456789
**Expected Output:**
text
Participant successfully registered!
### Test Scenario 3: View All Records


**Input:**
Choice: 3
**Expected Output:**
text
--- ALL RECORDS ---


--- LEARNING RESOURCE ---
ID: R001
Name: Dart Book
Category: Programming
Quantity: 10


--- PARTICIPANT ---
ID: P001
Name: Juan Dela Cruz
Contact: 09123456789
### Test Scenario 4: Invalid Menu Choice


**Input:**
Choice: 9
**Expected Output:**
text
Invalid choice! Please select 1-5.
## How to Run the Program


1. Install the Dart SDK on your computer.
2. Create a project folder.
3. Save the source code as main.dart.
4. Open the project folder in Visual Studio Code or a terminal.
5. Run the following command:
bash
dart run main.dart
6. Follow the menu instructions to use the application.
