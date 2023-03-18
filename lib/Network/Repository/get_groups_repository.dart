import 'dart:convert';
import 'dart:io';

import 'package:agrishot_admin/Network/Repository/models/get_group_model.dart';
import 'package:http/http.dart' as http;

class GetGroupsRepository {
  List<Datum> results = [];

  Future<List<Datum>> getGroups() async {
    final uri = Uri.parse("https://api.dev.agrishots.in/v1/admin/groups");
    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkOTYxZDdjMjg0MjlkNjY2NjllY2FiY2Q2MzBmMzVlYjIwMjZlMzkwOWI3ZDk1ZmE3MDQ5N2E0ODE5NjdhOTdhNDciLCJwaG9uZU51bWJlciI6Ijk4NzY1NDMyMTAiLCJsYXN0TG9naW5BdCI6bnVsbCwiaWF0IjoxNjc4NDg2NDYzLCJleHAiOjE2ODEwNzg0NjN9.emCmwOcwnyVuGhUZQZYVwPdiyr72V-BCBSWF3OSSkBg',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body.toString());
      for (var i = 0; i < json['data'].length; i++) {
        results.add(Datum.fromJson(json['data'][i]));
      }

      return results;
    } else {
      throw "Something went worng";
    }
  }
}
