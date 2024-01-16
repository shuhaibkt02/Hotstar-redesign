import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FileDownload extends StatefulWidget {

  const FileDownload({super.key});

  @override
  State<FileDownload> createState() => _FileDownloadState();
}

class _FileDownloadState extends State<FileDownload> {
  late Dio dio;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    dio = Dio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 32),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: _progress,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('${_progress * 100}%'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                openFile(
                  context: context, // Pass the context to openFile method
                  url:
                      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                );
              },
              child: const Text('Download & Open'),
            ),
          ],
        ),
      ),
    );
  }

  Future openFile(
      {required BuildContext context,
      required String url,
      String? fName}) async {
    final fileName = fName ?? url.split('/').last;
    final file = await downloadFile(context, url, fileName);
    // final localFile = await pickFile();
    if (file == null) return;
    print('Path : ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;
    return File(result.files.first.path ?? '');
  }

  Future<File?> downloadFile(
      BuildContext context, String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(
        url,
        onReceiveProgress: (count, total) {
          setState(() {
            _progress = count / total;
          });
        },
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(seconds: 1),
        ),
      );

      final raf = file.openSync(mode: FileMode.write)
        ..writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }
}