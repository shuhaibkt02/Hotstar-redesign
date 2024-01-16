import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorMsg;
  const ErrorPage({super.key, required this.errorMsg});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade300,
      alignment: Alignment.center,
      child: Text(errorMsg),
    );
  }
}
