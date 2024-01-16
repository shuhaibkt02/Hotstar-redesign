// // download_state.dart
// import 'package:equatable/equatable.dart';
// import 'dart:io';

// abstract class DownloadState extends Equatable {
//   const DownloadState();

//   @override
//   List<Object?> get props => [];
// }

// class DownloadInitial extends DownloadState {}

// class DownloadInProgress extends DownloadState {
//   final double progress;

//   const DownloadInProgress({required this.progress});

//   @override
//   List<Object?> get props => [progress];
// }

// class DownloadSuccess extends DownloadState {
//   final File file;

//   const DownloadSuccess({required this.file});

//   @override
//   List<Object?> get props => [file];
// }

// class DownloadFailure extends DownloadState {
//   final String error;

//   const DownloadFailure({required this.error});

//   @override
//   List<Object?> get props => [error];
// }
