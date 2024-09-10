import 'package:flutter/material.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainViewModel with ChangeNotifier {
  late Box<Sheet> sheetsBox;
  bool isLoading  = false;




}
