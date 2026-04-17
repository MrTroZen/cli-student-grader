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
        addBonusPoints();
        break;
      case 4:
        addComment();
        break;
      case 5:
        viewAllStudents();
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

  print("Select a student:");
  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  String? input = stdin.readLineSync();
  int studentIndex = int.tryParse(input ?? '') ?? 0;

  if (studentIndex < 1 || studentIndex > students.length) {
    print("Invalid student selection.");
    return;
  }

  var student = students[studentIndex - 1];

  print("\nAvailable subjects:");
  int subjectNum = 1;
  for (var subject in student["subjects"]) {
    print("$subjectNum. $subject");
    subjectNum++;
  }

  input = stdin.readLineSync();
  int subjectIndex = int.tryParse(input ?? '') ?? 0;

  if (subjectIndex < 1 || subjectIndex > student["subjects"].length) {
    print("Invalid subject selection.");
    return;
  }

  String subject = student["subjects"].elementAt(subjectIndex - 1);

  int score;
  while (true) {
    print("Enter score for $subject (0-100):");
    input = stdin.readLineSync();
    score = int.tryParse(input ?? '') ?? -1;

    if (score >= 0 && score <= 100) {
      break;
    }
    print("Invalid score! Please enter a number between 0 and 100.");
  }

  (student["scores"] as List<int>).add(score);
  print("Score recorded successfully for ${student["name"]} in $subject: $score");
}

// ==================== STEP 5: ADD BONUS POINTS ====================
void addBonusPoints() {
  if (students.isEmpty) {
    print("No students available. Please add a student first.");
    return;
  }

  print("Select a student to add bonus:");
  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  String? input = stdin.readLineSync();
  int studentIndex = int.tryParse(input ?? '') ?? 0;

  if (studentIndex < 1 || studentIndex > students.length) {
    print("Invalid student selection.");
    return;
  }

  var student = students[studentIndex - 1];

  if (student["bonus"] != null) {
    print("Bonus already set for ${student["name"]}. Current bonus: ${student["bonus"]}");
    return;
  }

  print("Enter bonus points (1-10):");
  input = stdin.readLineSync();
  int bonusValue = int.tryParse(input ?? '') ?? 0;

  if (bonusValue < 1 || bonusValue > 10) {
    print("Bonus must be between 1 and 10.");
    return;
  }

  student["bonus"] ??= bonusValue;

  print("Bonus of +$bonusValue added for ${student["name"]}");
}

// ==================== STEP 6: ADD COMMENT ====================
void addComment() {
  if (students.isEmpty) {
    print("No students available. Please add a student first.");
    return;
  }

  print("Select a student to add comment:");
  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  String? input = stdin.readLineSync();
  int studentIndex = int.tryParse(input ?? '') ?? 0;

  if (studentIndex < 1 || studentIndex > students.length) {
    print("Invalid student selection.");
    return;
  }

  var student = students[studentIndex - 1];

  print("Enter comment for ${student["name"]}:");
  String? comment = stdin.readLineSync()?.trim();

  if (comment == null || comment.isEmpty) {
    print("Comment cannot be empty.");
    return;
  }

  student["comment"] = comment;

  print("Comment added successfully for ${student["name"]}");
}

// ==================== STEP 7: VIEW ALL STUDENTS ====================
void viewAllStudents() {
  if (students.isEmpty) {
    print("No students available.");
    return;
  }

  print("\n=== All Students ===");

  // for-in loop to iterate over students (required concept)
  for (var student in students) {
    // Collection if inside list literal (required)
    var tags = [
      student["name"],
      "${student["scores"].length} scores",
      if (student["bonus"] != null) "⭐ Has Bonus",
    ];

    // Join tags with " | " for clean output
    print(tags.join(" | "));

    // Safe comment display using ?. and ?? (required null-aware operators)
    String commentDisplay = student["comment"]?.toUpperCase() ?? "No comment provided";
    if (commentDisplay != "No comment provided") {
      print("   Comment: $commentDisplay");
    }
  }

  print("====================\n");
}