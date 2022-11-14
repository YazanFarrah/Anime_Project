import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fbanime/models/models.dart';
import 'package:flutter/widgets.dart';

import '../widgets/avatar.dart';
import '../widgets/helpers.dart';

// class MessagesPage extends StatelessWidget {
//   const MessagesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Stories(),
//         ),
//         SliverList(
//           delegate: SliverChildBuilderDelegate(_delegate),
//         )
//       ],
//     );
//   }

//   Widget _delegate(BuildContext context, int index) {
//     {
//       final Faker faker = Faker();
//       return Text('data');
//     }
//   }
// }

// class _MessageTitle extends StatelessWidget {
//   const _MessageTitle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         // children: [Avatar.medium(url: url,);],
//         );
//   }
// }

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Text(
                'Online Users',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  final faker = Faker();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 60,
                      child: _StoryCard(
                        storyData: StoryData(
                          name: faker.person.name(),
                          url: Helpers.randomPictureUrl(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final StoryData storyData;

  const _StoryCard({
    super.key,
    required this.storyData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 12,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
