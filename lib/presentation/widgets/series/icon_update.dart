import 'package:flutter/material.dart';

enum DownloadStatus { notYet, downloading, downloadCompleted, downloadError }

IconData iconUpdate(DownloadStatus status) {
  switch (status) {
    case DownloadStatus.notYet:
      return Icons.arrow_downward_rounded;
    case DownloadStatus.downloading:
      return Icons.replay_rounded;
    case DownloadStatus.downloadCompleted:
      return Icons.phone_android;
    case DownloadStatus.downloadError:
      return Icons.details_rounded;
  }
}

Widget iconWidgetUpdate(DownloadStatus status) {
  switch (status) {
    case DownloadStatus.notYet:
      return Icon(
        Icons.arrow_downward_rounded,
        color: Colors.grey.shade300,
      );
    case DownloadStatus.downloading:
      return Icon(
        Icons.replay_rounded,
        color: Colors.grey.shade300,
      );
    case DownloadStatus.downloadCompleted:
      return Icon(
        Icons.phone_android,
        color: Colors.grey.shade300,
      );
    case DownloadStatus.downloadError:
      return Align(
        alignment: Alignment.center,
        child: Icon(
          Icons.details_rounded,
          color: Colors.red.shade800,
        ),
      );
  }
}
