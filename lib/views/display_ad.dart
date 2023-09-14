import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wonder/views/ad.dart';
import 'package:wonder/models/ad_class.dart';
import 'package:wonder/main.dart';
import 'package:wonder/views/add_category.dart';

import 'editAdBottomSheet.dart';

class DisplayAd extends StatefulWidget {
  const DisplayAd({super.key});

  @override
  State<DisplayAd> createState() => _DisplayAdState();
}

class _DisplayAdState extends State<DisplayAd> {
  bool editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Advertising',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddCategoryView(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(adInfo).listenable(),
        builder: (context, Box box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text("No Ads"),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              Ad currentAd = box.getAt(index);
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 5),
                      Text('Company Name: ${currentAd.name}'),
                      const SizedBox(height: 5),
                      Text('Company Title: ${currentAd.title}'),
                      const SizedBox(height: 5),
                      Text('Company Description: ${currentAd.description}'),
                      const SizedBox(height: 5),
                      Text('Start Date: ${currentAd.start}'),
                      const SizedBox(height: 5),
                      Text('End Date: ${currentAd.end}'),
                      const SizedBox(height: 5),
                      Text('Company Website: ${currentAd.website}'),
                      const SizedBox(height: 5),
                      Text('Ad Category: ${currentAd.belongsTo}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              editing = true;
                              editAdBottomSheet(context, currentAd, index);
                            },
                            icon: const Icon(
                              Icons.mode_edit_outline_outlined,
                              color: Color(0xFFAEAEB0),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: Text(
                                    "Do you want to delete ${currentAd.name}?",
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        "No",
                                        style: TextStyle(
                                          color: Color(0xFFAEAEB0),
                                        ),
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                    TextButton(
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 203, 59, 59),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await box.deleteAt(index);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: Color.fromARGB(255, 203, 59, 59),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 203, 59, 59),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdView(),
                ),
              );
            },
            child: const Icon(
              Icons.add,
            ),
          );
        },
      ),
    );
  }
}
