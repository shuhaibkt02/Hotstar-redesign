import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/presentation/screen/downloads_screen.dart';
import 'package:hotstar/presentation/screen/studio_screen.dart';
import 'package:hotstar/presentation/widgets/series/custom_icon_button.dart';

class CategoryScreen extends StatelessWidget {
  static const String category = 'categoryPage';

  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 180),
                CustomElevationButton(
                  icon: Icons.folder_copy_outlined,
                  onpress: () {
                    context.pop();
                  },
                  label: 'Everything',
                ),
                CustomElevationButton(
                  icon: Icons.movie_outlined,
                  onpress: () {
                    GoRouter.of(context).pushNamed(StudioScreen.studioPage,
                        extra: {'studioName': 'Movies'});
                  },
                  label: 'Movies',
                ),
                CustomElevationButton(
                  icon: Icons.tv,
                  onpress: () {
                    GoRouter.of(context).pushNamed(StudioScreen.studioPage,
                        extra: {'studioName': 'Series'});
                  },
                  label: 'Shows',
                ),
                CustomElevationButton(
                  icon: Icons.done,
                  onpress: () {
                    GoRouter.of(context).pushNamed(StudioScreen.studioPage,
                        extra: {'studioName': 'Watch list'});
                  },
                  label: 'Watchlist',
                ),
                CustomElevationButton(
                  icon: Icons.arrow_downward,
                  onpress: () {
                    GoRouter.of(context).pushNamed(DownloadScreen.download);
                  },
                  label: 'Downloads',
                ),
                const SizedBox(height: 10),
                ...List.generate(
                  5,
                  (index) => InkWell(
                    onTap: () {
                      GoRouter.of(context).pushNamed(StudioScreen.studioPage,
                          extra: {'studioName': 'Studio ${index + 1}'});
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      alignment: Alignment.center,
                      child: Text(
                        'Studio ${index + 1}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomIconButton(
        onpress: () => context.pop(),
        icon: Icons.close,
        radius: 22,
        iconSize: 18,
        opacity: 0.9,
        alignment: Alignment.bottomCenter,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

class CustomElevationButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onpress;
  const CustomElevationButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        onPressed: onpress,
        label: Text(label),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey.shade400,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
