import 'dart:io';

const String appTitle = "Student Grader v1.0";

final Set<String> availableSubjects = {
  "Math",
  "English",
  "Science",
  "History",
};

var students = <Map<String, dynamic>>[];

void main() {
  do {
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

Choose an option: ''');

    String? input = stdin.readLineSync();
    int choice = int.tryParse(input ?? '') ?? 0;

    switch (choice) {
      case 1:
        addStudent();
        break;
      case 2:
        print("Record Score feature coming soon...");
        break;
      case 3:
        print("Add Bonus Points feature coming soon...");
        break;
      case 4:
        print("Add Comment feature coming soon...");
        break;
      case 5:
        print("View All Students feature coming soon...");
        break;
      case 6:
        print("View Report Card feature coming soon...");
        break;
      case 7:
        print("Class Summary feature coming soon...");
        break;
      case 8:
        print("Thank you for using $appTitle. Goodbye!");
        return;
      default:
        print("Invalid option. Please choose a number between 1 and 8.");
    }
  } while (true);
}

// ==================== STEP 3: ADD STUDENT ====================
void addStudent() {

  print("Enter student name:");
  String? name = stdin.readLineSync()?.trim();

  // Basic validation - name should not be empty
  if (name == null || name.isEmpty) {
    print("Error: Name cannot be empty.");
    return;
  }

  // Create student Map with exact required structure
  var student = <String, dynamic>{
    "name": name,
    "scores": <int>[],                    
    "subjects": {...availableSubjects},   
    "bonus": null,                        
    "comment": null,                      
  };

  // Add to the main students list
  students.add(student);

  // Confirmation using string interpolation
  print("Student '$name' added successfully!");
}