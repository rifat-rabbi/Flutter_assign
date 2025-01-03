// Define an abstract class Role
import 'dart:io';

abstract class Role {
  void displayRole();
}

// Class Person implementing Role
class Person implements Role {
  String? name;
  int? age;
  String? address;

  // Constructor
  Person({
    this.name,
    this.age,
    this.address,
  });

  // Getter methods
  String? get getName => name;
  int? get getAge => age;
  String? get getAddress => address;

  // Implement displayRole from Role
  @override
  void displayRole() {
    print('Role: Person');
  }
}

// Class Student extending Person
class Student extends Person {
  String? studentID;
  String? grade;
  List<int>? courseScores;

  // Constructor without 'required' and with null safety
  Student({
  super.name,
  super.age,
  super.address,
  this.studentID,
  this.grade,
  this.courseScores,
  });

  // Override displayRole
  @override
  @override
  void displayRole() {
    print('Role: Student');
  }

// Calculate average score
double calculateAverageScore() {
  if (courseScores == null || courseScores!.isEmpty) {
    return 0.0; // Return 0.0 if the scores list is null or empty
  }
  return courseScores!.reduce((a, b) => a + b) / courseScores!.length;
}
}

// Class Teacher extending Person
class Teacher extends Person {
  String ?teacherID;
  List<String> ?coursesTaught;

  // Constructor
  Teacher({
    String? name,
    int? age,
    String? address,
     this.teacherID,
     this.coursesTaught,
  }) : super(name: name, age: age, address: address);

  // Override displayRole
  @override
  void displayRole() {
    print('Role: Teacher');
  }

  // Display courses taught
  void displayCoursesTaught() {
    print('Courses Taught:');
    for (var course in coursesTaught!) {
      print('- $course');
    }
  }
}

// Main function to test the classes

void main() {
  // Input and create a Student instance
  print('Enter Student Information:');
  stdout.write('Name: ');
  String? studentName = stdin.readLineSync();

  stdout.write('Age: ');
  int? studentAge = int.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Address: ');
  String? studentAddress = stdin.readLineSync();

  stdout.write('Student ID: ');
  String? studentID = stdin.readLineSync();

  stdout.write('Grade: ');
  String? studentGrade = stdin.readLineSync();

  stdout.write('Enter course scores separated by commas: ');
  List<int>? courseScores = stdin
      .readLineSync()
      ?.split(',')
      .map((score) => int.tryParse(score.trim()) ?? 0)
      .toList();

  var student = Student(
    name: studentName,
    age: studentAge,
    address: studentAddress,
    studentID: studentID,
    grade: studentGrade,
    courseScores: courseScores,
  );

  // Input and create a Teacher instance
  print('\nEnter Teacher Information:');
  stdout.write('Name: ');
  String? teacherName = stdin.readLineSync();

  stdout.write('Age: ');
  int? teacherAge = int.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Address: ');
  String? teacherAddress = stdin.readLineSync();

  stdout.write('Teacher ID: ');
  String? teacherID = stdin.readLineSync();

  stdout.write('Enter courses taught separated by commas: ');
  List<String>? coursesTaught = stdin
      .readLineSync()
      ?.split(',')
      .map((course) => course.trim())
      .toList();

  var teacher = Teacher(
    name: teacherName,
    age: teacherAge,
    address: teacherAddress,
    teacherID: teacherID,
    coursesTaught: coursesTaught,
  );

  // Display Student information
  print('\nStudent Information:');
  student.displayRole();
  print('Name: ${student.getName}');
  print('Age: ${student.getAge}');
  print('Address: ${student.getAddress}');
  print('Average Score: ${student.calculateAverageScore().toStringAsFixed(1)}');
  print('');

  // Display Teacher information
  print('Teacher Information:');
  teacher.displayRole();
  print('Name: ${teacher.getName}');
  print('Age: ${teacher.getAge}');
  print('Address: ${teacher.getAddress}');
  teacher.displayCoursesTaught();
}

