import 'package:ecommerce/screens/category_page.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/order_page.dart';
import 'package:ecommerce/screens/profile_page.dart';
import 'package:ecommerce/widgets/theme.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    OrderPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        // padding: EdgeInsets.only(bottom: 1),
        color: Colors.transparent,
        height: 50,
        child: Container(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                splashRadius: 24,
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home_rounded,
                  color: currentIndex == 0 ? clrPrimary : clrGrey,
                ),
              ),
              IconButton(
                splashRadius: 24,
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.category_rounded,
                  color: currentIndex == 1 ? clrPrimary : clrGrey,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              IconButton(
                splashRadius: 24,
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.description_rounded,
                  color: currentIndex == 2 ? clrPrimary : clrGrey,
                ),
              ),
              IconButton(
                splashRadius: 24,
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.person,
                  color: currentIndex == 3 ? clrPrimary : clrGrey,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 46,
        width: 46,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: clrPrimary,
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
