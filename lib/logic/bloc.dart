// // download_bloc.dart
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:hotstar/logic/events_bloc.dart';
// import 'package:hotstar/logic/states_bloc.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';


// class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
//   final Dio dio = Dio();

//   DownloadBloc() : super(DownloadInitial());

//   Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
//     if (event is DownloadButtonPressed) {
//       yield* _mapDownloadButtonPressedToState(event);
//     } else if (event is DownloadProgressUpdated) {
//       yield DownloadInProgress(progress: event.progress);
//     }
//   }

//   Stream<DownloadState> _mapDownloadButtonPressedToState(
//       DownloadButtonPressed event) async* {
//     yield const DownloadInProgress(progress: 0.0);

//     try {
//       final appStorage = await getApplicationDocumentsDirectory();
//       final fileName = event.url.split('/').last;
//       final file = File('${appStorage.path}/$fileName');

//       final response = await dio.get(
//         event.url,
//         onReceiveProgress: (count, total) {
//           final progress = count / total;
//           add(DownloadProgressUpdated(progress: progress));
//         },
//         options: Options(
//           responseType: ResponseType.bytes,
//           followRedirects: false,
//           receiveTimeout: const Duration(seconds: 1),
//         ),
//       );

//       final raf = file.openSync(mode: FileMode.write)
//         ..writeFromSync(response.data);
//       await raf.close();

//       yield DownloadSuccess(file: file);
//     } catch (e) {
//       yield DownloadFailure(error: 'Download failed: $e');
//     }
//   }

//   // Optional: Add a method to reset the state
//   void resetState() {
//     add(const DownloadButtonPressed(url: ""));
//   }
// }
