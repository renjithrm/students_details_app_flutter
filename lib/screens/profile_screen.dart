import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_details_app/controller/student_data_contoller.dart';
import 'package:student_details_app/data%20base/db_functions.dart';
import 'package:student_details_app/screens/edit_screen.dart';

class ProfileScreen extends StatelessWidget {
  String name;
  String age;
  String rollNumber;
  int? index;
  ProfileScreen(
      {Key? key,
      required this.name,
      required this.age,
      required this.rollNumber,
      this.index})
      : super(key: key);
  Widget div = const SizedBox(
    height: 30,
  );
  // final box = Boxes.getData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                if (index != null) {
                  int keys = await Boxes.getData().keyAt(index!);
                  await Get.find<StudentController>().deletDetails(keys);
                  Get.find<StudentController>().update(["hello"]);
                  Get.snackbar(name, "Delect from database");
                  Navigator.of(context).pop();
                } else {
                  print('no intex');
                }
              },
              icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => EditDetails(
                            name: name,
                            age: age,
                            rollNumber: rollNumber,
                            intex: index,
                          ))),
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey,
              child: const Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/e7/c3/f4/e7c3f4a076b8472e0b1bd9c00a847f7f.jpg'),
                  radius: 70,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      div,
                      showName(),
                      div,
                      showAge(),
                      div,
                      showRollNumber(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showName() {
    // final boxName = box.values.toList();
    // final data = boxName[intex!];
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          "Name : $name",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  showAge() {
    // final boxName = box.values.toList();
    // final data = boxName[intex!];
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          "Age : $age",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  showRollNumber() {
    // final boxName = box.values.toList();
    // final data = boxName[intex!];
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          "Roll Number : $rollNumber",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
