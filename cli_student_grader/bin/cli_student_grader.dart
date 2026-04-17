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
        recordScore();
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

  if (name == null || name.isEmpty) {
    print("Error: Name cannot be empty.");
    return;
  }

  var student = <String, dynamic>{
    "name": name,
    "scores": <int>[],
    "subjects": {...availableSubjects},
    "bonus": null,
    "comment": null,
  };

  students.add(student);
  print("Student '$name' added successfully!");
}

// ==================== STEP 4: RECORD SCORE ====================
void recordScore() {
  if (students.isEmpty) {
    print("No students available. Please add a student first.");
    return;
  }

  // Show numbered list of students using indexed for loop
  print("Select a student:");
  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  // Get student choice
  String? input = stdin.readLineSync();
  int studentIndex = int.tryParse(input ?? '') ?? 0;

  if (studentIndex < 1 || studentIndex > students.length) {
    print("Invalid student selection.");
    return;
  }

  // Get the selected student (0-based index)
  var student = students[studentIndex - 1];

  // Show available subjects
  print("\nAvailable subjects:");
  int subjectNum = 1;
  for (var subject in student["subjects"]) {
    print("$subjectNum. $subject");
    subjectNum++;
  }

  // Get subject choice
  input = stdin.readLineSync();
  int subjectIndex = int.tryParse(input ?? '') ?? 0;

  if (subjectIndex < 1 || subjectIndex > student["subjects"].length) {
    print("Invalid subject selection.");
    return;
  }

  // Get the actual subject name (using elementAt since it's a Set)
  String subject = student["subjects"].elementAt(subjectIndex - 1);

  // Validate score with while loop (must be 0-100)
  int score;
  while (true) {
    print("Enter score for $subject (0-100):");
    input = stdin.readLineSync();
    score = int.tryParse(input ?? '') ?? -1;

    if (score >= 0 && score <= 100) {
      break; // valid score → exit while loop
    }
    print("Invalid score! Please enter a number between 0 and 100.");
  }

  // Add score to student's scores list
  (student["scores"] as List<int>).add(score);

  print("Score recorded successfully for ${student["name"]} in $subject: $score");
}