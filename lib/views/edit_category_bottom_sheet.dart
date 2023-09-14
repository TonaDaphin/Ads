import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:wonder/main.dart';
import 'package:wonder/models/category_class.dart';
import 'package:wonder/views/kButton.dart';

final nameController = TextEditingController();
var savedCategoryInfo = Hive.box(categoryInfo);
var uuid = const Uuid();
var itemId = 0;

void editCategoryBottomSheet(
    BuildContext context, CategoryClass cat, int index) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Edit Category',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(hintText: cat.name),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        KButton(
                          text: "Save",
                          backgroundColor:
                              const Color.fromARGB(255, 203, 59, 59),
                          onPressed: () {
                            Hive.box(categoryInfo).putAt(
                              index,
                              CategoryClass(nameController.text, cat.id),
                            );
                            // Hive.box(categoryInfo).putAt(
                            //   index,
                            //   Category([categoryController.text]),
                            // );
                            Navigator.of(context).pop()
                                // .then((widget) => widget.formKey.currentState.reset())
                                ;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      });
}

void addCategoryBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Add Category',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                        TextField(
                          controller: nameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        KButton(
                          text: "Save",
                          backgroundColor:
                              const Color.fromARGB(255, 203, 59, 59),
                          onPressed: () {
                            saveCategoryFunction();
                            Navigator.of(context).pop()
                                // .then((widget) => widget.formKey.currentState.reset())
                                ;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      });
}

void saveCategoryFunction() {
  var cat = CategoryClass(uuid.v1(), nameController.text);
  savedCategoryInfo.add(cat);
}
