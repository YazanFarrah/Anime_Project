import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbanime/config/palette.dart';
import 'package:fbanime/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';
import 'like_comment.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(
                  height: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Text(post.caption),
                ),
                post.imageUrl != 'null'
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != 'null'
              ? Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                        child: CachedNetworkImage(
                      imageUrl: post.imageUrl,
                    )),
                  ),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          radius: 20,
          imageUrl: post.user.imageUrl,
          isActive: false,
          hasBorder: false,
          addStory: false,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Row(
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                post.timeAgo,
                style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => print('more'),
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            LikeComment(
              icon: Icons.favorite_outline,
              onPressed: () => print('likes'),
              number: post.likes.toString(),
            ),

            const SizedBox(
              width: 4.0,
            ),

            LikeComment(
              icon: Icons.comment,
              onPressed: () => print('comments'),
              number: post.comments.toString(),
            ),

            const SizedBox(
              width: 4.0,
            ),

            LikeComment(
              icon: Icons.share,
              onPressed: () => print('shares'),
              number: post.shares.toString(),
            ),

            const Spacer(),

            //number of saved is not added in the data fields yet
            LikeComment(
              icon: Icons.save_alt_rounded,
              onPressed: () => print('saves'),
              number: '',
            ),
          ],
        ),
      ],
    );
  }
}
