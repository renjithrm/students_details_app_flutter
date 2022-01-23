import 'package:hive_flutter/adapters.dart';
import 'package:student_details_app/data base/all_details.dart';

class Boxes {
  static Box<AllDetails> getData() => Hive.box<AllDetails>('details');
}
