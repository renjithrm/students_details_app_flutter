import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_details_app/controller/student_data_contoller.dart';
import 'package:student_details_app/data%20base/all_details.dart';
import 'package:student_details_app/screens/home_screen.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final formkey = GlobalKey<FormState>();
  Widget div = const SizedBox(height: 30);
  Widget rowDiv = const SizedBox(width: 30);
  final name = TextEditingController();
  final age = TextEditingController();
  final rollNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text('Add Details'),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                div,
                const Text(
                  "Add Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                div,
                addName(),
                div,
                addage(),
                div,
                addRollNumber(),
                div,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addButton(),
                    rowDiv,
                    cancelButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addName() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Enter your name'),
      // onChanged: (value) {
      //   setState(() {
      //     name = value;
      //   });
      // },
      controller: name,
      validator: (nam) {
        if (nam!.isEmpty) {
          return 'enter name';
        }
      },
    );
  }

  addage() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Enter your age',
      ),
      keyboardType: TextInputType.number,
      // onChanged: (value) {
      //   setState(() {
      //     age = value;
      //   });
      // },
      controller: age,
      validator: (value) {
        if (value!.isEmpty) {
          return 'enter age';
        }
      },
    );
  }

  addRollNumber() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Enter your Roll Number'),
      keyboardType: TextInputType.number,
      // onChanged: (value) {
      //   setState(() {
      //     rollNumber = value;
      //   });
      // },
      controller: rollNumber,
      validator: (value) {
        if (value!.isEmpty) {
          return 'enter roll number';
        }
      },
    );
  }

  addButton() {
    return ElevatedButton(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            AllDetails details = AllDetails(
                name: name.text, age: age.text, rollNumber: rollNumber.text);

            Get.find<StudentController>().addDetails(details);
            Get.find<StudentController>().update(["hello"]);
            Navigator.of(context).pop();
          } else {
            return;
          }
        },
        child: const Text('Add'));
  }

  cancelButton() {
    return TextButton(
        onPressed: () => Navigator.of(context).pop(), child: Text('Cancel'));
  }
}
