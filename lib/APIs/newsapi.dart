import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse('https://evening-crag-66482.herokuapp.com/getPost'),
  );
  List result = jsonDecode(response.body);
  print('Fetched');

  return (result);
}
