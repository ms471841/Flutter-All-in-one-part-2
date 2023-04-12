import 'package:mongo_dart/mongo_dart.dart';

ConnectDatabase() async {
  final db = Db(
      'mongodb+srv://sampl1:ms12345@cluster0.523odoz.mongodb.net/?retryWrites=true&w=majority');
  await db.open();

  if (db.state == State.open) {
    print('Connected to MongoDB successfully');
  } else {
    print('Failed to connect to MongoDB');
  }

  // perform CRUD operations here

  await db.close();
}
