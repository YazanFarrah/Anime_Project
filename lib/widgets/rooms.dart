import 'package:fbanime/config/palette.dart';
import 'package:fbanime/data/data.dart';
import 'package:fbanime/models/models.dart';
import 'package:fbanime/widgets/widgets.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../models/story_model.dart';
import '../models/user_model.dart';
import '../screens/stories.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({
    super.key,
    required this.onlineUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Stories();
  }
  // final User user = onlineUsers[index - 1];
  // return Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
  // child: Stories(),
  // child: ProfileAvatar(
  //     radius: 28,
  //     imageUrl: user.imageUrl,
  //     isActive: true,
  //     addStory: false,
  //     hasBorder: true),
//           );
//         },
//       ),
//     );
//   }
// }

// class _CreateRoomButton extends StatelessWidget {
//   const _CreateRoomButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: () => print('Create Room'),
//       style: OutlinedButton.styleFrom(
//         foregroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//       child: Row(children: [
//         ShaderMask(
//           shaderCallback: (rect) =>
//               Palette.createRoomGradient.createShader(rect),
//           child: const Icon(
//             Icons.video_call,
//             size: 35.0,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(
//           width: 4.0,
//         ),
//         const Text(
//           'Create\n Room',
//           style: TextStyle(color: Colors.black),
//         ),
//       ]),
//     );
//   }
// }
}
