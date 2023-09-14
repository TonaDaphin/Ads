import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wonder/models/ad_class.dart';
import 'package:wonder/models/category_class.dart';
import 'package:wonder/views/home.dart';

const adInfo = 'ad_info';
const categoryInfo = 'category_info';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Ad>(AdAdapter());
  Hive.registerAdapter<CategoryClass>(CategoryClassAdapter());
  await Hive.openBox(adInfo);
  await Hive.openBox(categoryInfo);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
