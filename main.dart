import 'dart:io';

mixin RecordInfo {
  String getDate() {
    return DateTime.now().toString();
  }
}

abstract class CenterRecord {
  String id;
  String name;
  CenterRecord(this.id, this.name);
  void displayDetails();
}

class LearningResource extends CenterRecord with RecordInfo {
  String _category;
  int _quantity;
  LearningResource(
    String id,
    String name,
    String category,
    int quantity,
  )   : _category = category,
        _quantity = quantity,
        super(id, name);
  String get category => _category;
  int get quantity => _quantity;
  void setQuantity(int value) {
    if (value >= 0) {
      _quantity = value;
    }
  }

  @override
  void displayDetails() {
    print('\n--- LEARNING RESOURCE ---');
    print('ID: $id');
    print('Name: $name');
    print('Category: $_category');
    print('Quantity: $_quantity');
    print('Date Added: ${getDate()}');
  }
}

class Participant extends CenterRecord with RecordInfo {
  String _contact;
  Participant(
    String id,
    String name,
    String contact,
  )   : _contact = contact,
        super(id, name);
  String get contact => _contact;

  @override
  void displayDetails() {
    print('\n--- PARTICIPANT ---');
    print('ID: $id');
    print('Name: $name');
    print('Contact: $_contact');
    print('Date Registered: ${getDate()}');
  }
}

List<CenterRecord> records = [];
Map<String, CenterRecord> recordMap = {};

bool isDuplicate(String id) {
  return recordMap.containsKey(id);
}

void addResource() {
  print('\n--- ADD LEARNING RESOURCE ---');
  stdout.write('Enter Resource ID: ');
  String id = stdin.readLineSync()?.trim() ?? '';
  if (id.isEmpty || isDuplicate(id)) {
    print('Invalid or duplicate ID!');
    return;
  }
  stdout.write('Enter Resource Name: ');
  String name = stdin.readLineSync()?.trim() ?? '';
  if (name.isEmpty) {
    print('Resource name cannot be empty!');
    return;
  }
  stdout.write('Enter Category: ');
  String category = stdin.readLineSync()?.trim() ?? '';
  if (category.isEmpty) {
    print('Category cannot be empty!');
    return;
  }
  stdout.write('Enter Quantity: ');
  String input = stdin.readLineSync() ?? '';
  int? quantity = int.tryParse(input);
  if (quantity == null || quantity < 0) {
    print('Invalid quantity! Enter a positive whole number or zero.');
    return;
  }
  LearningResource resource =
      LearningResource(id, name, category, quantity);
  records.add(resource);
  recordMap[id] = resource;
  print('Resource successfully added!');
}

void registerParticipant() {
  print('\n--- REGISTER PARTICIPANT ---');
  stdout.write('Enter Participant ID: ');
  String id = stdin.readLineSync()?.trim() ?? '';
  if (id.isEmpty || isDuplicate(id)) {
    print('Invalid or duplicate ID!');
    return;
  }
  stdout.write('Enter Participant Name: ');
  String name = stdin.readLineSync()?.trim() ?? '';
  if (name.isEmpty) {
    print('Name cannot be empty!');
    return;
  }
  stdout.write('Enter Contact Number: ');
  String contact = stdin.readLineSync()?.trim() ?? '';
  if (contact.isEmpty) {
    print('Contact number cannot be empty!');
    return;
  }
  Participant participant = Participant(id, name, contact);
  records.add(participant);
  recordMap[id] = participant;
  print('Participant successfully registered!');
}

void viewRecords() {
  print('\n--- ALL RECORDS ---');
  if (records.isEmpty) {
    print('No records available.');
    return;
  }
  for (CenterRecord record in records) {
    record.displayDetails();
  }
}

void searchRecord() {
  print('\n--- SEARCH RECORD ---');
  stdout.write('Enter Record ID: ');
  String id = stdin.readLineSync()?.trim() ?? '';
  if (recordMap.containsKey(id)) {
    print('Record found!');
    recordMap[id]!.displayDetails();
  } else {
    print('Record not found!');
  }
}

void main() {
  bool running = true;

  while (running) {
    print('\n================================');
    print(' COMMUNITY LEARNING CENTER');
    print('================================');
    print('1. Add Learning Resource');
    print('2. Register Participant');
    print('3. View All Records');
    print('4. Search Record');
    print('5. Exit');
    print('================================');
    stdout.write('Enter your choice: ');
    
    String choice = stdin.readLineSync()?.trim() ?? '';
    switch (choice) {
      case '1':
        addResource();
        break;

      case '2':
        registerParticipant();
        break;

      case '3':
        viewRecords();
        break;

      case '4':
        searchRecord();
        break;

      case '5':
        print('\nThank you for using the system!');
        running = false;
        break;

      default:
        print('Invalid choice! Please select 1-5.');
    }
  }
}