import 'dart:io';

mixin Printable {
  String getTimestamp() => DateTime.now().toString().split('.')[0];
  void printLog(String title, String details) =>
      print('\n========================================\n [$title] - Logged: ${getTimestamp()}\n========================================\n$details\n========================================');
}

abstract class CenterRecord with Printable {
  final String id, name;
  CenterRecord(this.id, this.name);
  String getDetails();
}

class LearningResource extends CenterRecord {
  final String category;
  double fee;
  LearningResource(String id, String name, this.category, this.fee) : super(id, name);

  @override
  String getDetails() => 'ID: $id | Resource: $name | Category: $category | Fee: \$${fee.toStringAsFixed(2)}';
}

class Participant extends CenterRecord {
  final String email;
  int enrolledCoursesCount;
  Participant(String id, String name, this.email, [this.enrolledCoursesCount = 0]) : super(id, name);

  @override
  String getDetails() => 'ID: $id | Participant: $name | Email: $email | Courses Enrolled: $enrolledCoursesCount';
}

class CommunityLearningCenter {
  final List<CenterRecord> _recordsList = [];
  final Map<String, CenterRecord> _recordsMap = {};

  void addRecord(CenterRecord r) {
    _recordsList.add(r);
    _recordsMap[r.id] = r;
    print('\n[SUCCESS] Record registered successfully! ID: ${r.id}');
  }

  void displayAllRecords() {
    if (_recordsList.isEmpty) return print('\n[INFO] No records found.');
    print('\n========================================\n      ALL COMMUNITY CENTER RECORDS      \n========================================');
    for (var r in _recordsList) print(r.getDetails());
    double total = _recordsList.whereType<LearningResource>().fold(0.0, (sum, r) => sum + r.fee);
    print('========================================\nTotal Registered Records: ${_recordsList.length}\nTotal Resource Fees: \$${total.toStringAsFixed(2)}\n========================================');
  }

  CenterRecord? findRecordById(String id) => _recordsMap[id];
}

void main() {
  final center = CommunityLearningCenter();
  print('****************************************************\n*  WELCOME TO COMMUNITY LEARNING CENTER SYSTEM     *\n****************************************************');

  while (true) {
    print('\n--- MAIN MENU ---\n1. Register Learning Resource\n2. Register Participant\n3. Search Record by ID\n4. View All Records & Summary\n5. Exit');
    stdout.write('Select an option (1-5): ');
    
    switch (stdin.readLineSync()?.trim()) {
      case '1':
        try {
          stdout.write('Enter Resource ID: '); String id = stdin.readLineSync()!.trim();
          stdout.write('Enter Resource Title: '); String title = stdin.readLineSync()!.trim();
          stdout.write('Enter Category: '); String cat = stdin.readLineSync()!.trim();
          stdout.write('Enter Fee Amount: '); double fee = double.parse(stdin.readLineSync()!.trim());
          var res = LearningResource(id, title, cat, fee);
          center.addRecord(res);
          res.printLog('NEW RESOURCE ADDED', res.getDetails());
        } catch (e) { print('\n[INPUT ERROR] ${e.toString()}'); }
        break;
      case '2':
        try {
          stdout.write('Enter Participant ID: '); String id = stdin.readLineSync()!.trim();
          stdout.write('Enter Full Name: '); String name = stdin.readLineSync()!.trim();
          stdout.write('Enter Email Address: '); String email = stdin.readLineSync()!.trim();
          if (!email.contains('@')) throw FormatException('Invalid email format.');
          var part = Participant(id, name, email);
          center.addRecord(part);
          part.printLog('NEW PARTICIPANT REGISTERED', part.getDetails());
        } catch (e) { print('\n[INPUT ERROR] ${e.toString()}'); }
        break;
      case '3':
        stdout.write('Enter ID to search: ');
        var r = center.findRecordById(stdin.readLineSync()?.trim() ?? '');
        print(r != null ? '\n[RECORD FOUND]\n${r.getDetails()}' : '\n[ERROR] Record not found.');
        break;
      case '4':
        center.displayAllRecords();
        break;
      case '5':
        print('\nExiting application. Thank you!');
        return;
      default:
        print('\n[ERROR] Invalid choice. Enter 1-5.');
    }
  }
}
