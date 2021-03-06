// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_details_app/controller/student_data_contoller.dart';
import 'package:student_details_app/data%20base/db_functions.dart';
import 'package:student_details_app/screens/add_details.dart';
import 'package:student_details_app/screens/profile_screen.dart';
import 'package:student_details_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = Boxes.getData();
  final studentController = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: const [Colors.blue, Colors.white])),
        ),
        title: const Text('All Student Detsils'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchScreen())),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: const [Colors.blue, Colors.white])),
        child: box.values.isEmpty
            ? const Center(
                child: Text(
                  'Add Details',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<StudentController>(
                    id: "hello",
                    builder: (_) {
                      final data = studentController.box.value.values.toList();
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color:
                                            Color.fromARGB(255, 201, 199, 199),
                                        offset: Offset(4, 10),
                                        blurStyle: BlurStyle.normal)
                                  ]),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://i.pinimg.com/564x/e7/c3/f4/e7c3f4a076b8472e0b1bd9c00a847f7f.jpg'),
                                ),
                                title: Text(data[index].name),
                                trailing: Text(data[index].rollNumber),
                                onTap: () async {
                                  return Get.to(ProfileScreen(
                                    name: data[index].name,
                                    age: data[index].age,
                                    rollNumber: data[index].rollNumber,
                                    index: index,
                                  ));
                                },
                              ),
                            ),
                          );
                        },
                        itemCount: data.length,
                      );
                    }),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddDetails()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
