import 'package:flutter/material.dart';
import 'package:student_details_app/data%20base/all_details.dart';
import 'package:student_details_app/data%20base/db_functions.dart';
import 'package:student_details_app/screens/home_screen.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  late String name;
  late String age;
  late String rollNumber;
  final formkey = GlobalKey<FormState>();
  Widget div = const SizedBox(height: 30);
  Widget rowDiv = const SizedBox(width: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      onChanged: (value) {
        setState(() {
          name = value;
        });
      },
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
      onChanged: (value) {
        setState(() {
          age = value;
        });
      },
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
      onChanged: (value) {
        setState(() {
          rollNumber = value;
        });
      },
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
            AllDetails details =
                AllDetails(name: name, age: age, rollNumber: rollNumber);
            addDetails(details);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()));
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
