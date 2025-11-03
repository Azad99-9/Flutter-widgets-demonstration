import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// class HiveService {


// }

void main() async {
  final simpleBoxName = "simple_box";

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final simpleBox = await Hive.openBox(simpleBoxName);

  await simpleBox.put("id", 1);

  final result = await simpleBox.get("id");

  print(result);
}