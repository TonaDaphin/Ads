import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wonder/models/ad_class.dart';
import 'package:wonder/main.dart';
import 'package:wonder/views/kButton.dart';

final nameController = TextEditingController();
final titleController = TextEditingController();
final descriptionController = TextEditingController();
final startController = TextEditingController();
final endController = TextEditingController();
final websiteController = TextEditingController();
final categoryController = TextEditingController();

void editAdBottomSheet(BuildContext context, Ad ad, int index) {
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
            height: MediaQuery.of(context).size.height * 0.5,
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
                                  'Edit',
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
                          decoration: InputDecoration(hintText: ad.name),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(hintText: ad.title),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(hintText: ad.description),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: startController,
                          decoration: InputDecoration(hintText: ad.start),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: endController,
                          decoration: InputDecoration(hintText: ad.end),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: websiteController,
                          decoration: InputDecoration(hintText: ad.website),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: categoryController,
                          decoration:
                              InputDecoration(hintText: ad.belongsTo.toString()),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        KButton(
                          text: "Save",
                          backgroundColor:
                              const Color.fromARGB(255, 203, 59, 59),
                          onPressed: () {
                            Hive.box(adInfo).putAt(
                              index,
                              Ad(
                                nameController.text,
                                titleController.text,
                                descriptionController.text,
                                startController.text,
                                endController.text,
                                websiteController.text,
                              ),
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
