import 'package:fbanime/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Center(
            child: Text(
              'Username',
              style: GoogleFonts.lobster(
                  fontSize: 20, color: const Color(0xff2E99C7)),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconBackground(
              icon: Icons.more,
              onTap: () {
                print('TODO Settings');
              },
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          const SizedBox(
            height: 80,
          ),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() => Container(
        padding: const EdgeInsets.only(left: 15),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Yazan',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'data',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );

  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          // margin: EdgeInsets.only(bottom: 200),
          child: buildCoverImage(),
        ),
        Positioned(
          top: 70,
          left: 15,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
            'https://images.unsplash.com/photo-1578632749014-ca77efd052eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFuaW1lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            width: double.infinity,
            height: 100,
            fit: BoxFit.cover),
      );

  Widget buildProfileImage() => const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(
            'https://t3.ftcdn.net/jpg/01/67/26/42/240_F_167264239_MJTYeDoQEItDJqlhVV13VVdQ94ViScwe.jpg'),
      );
}
