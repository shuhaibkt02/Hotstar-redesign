import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/presentation/widgets/navigation_head.dart';
import 'package:hotstar/presentation/widgets/series/custom_icon_button.dart';

class StudioScreen extends StatelessWidget {
  static const String studioPage = 'sudioPage';
  final String studioName;
  const StudioScreen({super.key, required this.studioName});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.width / 3),
                  NavigationHeader(
                    label: studioName,
                    onpress: () {
                      context.pop();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: size.height - 10,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 12,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.accents[index + 1].shade200,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 0,
              child: CustomIconButton(
                onpress: () {
                  context.pop();
                },
                icon: Icons.close,
                radius: 18,
                iconSize: 18,
                opacity: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
