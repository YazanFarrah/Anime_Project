import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AgeCountry extends StatefulWidget {
  const AgeCountry({super.key});

  @override
  State<AgeCountry> createState() => _AgeCountryState();
}

class _AgeCountryState extends State<AgeCountry> {
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff2E99C7),
              elevation: 0,
              title: Text(
                'Choose date and country',
                style: GoogleFonts.lobster(fontSize: 30, color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                TabBar(
                  indicatorColor: Color(0xff2E99C7),
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.date_range_outlined,
                        color: Color(0xff2E99C7),
                      ),
                    ),
                    Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.globe,
                        color: Color(0xff2E99C7),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      //birth date tab
                      SizedBox(
                        height: 10,
                        child: CupertinoDatePicker(
                          use24hFormat: false,
                          initialDateTime: _dateTime,
                          onDateTimeChanged: (dateTime) {
                            print(_dateTime);
                            setState(() {
                              _dateTime = dateTime;
                            });
                          },
                        ),
                      ),
                      //country tab
                      Container(
                        child: Center(child: Text('2nd tab')),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
