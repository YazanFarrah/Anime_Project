// import 'package:fbanime/widgets/profile_avatar.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';

// import '../models/user_model.dart';

// class CreatePostContainer extends StatelessWidget {
//   final User currentUser;
//   const CreatePostContainer({super.key, required this.currentUser});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
//       color: Colors.white,
//       child: Column(children: [
//         Row(
//           children: [
//             ProfileAvatar(imageUrl: currentUser.imageUrl),
//             const SizedBox(
//               width: 8.0,
//             ),
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration.collapsed(
//                     hintText: 'What\'s on your mind?'),
//               ),
//             )
//           ],
//         ),
//         const Divider(
//           height: 10.0,
//           thickness: 0.5,
//         ),
//         Container(
//           height: 40.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TextButton.icon(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//                 onPressed: () => print('Live'),
//                 icon: const Icon(
//                   Icons.videocam,
//                   color: Colors.red,
//                 ),
//                 label: const Text(
//                   'Live',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               const VerticalDivider(
//                 width: 8.0,
//               ),
//               TextButton.icon(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//                 onPressed: () => print('Photo'),
//                 icon: const Icon(
//                   Icons.photo_library,
//                   color: Colors.green,
//                 ),
//                 label: const Text(
//                   'Photo',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               const VerticalDivider(
//                 width: 8.0,
//               ),
//               TextButton.icon(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//                 onPressed: () => print('Room'),
//                 icon: const Icon(
//                   Icons.video_call,
//                   color: Colors.purple,
//                 ),
//                 label: const Text(
//                   'Room',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ]),
//     );
//   }
// }
