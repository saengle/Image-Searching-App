import 'dart:convert';
import 'package:flutter/material.dart';

class JsonExam extends StatelessWidget {
  const JsonExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Image Searching App',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children:  [
            const Center(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'apple',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(5),
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black,
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black12,
                    child: const Text('Heed not the rabble'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black26,
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black38,
                    child: const Text('Who scream'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black45,
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black87,
                    child: const Text('Revolution, they...'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getData() async {
    await Future.delayed(const Duration(seconds: 2));

    String jsonString = '{ "name": "홍길동", "email": "aaa@aaa.com"}';
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }
}
