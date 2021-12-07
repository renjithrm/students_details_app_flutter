import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details_app/data base/all_details.dart';

ValueNotifier<List<AllDetails>> studentsDetails = ValueNotifier([]);

class Boxes {
  static Box<AllDetails> getData() => Hive.box<AllDetails>('details');
}

Future addDetails(AllDetails obj) async {
  final myBox = Boxes.getData();
  // studentsDetails.value.add(obj);
  var id = myBox.add(obj);
}

Future<void> deletDetails(int intex) async {
  final myBox = Boxes.getData();
  myBox.deleteAt(intex);
}

Future updateDetails(AllDetails data, intex) async {
  final myBox = Boxes.getData();
  myBox.putAt(intex, data);
}
