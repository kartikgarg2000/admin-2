import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class GroupCreateRepository {
  Future<String?> postGroup(
      String name, String about, bool isPaid, int trial) async {
    final url = Uri.https("https://api.dev.agrishots.in", "/v1/admin/groups");
    final data = {
      "name": "Group One",
      "status": name,
      "about": about,
      "avatarUrl": "jkbk",
      "bannerUrl": "jvhvjvk",
      "allowMembershipRequest": true,
      "isPaid": isPaid,
      "groupTypeId": 1,
      "groupSubtypeId": 1,
      "moderatorId": 1,
      "userRoleType": [1, 2],
      "groupRules": [1, 2, 3],
      "trialPeriod": trial
    };

    String body = json.encode(data);

    http.Response response = await http.post(url, body: body, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkOTYxZDdjMjg0MjlkNjY2NjllY2FiY2Q2MzBmMzVlYjIwMjZlMzkwOWI3ZDk1ZmE3MDQ5N2E0ODE5NjdhOTdhNDciLCJwaG9uZU51bWJlciI6Ijk4NzY1NDMyMTAiLCJsYXN0TG9naW5BdCI6bnVsbCwiaWF0IjoxNjc4NDg2NDYzLCJleHAiOjE2ODEwNzg0NjN9.emCmwOcwnyVuGhUZQZYVwPdiyr72V-BCBSWF3OSSkBg',
    });

    if (response.statusCode == 200) {
      var data1 = response.body.toString();

      return data1;
    } else {
      return null;
    }
  }
}
