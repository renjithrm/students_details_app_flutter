import 'package:get/get.dart';
import 'package:student_details_app/data%20base/all_details.dart';
import 'package:student_details_app/data%20base/db_functions.dart';

class StudentController extends GetxController {
  // var hiveBox = <AllDetails>[].obs;
  final box = Boxes.getData().obs;
  var searchText = "".obs;
  getData() {
    box.value.values.toList();

    print(box.value.values.toList());
  }

  Future<void> addDetails(AllDetails value) async {
    await box.value.add(value);
    // update();
  }

  Future<void> deletDetails(int key) async {
    await box.value.delete(key);
    // update();

    print("hive ${box.value.values.toList()}");
  }

  Future updateDetails(AllDetails data, intex) async {
    box.value.putAt(intex, data);
    // update();
  }
}
