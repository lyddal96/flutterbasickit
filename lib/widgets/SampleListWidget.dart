import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kit/models/UserModel.dart';

class SampleListWidget extends StatelessWidget {
  // const SampleListTile({super.key, required this._index});
  const SampleListWidget({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text('${user.name}은 ${user.gender} 입니다.'),
        // onTap: () => null,
      ),
    );
  }
}
