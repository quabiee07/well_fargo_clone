import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'account_page.dart';

Widget checkBox(text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Checkbox(
          value: false,
          onChanged: (value) {
            value = true;
          }),
      Text(
        text,
        style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
      )
    ],
  );
}

Widget button(text, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const AccountScreen()));
    },
    child: Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xFFD91C28),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(text,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white))),
    ),
  );
}

Widget cards(icon, title, subtitle, context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      padding: const EdgeInsets.all(15),
      height: 200,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          roundIcon(
            Icon(
              icon,
              color: Colors.black54,
            ),
          ),
          Text(title,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600, fontSize: 15)),
          Text(subtitle,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400, fontSize: 14))
        ],
      ),
    ),
  );
}

Widget acctCard(title, subtitle, footer, context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.9),
          spreadRadius: 0.5,
          blurRadius: 3,
          offset: const Offset(0, 0.5))
    ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black87)),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$$subtitle',
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w300,
                fontSize: 24,
                color: Colors.black87),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(footer,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.black87)),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final List<String> text;

  CustomBottomNavigationBar(
      {Key? key,
      this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.text,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<dynamic> _iconList = [];
  List<String> _text = [];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length && i < _text.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], _text[i], i));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(icon, String text, int index) {
    return GestureDetector(
        onTap: () {
          widget.onChange(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width / _iconList.length,
          decoration: const  BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.black26 ),
              ),
            ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon,
                    color:
                        index == _selectedIndex ? Colors.red : Colors.grey),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color:
                          index == _selectedIndex ? Colors.red : Colors.grey),
                )
              ]),
        ));
  }
}

Widget roundIcon(icon) {
  return ClipOval(
    child: Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Color(0xFFFFDC78),
      ),
      child: icon,
    ),
  );
}
