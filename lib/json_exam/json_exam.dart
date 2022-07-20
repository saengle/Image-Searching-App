import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_exam/json_exam/components/data.dart';

class ImageSearching extends StatefulWidget {
  const ImageSearching({Key? key}) : super(key: key);

  @override
  State<ImageSearching> createState() => ImageSearchingMain();
}

class ImageSearchingMain extends State<ImageSearching> {
  // const ImageSearchingMain({Key? key}) : super(key: key);

  DataCollection dataCollection = DataCollection();
  List<Map<String, dynamic>> data = [];
  Map<String, dynamic>? person;


  @override
  void initState() {
    super.initState();
    initData();
  }

  Future initData() async {
    person = await getData();
    data = await getImages();
    setState(() {});
  }

  Future<Map<String, dynamic>> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    String jsonString = '{ "name": "홍길동", "email": "aaa@aaa.com"}';
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }

  Future<List<Map<String, dynamic>>> getImages() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Map<String, dynamic>> hits = dataCollection.jsonData['hits'];
    return hits;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
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
            children: [
              mySizeBox(),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: 'apple',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
              ),
              mySizeBox(),
              Expanded(
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,),
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> image = data[index];
                    return Image.network(image['previewURL'],
                            fit: BoxFit.cover);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget mySizeBox() {
    return const SizedBox(
      height: 10,
    );
  }


}
