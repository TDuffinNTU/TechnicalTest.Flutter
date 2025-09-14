import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';

part 'database.g.dart';

const String _dbPath = 'posts.db';

@Riverpod(keepAlive: true)
Future<Database> getDatabase(Ref ref) async {
  // get the application documents directory
  Directory dir = await getApplicationDocumentsDirectory();
  // make sure it exists
  await dir.create(recursive: true);
  // build the database path
  String dbPath = join(dir.path, _dbPath);
  // open the database
  return await databaseFactoryIo.openDatabase(dbPath);
}
