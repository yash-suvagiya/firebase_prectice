import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/firebase_database.dart';

class ThreeFirebaseApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref("User");
  static Future<void> setData(
      {required String firstName,
      required String middleName,
      required String lastName}) async {
    String key = db.push().key!;
    await db.child(key).set(
      {
        'key': key,
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
      },
    );
  }

  static Future<void> selectdata() async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    print(data);
  }
}
