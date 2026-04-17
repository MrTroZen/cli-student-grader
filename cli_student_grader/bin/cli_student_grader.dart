import 'dart:io';  

// ==================== STEP 1: SETUP & CONSTANTS ====================

const String appTitle = "Student Grader v1.0";

final Set<String> availableSubjects = {
  "Math",
  "English",
  "Science",
  "History",
};

var students = <Map<String, dynamic>>[];

// ==================== STEP 2: MENU LOOP ====================

void main() {
  // do-while loop: runs at least once and keeps showing the menu
  do {
    // Multi-line string (triple quotes) with string interpolation
    print('''
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:''');

    // Read user input from terminal
    String? input = stdin.readLineSync();
    int choice = int.tryParse(input ?? '') ?? 0;

    // switch statement routes the choice
    switch (choice) {
      case 1:
        print("\n→ Option 1 selected: Add Student");
        break;

      case 2:
        print("\n→ Option 2 selected: Record Score");
        break;

      case 3:
        print("\n→ Option 3 selected: Add Bonus Points");
        break;

      case 4:
        print("\n→ Option 4 selected: Add Comment");
        break;

      case 5:
        print("\n→ Option 5 selected: View All Students");
        break;

      case 6:
        print("\n→ Option 6 selected: View Report Card");
        break;

      case 7:
        print("\n→ Option 7 selected: Class Summary");
        break;

      case 8:
        print("\nThank you for using $appTitle. Goodbye!");
        return;   // exits the app

      default:
        print("\nInvalid option! Please choose a number between 1 and 8.");
    }

    print("");   // empty line for clean output

  } while (true);
}