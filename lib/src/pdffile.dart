import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:share_extend/share_extend.dart';
Future<void> saveAndLaunchFile(List<int> bytes,String filename) async{
  final path = (await getExternalStorageDirectory())?.path;
  print(path);
  final file = File('$path/$filename');
  await file.writeAsBytes(bytes,flush: true);
  //OpenFile.open('$path/$filename');
  ShareExtend.share('$path/$filename', 'pdf',);

//file
}
