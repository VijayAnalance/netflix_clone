import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('${Get.parameters['name']}'),
    );
  }
}
