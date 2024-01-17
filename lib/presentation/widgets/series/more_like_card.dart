import 'package:flutter/material.dart';

class MoreLikeCard extends StatefulWidget {
  const MoreLikeCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<MoreLikeCard> createState() => _MoreLikeCardState();
}

class _MoreLikeCardState extends State<MoreLikeCard> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 1),
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
                child: Text(
                  'More like this',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 14,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.accents[index + 1].shade200,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          // left: size.width / 2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isShow = !isShow;
              });
            },
            child: isShow == true
                ? const SizedBox()
                : GradientTextContainer(widget: widget),
          ),
        )
      ],
    );
  }
}

class GradientTextContainer extends StatelessWidget {
  const GradientTextContainer({
    super.key,
    required this.widget,
  });

  final MoreLikeCard widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      alignment: Alignment.bottomCenter,
      width: widget.size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Color.fromARGB(205, 0, 0, 1),
            Color.fromRGBO(0, 0, 0, 1),
          ],
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Show even more',
            style: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w400,
              fontFamily: 'SF-Pro',
              fontSize: 13.5,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white54,
          ),
          SizedBox(height: 25)
        ],
      ),
    );
  }
}
