import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> gamefetchnews() async {
  final response = await http.get(
    Uri.parse('https://evening-crag-66482.herokuapp.com/getPostG'),
  );
  List result = jsonDecode(response.body);
  print('Fetched');

  return (result);
}
