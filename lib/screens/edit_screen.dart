import 'package:flutter/material.dart';
import 'package:student_details_app/data%20base/all_details.dart';
import 'package:student_details_app/data%20base/db_functions.dart';
import 'package:student_details_app/screens/profile_screen.dart';

class EditDetails extends StatefulWidget {
  // const EditDetails({Key? key}) : super(key: key);
  String name;
  String age;
  String rollNumber;
  int? intex;

  EditDetails(
      {Key? key,
      required this.name,
      required this.age,
      required this.rollNumber,
      this.intex})
      : super(key: key);
  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  final formkey = GlobalKey<FormState>();
  Widget div = const SizedBox(height: 30);
  Widget rowDiv = const SizedBox(width: 30);
  TextEditingController nameControler = TextEditingController();
  TextEditingController ageControler = TextEditingController();
  TextEditingController rollNumberControler = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (nameControler != null) {
      nameControler.text = widget.name;
      ageControler.text = widget.age;
      rollNumberControler.text = widget.rollNumber;
    } else {
      return;
    }
  }

  // late String editName;

  // late String editAge;

  // late String editRollNumber;
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
                    saveButton(),
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
      controller: nameControler,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Enter your name'),
      onChanged: (value) {
        setState(() {
          widget.name = value;
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
      controller: ageControler,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Enter your age',
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          widget.age = value;
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
      controller: rollNumberControler,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Enter your Roll Number'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          widget.rollNumber = value;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'enter roll number';
        }
      },
    );
  }

  saveButton() {
    return ElevatedButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            AllDetails details = AllDetails(
                name: widget.name,
                age: widget.age,
                rollNumber: widget.rollNumber);
            await updateDetails(details, widget.intex);
            // Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ProfileScreen(
                    name: widget.name,
                    age: widget.age,
                    rollNumber: widget.rollNumber)));
          } else {
            return;
          }
        },
        child: const Text('Save'));
  }

  cancelButton() {
    return TextButton(
        onPressed: () => Navigator.of(context).pop(), child: Text('Cancel'));
  }
}
