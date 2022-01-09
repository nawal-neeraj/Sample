import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../models/home_page_model.dart';

// import 'package:carousel_slider/carousel_slider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomepageModel> myAllData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<HomepageModel> fetchData() async {
    bool trustSelfSigned = true;
    HttpClient client = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(client);
    var url = Uri.parse(
        'https://61c30cc09cfb8f0017a3e91f.mockapi.io/virtoustack/paths');
    var response = await ioClient.get(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      for (var data in body) {
        myAllData.add(HomepageModel(
          title: data['title'],
          subPaths: data['sub_paths'],
          id: data['id'],
          // abcd: data['abcd'],
          // phone: data['phone'],
          // countryCode: data['countryCode'],
          // type: data['type'],
          // email: data['email'],
          // password: data['password'],
          // name: data['name']
        ));
      }

      // myAllData.forEach((element) {
      //   print(element.title);
      // });
      setState(() {});
      return HomepageModel.fromJson(body);
    } else {
      throw Exception('Failed');
    }
  }

  late Future<HomepageModel> futureData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
            child: ListView.builder(
          itemBuilder: (_, index) {
            return Container(
                child: Card(
              child: Column(
                children: [
                  Text(
                    myAllData[index].title,
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ));
          },
          itemCount: myAllData.length,
        )
            // FutureBuilder<HomepageModel>(
            //   future: fetchData(),
            //   builder: (context, snapshot) {
            //     // print(snapshot.data.phone);
            //     if (snapshot.hasData) {
            //       return Container(
            //         child: Column(
            //           children: [Text(snapshot.data!.title)],
            //         ),
            //       );
            //     } else if (snapshot.hasError) {
            //       return new Text('====> ${snapshot.error}');
            //     }
            //     return const CircularProgressIndicator();
            //   },
            // ),
            ),
      ),
    );
  }
}
