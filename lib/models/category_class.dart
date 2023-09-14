import 'package:hive_flutter/hive_flutter.dart';
part 'category_class.g.dart';

@HiveType(typeId: 1)
class CategoryClass extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  

  CategoryClass(this.name,
  
   this.id
   );
  @override
  String toString() => id;
  
}

