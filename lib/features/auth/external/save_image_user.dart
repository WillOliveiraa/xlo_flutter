import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/parse_errors.dart';

class SaveImageUser {
  static Future<ParseFile> saveImage(dynamic image) async {
    try {
      if (image is File) {
        final parseFile = ParseFile(image, name: path.basename(image.path));
        final response = await parseFile.save();

        if (!response.success) {
          return Future.error(ParseErrors.getDescription(response.error!.code));
        }

        return parseFile;
      } else {
        final parseFile = ParseFile(File(''));
        parseFile.name = path.basename(image as String);
        parseFile.url = image;

        return parseFile;
      }
    } catch (e) {
      return Future.error('Falha ao salvar a imagem do usuário');
    }
  }
}
