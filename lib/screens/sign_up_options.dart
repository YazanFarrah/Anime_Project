import 'package:fbanime/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

class SignOptions extends StatelessWidget {
  const SignOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Widget bottomWidget() {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
        child: Container(
          height: deviceSize.height * 0.05,
          width: deviceSize.width * 0.75,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Already have an account?'),
                Text('Log in!')
              ]),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
                    child: Text(
                      'Name',
                      style: GoogleFonts.lobster(
                        fontSize: 60,
                        color: const Color(0xff2E99C7),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
                Flexible(
                  flex: deviceSize.width > 600 ? 2 : 1,
                  child: testCard(),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                bottomWidget(),
              ],
            )),
      ),
    );
  }
}

class testCard extends StatelessWidget {
  const testCard({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Widget bottomWidget() {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
        child: Container(
          height: deviceSize.height * 0.75,
          width: deviceSize.width * 0.75,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Already have an account?'),
                Text('Log in!')
              ]),
        ),
      );
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: deviceSize.height * 0.75,
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 200,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    label: const Text('Sign up with email'),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Text('OR'),
                    Flexible(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('aaaaaaa'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text('ssssssssss'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
