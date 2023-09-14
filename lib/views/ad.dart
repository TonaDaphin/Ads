import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wonder/models/ad_class.dart';
import 'package:wonder/main.dart';
import 'package:wonder/models/category_class.dart';
import 'package:wonder/views/display_ad.dart';
import 'package:wonder/views/kButton.dart';
import 'package:wonder/views/kText.dart';

class AdView extends StatefulWidget {
  AdView({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  State<AdView> createState() => _AdViewState();
}

class _AdViewState extends State<AdView> {
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final websiteController = TextEditingController();
  final categoryController = TextEditingController();

  var savedAdInfo = Hive.box(adInfo);
  var savedCategoryInfo = Hive.box(categoryInfo);

  void initstate() {
    super.initState();
    // savedAdInfo = Hive.box(adInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Ad",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: widget.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Add Your Ad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              "Advertise your business, brand or organization",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Media File",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 233, 233, 233),
                                  )),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 34),
                                    child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                        onTap: () async {
                                          // final ImagePicker _picker = ImagePicker();
                                          // try {
                                          //   final pickedFile =
                                          //       await _picker.pickImage(
                                          //     source: ImageSource.gallery,
                                          //     imageQuality: 80,
                                          //   );
                                          //   if (pickedFile != null) {
                                          //     controller.product = controller.product
                                          //         .copyWith(picture: pickedFile.path);
                                          //     controller.update();
                                          //   }
                                          // } catch (e) {}
                                        },
                                        child:
                                            // controller.product.picture.isEmpty ?
                                            Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                // color: Color(0xFFAEAEB0),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.photo_library_outlined,
                                                  color: Color(0xFFAEAEB0),
                                                  size: 45,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Upload Image",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 203, 59, 59),
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            ),
                                            Text(
                                              "Upload a .png & .jpg file",
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                          ],
                                        )
                                        // : ClipRRect(
                                        //     borderRadius: BorderRadius.circular(
                                        //       16,
                                        //     ),
                                        //     child: Image.file(
                                        //       File(
                                        //         controller.product.picture,
                                        //       ),
                                        //       width: 70,
                                        //       height: 70,
                                        //       fit: BoxFit.cover,
                                        //     ),
                                        //   ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Company Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            KTextField(
                              controller: nameController,
                              hintText: "Enter Company Name",
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Divider(height: 2),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 2.0),
                              child: Text(
                                "Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Company Title',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            KTextField(
                              controller: titleController,
                              hintText: "Enter Company Title",
                              maxLines: 3,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Company Description',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            KTextField(
                              controller: descriptionController,
                              hintText: "Enter Company Description...",
                              maxLines: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          'Start Date',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          child: TextFormField(
                                            controller: startController,
                                            maxLines: 1,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            decoration: InputDecoration(
                                              iconColor: Theme.of(context)
                                                  .primaryColor,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 233, 233, 233),
                                                  width: 1.5,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 16,
                                              ),
                                              fillColor:
                                                  const Color(0xFFEFF2F5),
                                              suffixIcon: const Icon(
                                                Icons.calendar_month_outlined,
                                                color: Color.fromARGB(
                                                    255, 141, 33, 25),
                                              ),
                                              filled: false,
                                              hintText: "22-12-1995",
                                              hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          'End Date',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          child: TextFormField(
                                            controller: endController,
                                            maxLines: 1,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            decoration: InputDecoration(
                                              iconColor: Theme.of(context)
                                                  .primaryColor,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 233, 233, 233),
                                                  width: 1.5,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 16,
                                              ),
                                              fillColor:
                                                  const Color(0xFFEFF2F5),
                                              suffixIcon: const Icon(
                                                Icons.calendar_month_outlined,
                                                color: Color.fromARGB(
                                                    255, 141, 33, 25),
                                              ),
                                              filled: false,
                                              hintText: "22-12-1995",
                                              hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Website',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  KTextField(
                                    controller: websiteController,
                                    hintText: "www.mycompany.com/",
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        'Category',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    // KTextField(
                                    //   controller: categoryController,
                                    //   hintText: "Health",
                                    //   maxLines: 1,
                                    // ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: OutlinedButton(
                                            onPressed: () {
                                              showMoreOptions(context);
                                            },
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor:
                                                  Colors.grey.shade500,
                                              backgroundColor: Colors.white,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 13,
                                                horizontal: 16,
                                              ),
                                            ),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Categories",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Icon(Icons
                                                    .keyboard_arrow_down_outlined),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Divider(height: 2),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 2.0),
                                    child: Text(
                                      "Targeting",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          'Location',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: TextFormField(
                                            maxLines: 1,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            decoration: InputDecoration(
                                              iconColor: Theme.of(context)
                                                  .primaryColor,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 233, 233, 233),
                                                  width: 1.5,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 16,
                                              ),
                                              fillColor:
                                                  const Color(0xFFEFF2F5),
                                              suffixIcon: const Icon(
                                                  Icons.location_on_outlined),
                                              filled: false,
                                              hintText: "Rwanda",
                                              hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: KButton(
                          text: "Save",
                          backgroundColor:
                              const Color.fromARGB(255, 203, 59, 59),
                          onPressed: () {
                            saveAdFunction();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DisplayAd(),
                              ),
                            )
                                // .then((widget) => widget.formKey.currentState.reset())
                                ;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void saveAdFunction() {
    var cat = CategoryClass(categoryController.text, "1");
    savedCategoryInfo.add(cat);

    var ad = Ad(
      nameController.text,
      titleController.text,
      descriptionController.text,
      startController.text,
      endController.text,
      websiteController.text,
    );
    savedAdInfo.add(ad);
    print('caught');
    ad.belongsTo = HiveList(savedCategoryInfo);
    ad.belongsTo?.add(cat);
    ad.belongsTo?.forEach((element) {
      print(element);
    });
    // savedCategoryInfo.add(
    //   Category(sections)
    // )
  }
}

void showMoreOptions(BuildContext context) {
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
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              ValueListenableBuilder(
                valueListenable: Hive.box(categoryInfo).listenable(),
                builder: (context, Box box, _) {
                  if (box.values.isEmpty) {
                    return const Center(
                      child: Text("Add Categories"),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        CategoryClass currentCategory = box.getAt(index);
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 10),
                                Text('Category Name: ${currentCategory.id}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      );
    },
  );
}
