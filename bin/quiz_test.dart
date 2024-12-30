
abstract class Role {
  void displayRole();
}
class Person {
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  void displayRole() {
    role.displayRole();
  }
}
class Student extends Person {
  String studentID;
  String grade = '';
  List<double> courseScores;

  Student(String name, int age, String address, this.studentID)
      : courseScores = [],
        super(name, age, address, StudentRole());

  void addCourseScore(double score) {
    courseScores.add(score);
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    double total = courseScores.reduce((a, b) => a + b);
    return total / courseScores.length;
  }

  String determineGrade(double averageScore) {
    if (averageScore >= 90) {
      return 'A';
    } else if (averageScore >= 80) {
      return 'B';
    } else if (averageScore >= 70) {
      return 'C';
    } else if (averageScore >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }

  void displayStudentInfo() {
    double averageScore = calculateAverageScore();
    grade = determineGrade(averageScore);

    print("Student Details Below:");
    displayRole();
    print("Name: ${getName()}");
    print("Age: ${getAge()}");
    print("Address: ${getAddress()}");
    print("StudentID: $studentID");
    print("Average Score: ${averageScore.toStringAsFixed(2)}");
    print("Grade: $grade");
  }
}
class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address, TeacherRole());

  @override
  void displayRole() {
    role.displayRole();
  }
  void displayTeacherInfo() {
    print("Teacher Details Below:");
    displayRole();
    print("Name: ${getName()}");
    print("Age: ${getAge()}");
    print("TeacherID: $teacherID");
    print("Address: ${getAddress()}");
    print("Courses Name:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

void main() {
  Student student = Student("Rayhan Hosen", 24, "Gazipur Dhaka", "21103");
  student.addCourseScore(87);
  student.addCourseScore(73);
  student.addCourseScore(69);
  student.displayStudentInfo();

  print("");

  Teacher teacher = Teacher("Mr. Kamal Khan", 52, "Uttara", "446", ["Math", "English", "Bangla"]);
  teacher.displayTeacherInfo();
}
