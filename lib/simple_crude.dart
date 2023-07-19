import 'package:firebase_prectice/three_firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThreeTextFild extends StatefulWidget {
  const ThreeTextFild({super.key});

  @override
  State<ThreeTextFild> createState() => ThreeTextFildState();
}

class ThreeTextFildState extends State<ThreeTextFild> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _middlename = TextEditingController();
  final TextEditingController _lastname = TextEditingController();

  @override
  void initState() {
    ThreeFirebaseApi.selectdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _firstname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextField(
              controller: _middlename,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextField(
              controller: _lastname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await ThreeFirebaseApi.setData(
                    firstName: _firstname.text,
                    middleName: _middlename.text,
                    lastName: _lastname.text);
                setState(() {});
              },
              child: Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
