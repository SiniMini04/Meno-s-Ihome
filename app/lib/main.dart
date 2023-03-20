import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Lüftungssteuerung",
      home: Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: partymodeon(), child: Text("Party")),
        ),
      ),
    );
  }
}

class getsecurityhint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    var rng = Random();

    var a1 = rng.nextInt(4294967296);
    var a2 = rng.nextInt(4294967296);
    var b1 = rng.nextInt(4294967296);
    var b2 = rng.nextInt(4294967296);

    Future<http.Response> createAlbum(String title) {
      return http.post(
        Uri.parse('https://192.168.1.55/AJAX'),
        headers: <String, String>{
          'Security-Hint': 'p',
        },
        body: jsonEncode(<String>{
          'UAMCHAL:3,4' +
              a1.toString() +
              ',' +
              a2.toString() +
              ',' +
              b1.toString() +
              ',' +
              b2.toString()
        }),
      );
    }

    throw UnimplementedError();
  }
}

class partymodeon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    Future<http.Response> createAlbum(String title) {
      return http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/albums'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': title,
        }),
      );
    }

    throw UnimplementedError();
  }
}
