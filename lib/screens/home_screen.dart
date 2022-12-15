import 'package:fbanime/data/data.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/post_model.dart';

import '../widgets/widgets.dart';
import '../screens/screens.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                title: Text(
                  'Name',
                  style: GoogleFonts.lobster(
                      fontSize: 35, color: const Color(0xff2E99C7)),
                ),
                centerTitle: false,
                floating: true,
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: InkWell(
                        child: SvgPicture.asset('assets/images/chat.svg'),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ),
                        ),
                      )),
                ],
              ),
              // SliverToBoxAdapter(
              //   child: CreatePostContainer(currentUser: currentUser),
              // ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(
                    onlineUsers: onlineUsers,
                  ),
                ),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              //   sliver: SliverToBoxAdapter(
              //     child: Stories(currentUser,
              //         curentUser: currentUser, stories: stories),
              //   ),
              // ),

              //here SliverList(delegate: SliverChildBuilderDelegate) is
              // equavilant to listview.builder

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
          ChatScreen(),
        ],
      ),
    );
  }
}
