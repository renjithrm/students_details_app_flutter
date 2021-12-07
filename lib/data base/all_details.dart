import 'package:hive_flutter/adapters.dart';

part 'all_details.g.dart';

@HiveType(typeId: 0)
class AllDetails extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String rollNumber;
  AllDetails(
      {required this.name,
      required this.age,
      required this.rollNumber,
      this.id});
}
