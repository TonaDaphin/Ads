import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'ad_class.g.dart';

@HiveType(typeId: 0)
class Ad extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? start;
  @HiveField(4)
  final String? end;
  @HiveField(5) 
  final String? website;
  @HiveField(6)
  HiveList? belongsTo;

  Ad(this.name, this.title, this.description, this.start, this.end,
      this.website);
}
