import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/presentation/widgets/navigation_head.dart';
import 'package:hotstar/presentation/widgets/series/custom_icon_button.dart';
import 'package:hotstar/presentation/widgets/series/custom_snack_bar.dart';
import 'package:hotstar/presentation/widgets/series/icon_update.dart';
import 'package:hotstar/utils/constant.dart';

class DownloadScreen extends StatelessWidget {
  static const String download = 'downloadPage';

  const DownloadScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.white,
                  height: size.height / 5.5,
                ),
                NavigationHeader(
                  noPadding: true,
                  label: 'Downloads',
                  onpress: () {},
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
                  child: Text(
                    '12 Videos - 7.23GB',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),
                ...List.generate(
                  9,
                  (index) => const DownloadTile(
                    title: 'The Mandalorian',
                    year: 2020,
                    fileSize: '7.50GB',
                    posterImg: mandlorian,
                    status: DownloadStatus.downloadError,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomIconButton(
        noPadding: true,
        onpress: () => context.pop(),
        icon: Icons.close,
        radius: 18,
        iconSize: 18,
        opacity: 0.4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}

class DownloadTile extends StatelessWidget {
  final String title;
  final String posterImg;
  final int year;
  final String fileSize;
  final DownloadStatus status;
  const DownloadTile({
    super.key,
    required this.title,
    required this.posterImg,
    required this.year,
    required this.fileSize,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      // color: Colors.amber,
      height: 100,
      child: Row(
        children: [
          Container(
            width: 90,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(posterImg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$year . Total of $fileSize',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomIconButton(
              noPadding: true,
              onpress: () {
                snackBarCall(context: context, message: "back to home");
              },
              icon: iconUpdate(status),
              radius: 18,
              iconSize: 18,
              opacity: 0.4,
              // alignment: Alignment.center,
              iconColors: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
