import 'package:flutter/material.dart';

class SemiInfoWidget extends StatelessWidget {
  final String year;
  final String smallInfo;
  final String statusCode;
  final bool substitle;
  final String resolution;
  const SemiInfoWidget({
    super.key,
    required this.year,
    required this.smallInfo,
    required this.statusCode,
    required this.substitle,
    required this.resolution,
  });

  @override
  Widget build(BuildContext context) {
    final semiInfoData =
        '$year  ·  $smallInfo  ·  $statusCode  ·  ${substitle ? 'CC' : ''} ·  $resolution';
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        semiInfoData,
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: 0.4,
          color: Colors.grey.shade600,
          fontSize: 12.7,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
