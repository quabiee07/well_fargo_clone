import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30, bottom: 10),
                  child: Text('WELLS FARGO',
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Text('Good afternoon,\nJodi neeld',
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w300, fontSize: 25)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 280,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            label: Text(
                              'Username',
                              style: GoogleFonts.openSans(fontWeight: FontWeight.w600,color: const Color(0xFF9182BB) ),
                            ),
                            border: const UnderlineInputBorder(),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF9182BB))
                            ),


                          ),
                        ),
                         TextField(
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                            label: Text('Password', style: GoogleFonts.openSans(fontWeight: FontWeight.w600,color: const Color(0xFF9182BB))),
                            border: const UnderlineInputBorder(),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF9182BB))
                            ),
                          ),
                          
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            checkBox('Save username'),
                            checkBox('Use Face ID')
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        button('Sign on', context),
                        const SizedBox(
                          height: 20,
                        ),
                         Center(
                          child: Text(
                            'Forgot username or password?',
                            style: GoogleFonts.openSans(fontWeight: FontWeight.w600,color: const Color(0xFF9182BB))
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      cards(
                          Icons.timer,
                          'Explore our\nproducts', 'Find your fit',
                          context),
                      cards(
                          Icons.card_giftcard_rounded,
                          'Simple savings\naccount solutions',
                          'See details',
                          context)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}