import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static String selectedKey = '';
  static bool isupdate = false;
  static final DatabaseReference db = FirebaseDatabase.instance.ref('user');

  static Future<void> setUserdata({required String username}) async {
    String key = db.push().key!;
    await db.child(key).set({"key": key, "username": username});
  }

  static Future<List<Map>> selectData() async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    return userData;
  }

  static Future<void> updateData(
      {required String key, required String username}) async {
    await db.child(key).update(
      {
        'key': key,
        'username': username,
      },
    );
  }

  static Future<void> deleteData({required String key}) async {
    await db.child(key).remove();
  }
}
