// import 'dart:developer';
import 'package:firebase_prectice/crude_update/simple_crude_upadate_api.dart';
import 'package:flutter/material.dart';

class SimpleCrudDemo extends StatefulWidget {
  const SimpleCrudDemo({super.key});

  @override
  State<SimpleCrudDemo> createState() => _SimpleCrudDemoState();
}

class _SimpleCrudDemoState extends State<SimpleCrudDemo> {
  final TextEditingController _controller = TextEditingController();
  late Future<List<Map>> futureUserData;
  @override
  void initState() {
    futureUserData = FirebaseApi.selectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
              onPressed: FirebaseApi.isupdate
                  ? () async {
                      await FirebaseApi.updateData(
                          key: FirebaseApi.selectedKey,
                          username: _controller.text);
                      futureUserData = FirebaseApi.selectData();
                      FirebaseApi.isupdate = false;
                      _controller.clear();
                      setState(() {});
                    }
                  : () async {
                      await FirebaseApi.setUserdata(username: _controller.text);
                      futureUserData = FirebaseApi.selectData();
                      setState(() {});
                    },
              child: FirebaseApi.isupdate
                  ? const Text('update')
                  : const Text('submit'),
            ),
            FutureBuilder(
              future: futureUserData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          FirebaseApi.isupdate = true;
                          FirebaseApi.selectedKey =
                              snapshot.data![index]['key'];
                          _controller.text = snapshot.data![index]['username'];
                          setState(() {});
                          // log(snapshot.data![index]['key']);
                        },
                        title: Text(snapshot.data![index]['username']),
                      ),
                    ),
                  );
                } else {
                  return const Text('there  is no data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
