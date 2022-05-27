import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var data = '\$123.45 cash rewards';
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  height: MediaQuery.of(context).size.height * .30,
                  decoration: const BoxDecoration(color: Color(0xFFC6CBDF)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.add_alert_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.exit_to_app_rounded),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Good afternoon,\nJodi neeld',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300, fontSize: 25)),
                          const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage('assets/jodi.jpeg')),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text('Wells Fargo Rewards®',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w500, fontSize: 15)),
                      Row(
                        children: [
                          Text(data,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500, fontSize: 15)),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            size: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(color: Color(0xFFF7F3EF)),
                ),
              ],
            ),
            Positioned(
              top: 200,
              right: 15,
              left: 15,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    acctCard('EVERYDAY CHECKING ....0987', '246,849.58',
                        'Available balance', context),
                    const SizedBox(
                      height: 15,
                    ),
                    acctCard('WELLS FARGO ACTIVE CASH CARD ....7654',
                        '1,206.78', 'Outstanding balance', context),
                    const SizedBox(
                      height: 15,
                    ),
                    acctCard('AUTO LOAN ....1830', '3,479.20',
                        'Outstanding principle balance', context),
                    const SizedBox(
                      height: 15,
                    ),
                    acctCard('HOME LOAN ....1830', '110,532.97',
                        'Outstanding principle balance', context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: const [
          Icons.home,
          Icons.add_to_home_screen_outlined,
          Icons.monetization_on_outlined,
          Icons.explore_outlined,
          Icons.menu,
        ],
        text: const ['Accounts', 'Deposit', 'Pay&Transfer', 'Explore', 'Menu'],
        onChange: (value) {},
      ),
    );
  }

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), startTime);
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, startAlert);
  }

  Future<dynamic> startAlert() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Text('ACCOUNT SUSPENDED!',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                )),
            contentPadding: const EdgeInsets.all(10),
            content: Container(
              height: 150,
              width: 300,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                      'Your account has been temporarily suspended and placed under review. Please visit any Wells Fargo branch to reslove this issue.',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
          );
        });
  }
}
