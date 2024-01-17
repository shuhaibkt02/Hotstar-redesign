import 'package:flutter/material.dart';

class MovieInfoCard extends StatelessWidget {
  final String title;
  final List<String> categories;
  final double rating;
  final String summery;
  final List<String> director;
  final String music;
  final List<String> starring;
  final List<String> production;
  const MovieInfoCard({
    super.key,
    required this.director,
    required this.music,
    required this.starring,
    required this.production,
    required this.title,
    required this.categories,
    required this.rating,
    required this.summery,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.star_border_rounded,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(
                  '$rating',
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 20,
            ),
            child: Text(summery,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  List.generate(
                    categories.length,
                    (index) =>
                        '${categories[index]}${index < categories.length - 1 ? ' - ' : ''}',
                  ).join(),
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 200,
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.accents[index + 3],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text('Teaser . 0:4${index + 3}'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 185,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TagAndNames(
                          header: 'Director',
                          names: director,
                        ),
                        Expanded(
                          child: TagAndNames(
                            header: 'Starring',
                            names: starring,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TagAndNames(
                        names: [music],
                        header: 'Music',
                      ),
                      const SizedBox(height: 5),
                      ...List.generate(
                        production.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            production[index],
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 12,
                              fontFamily: 'SP-Pro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0, top: 4),
                          child: Row(
                            children: [
                              Text(
                                'See more',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12.5,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, top: 20),
                        padding: const EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white12,
                          ),
                        ),
                        child: const Text(
                          'PG-13',
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TagAndNames extends StatelessWidget {
  final String? header;
  final List<String> names;
  const TagAndNames({
    super.key,
    this.header,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white54,
                  ),
            ),
            ...List.generate(
              names.length,
              (index) => Text(
                names[index],
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 12,
                  fontFamily: 'SP-Pro',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
