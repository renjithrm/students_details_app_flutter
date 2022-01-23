import 'package:get/get.dart';
import 'package:student_details_app/data%20base/all_details.dart';
import 'package:student_details_app/data%20base/db_functions.dart';

class StudentController extends GetxController {
  // var hiveBox = <AllDetails>[].obs;
  final box = Boxes.getData().obs;

  getData() {
    box.value.values.toList();
    // update(['home']);
    print(box.value.values.toList());
  }

  Future<void> addDetails(AllDetails value) async {
    await box.value.add(value);

    // update(['home']);
  }

  Future<void> deletDetails(int key) async {
    await box.value.delete(key);
    update(["hello"]);
    // update(['home']);

    print("hive ${box.value.values.toList()}");
  }

  // Future updateDetails(AllDetails data, intex) async {
  //   box.putAt(intex, data);
  // }
}
