// ignore_for_file: prefer_const_constructors

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
              icon: const Icon(Icons.search))
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
                          return Card(
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
                          );
                        },
                        itemCount: data.length,
                      );
                    }),
                // ValueListenableBuilder(
                //   valueListenable: box.listenable(),
                //   builder: (BuildContext ctx, Box<AllDetails> newBox, _) {
                //     return ListView.builder(
                //       shrinkWrap: true,
                //       itemBuilder: (context, intex) {
                //         var alldata = box.values.toList();
                //         final data = alldata[intex];
                //         return ListTile(
                //           leading: Container(
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(30),
                //                 image: const DecorationImage(
                //                     image: NetworkImage(
                //                         'https://i.pinimg.com/564x/e7/c3/f4/e7c3f4a076b8472e0b1bd9c00a847f7f.jpg'))),
                //             width: 50,
                //             height: 50,
                //           ),
                //           title: Text(alldata[intex].name),
                //           trailing: Text(alldata[intex].id.toString()),
                //           onTap: () => Navigator.of(context).push(
                //               MaterialPageRoute(
                //                   builder: (context) => ProfileScreen(
                //                       name: data.name,
                //                       age: data.age,
                //                       rollNumber: data.rollNumber,
                //                       intex: intex))),
                //         );
                //       },
                //       itemCount: newBox.length,
                //     );
                //   },
                // ),
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
