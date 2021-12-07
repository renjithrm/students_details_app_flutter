import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_details_app/data%20base/all_details.dart';
import 'package:student_details_app/data%20base/db_functions.dart';
import 'package:student_details_app/screens/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final box = Boxes.getData();

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search...'),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
              ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (BuildContext context, Box<AllDetails> newBox, _) {
                    var result = searchText.isEmpty
                        ? box.values.toList()
                        : box.values
                            .where((a) => a.name
                                .toLowerCase()
                                .contains(searchText.toLowerCase()))
                            .toList();
                    return searchText.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                'No details'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, intex) {
                              var getIntex = box.values.toList();
                              var get = box.values
                                  .where((a) =>
                                      a.name.contains(result[intex].name))
                                  .toList();
                              var id = getIntex.indexOf(get.first);
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
                                  title: Text(result[intex].name),
                                  trailing: Text(result[intex].rollNumber),
                                  onTap: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ProfileScreen(
                                          name: result[intex].name,
                                          age: result[intex].age,
                                          rollNumber: result[intex].rollNumber,
                                          intex: id,
                                        ),
                                      )));
                            },
                            itemCount: result.length,
                          );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
