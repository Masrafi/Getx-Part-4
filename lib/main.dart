import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_part4/getView_getWidget/home.dart';

import 'email_validation_getStorage/home.dart';

void main() async {
  await GetStorage.init(); //initialize storage driver
  runApp(HomeGetView());
}
