import 'package:flutter/material.dart';
import 'package:student_details_app/data%20base/all_details.dart';
import 'package:student_details_app/data%20base/db_functions.dart';
import 'package:student_details_app/screens/add_details.dart';
import 'package:student_details_app/screens/profile_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_details_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = Boxes.getData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Student Detsils'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchScreen())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: box.values.isEmpty
          ? const Center(
              child: Text(
                'Add Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (BuildContext ctx, Box<AllDetails> newBox, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, intex) {
                      var alldata = box.values.toList();

                      final data = alldata[intex];
                      return ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/564x/e7/c3/f4/e7c3f4a076b8472e0b1bd9c00a847f7f.jpg'))),
                          width: 50,
                          height: 50,
                        ),
                        title: Text(alldata[intex].name),
                        trailing: Text(alldata[intex].rollNumber),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                    name: data.name,
                                    age: data.age,
                                    rollNumber: data.rollNumber,
                                    intex: intex))),
                      );
                    },
                    itemCount: newBox.length,
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AddDetails()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
