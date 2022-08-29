import 'package:api_call_json_parsing/json_parse/service.dart';
import 'package:api_call_json_parsing/json_parse/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class JsonParseDemo extends StatefulWidget {
  const JsonParseDemo({Key? key}) : super(key: key);

  @override
  State<JsonParseDemo> createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {

  List<User>? _users;
  bool? _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Service.getUsers().then((value) {
      setState(() {
        _users = value;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading! ? 'Loading...' : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users?.length,
          itemBuilder: (context, index) {
            User user = _users![index];
            return ListTile(
              title: Text(user.name!),
              subtitle: Text(user.email!),
            );
          },
        ),
      ),
    );
  }
}
