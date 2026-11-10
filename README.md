Community Learning Center Management System

Course: Mobile Development
Assessment: Midterm Laboratory Examination
GitHub Repository: MD_Midterm_[Virayo][BSIT 3.8]  



Project Overview

The Community Learning Center Management System is a Dart console-based application that helps manage the learning resources and participants of a community learning center in one program. It is created to make the management of learning materials and participant information more organized and easier to handle. The system also demonstrates the basic concepts of Dart programming, such as input and output, error handling, lists and maps, and object-oriented programming principles like encapsulation, abstraction, inheritance, and polymorphism. It also uses reusable mixins to make the code more organized and flexible.



Implemented Features


Console Menu & Navigation Loop: The system uses a continuous interactive menu where users can choose different actions based on the available options. It uses a while loop and switch statement to process the selected choices and keeps running until the user decides to choose option 5 (Exit) to close the program.


Collection Records: The system uses a List<CenterRecord>  to store all registered records, making it easier to add and manage different items. It also uses a Map<String, CenterRecord> to quickly find records using their unique ID, making the searching process faster and more efficient.

Abstract Class: The system uses CenterRecord as the main abstract class, which contains the common properties like ID and name, along with an abstract method called getDetails().

Inheritance and Polymorphism: The system has two subclasses, LearningResource  and Participant, that inherit from CenterRecord. Both classes have their own version of getDetails() to display specific information depending on the type of record.

Encapsulation: The system keeps the field values protected by using getters and setters, allowing the data to be accessed and managed properly. It also uses string formatting to display the information in a more organized way.


Input Validation & Exception Handling: Uses try-catch handling around numeric parsing and input fields to prevent unexpected application crashes during runtime.



Sample Test Scenarios (Execution Proof)

Scenario 1: Registering a Learning Resource (Option 1)


Inputs:
Option: 1
Resource ID: RES-01
Resource Title: Dart
Category: Programming
Fee Amount: 500.00

Output Log:
[SUCCESS] Record registered successfully! ID: RES-01

========================================
 [NEW RESOURCE ADDED] - Logged: 2026-11-09 23:54:35
========================================
ID: RES-01 | Resource: Dart | Category: Programming | Fee: $500.00
========================================


Scenario 2: Registering a Participant (Option 2)


Inputs:
Option: 2
Participant ID: PAR-01
Full Name: Jennie Kim
Email Address: jenniekim@gmail.com

Output Log:
[SUCCESS] Record registered successfully! ID: PAR-01

========================================
 [NEW PARTICIPANT REGISTERED] - Logged: 2026-11-09 23:55:13
========================================
ID: PAR-01 | Participant: Jennie Kim | Email: jenniekim@gmail.com | Courses Enrolled: 0
========================================


Scenario 3: Search Record by ID (Option 3)


Inputs:
Option: 3
ID to search: PAR-01

Output Log:
[RECORD FOUND]
ID: PAR-01 | Participant: Jennie Kim | Email: jenniekim@gmail.com | Courses Enrolled: 0


Scenario 4: View All Records & Summary (Option 4)


Inputs: Option 4

Output Log:
========================================
      ALL COMMUNITY CENTER RECORDS      
========================================
ID: RES-01 | Resource: Dart | Category: Programming | Fee: $500.00
ID: PAR-01 | Participant: Jennie Kim | Email: jenniekim@gmail.com | Courses Enrolled: 0
========================================
Total Registered Records: 2
Total Resource Fees: $500.00
========================================


Scenario 5: Application Exit (Option 5)


Inputs: Option 5

Output Log:
Exiting application. Thank you!

...Program finished with exit code 0



How to Run


Clone or download this repository.

Ensure the Dart SDK is installed or use an online compiler like OnlineGDB or DartPad.

Open terminal in the repository folder and execute:
dart main.dart



AI Use Declaration


AI Tool Used: Google Gemini

Purpose: Assisting in documentation structure and transcribing console output logs.

Assisted Portion: Improved the README layout and Markdown formatting to make it more organized and easier to understand. The main program structure, class design, and Dart code were also made based on the given task guidelines.


