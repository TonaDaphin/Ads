import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wonder/main.dart';
import 'package:wonder/models/category_class.dart';
import 'package:wonder/views/editAdBottomSheet.dart';
import 'package:wonder/views/edit_category_bottom_sheet.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({super.key});

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Category',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(categoryInfo).listenable(),
        builder: (context, Box box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text("Add Categories"),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              CategoryClass currentCategory = box.getAt(index);
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 5),
                      Text('Category ID: ${currentCategory.name}'),
                      const SizedBox(height: 5),
                      Text('Category Name: ${currentCategory.id}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              // editAdBottomSheet(context, currentAd, index);
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
                                    "Do you want to delete ${currentCategory.name}?",
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
              addCategoryBottomSheet(context);
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
