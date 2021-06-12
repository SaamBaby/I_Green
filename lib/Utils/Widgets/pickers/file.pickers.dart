

import 'dart:io';

import 'package:file_picker/file_picker.dart';
// import 'package:file_picker/file_picker.dart';

class FilePickers {

  static Future<PlatformFile> pickDocs() async{
    final  result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', ],
    );
    if(result== null) return null;
    print(result.files.first.extension);
    return result.files.first;
  }


  // for picking the jpeg file
  static Future<File> pickImage() async{
    print("testing");
    final  result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg'],
    );
    if(result== null) return null;
    return File(result.paths.first);
  }



}