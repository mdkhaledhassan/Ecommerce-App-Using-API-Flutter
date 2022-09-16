import 'dart:convert';

import 'package:ecommerce/api_services/api_service.dart';
import 'package:ecommerce/provider/profile_provider.dart';
import 'package:ecommerce/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // @override
  // void initState() {
  //   Provider.of<ProfileProvider>(context, listen: false).getProfileData();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //var profileData = Provider.of<ProfileProvider>(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              //Navigator.of(context).pop();
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();

              await sharedPreferences.clear();

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Logout")),
      ),
    );

    // Column(
    //   //crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Container(
    //       height: 100,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //           color: Color(0xffF3F5F7), //Color(0xffF3F5F7),
    //           borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(30),
    //               bottomRight: Radius.circular(30))),
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Container(
    //                   height: 50,
    //                   width: 50,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(40)),
    //                   child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(40),
    //                     child: Image.asset(
    //                       'assets/images/default_user.png',
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                 ),
    //                 // CircleAvatar(
    //                 //   radius: 30,
    //                 //   backgroundImage:
    //                 //       AssetImage('assets/images/default_user.png'),
    //                 // ),
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       'Welcome',
    //                       style: TextStyle(
    //                           color: Color(0xff979899),
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 12),
    //                     ),
    //                     SizedBox(
    //                       height: 5,
    //                     ),
    //                     Text(
    //                       'name',
    //                       style: TextStyle(
    //                           color: Color(0xff06161C),
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 16),
    //                     )
    //                   ],
    //                 )
    //               ],
    //             ),
    //             Container(
    //               height: 50,
    //               width: 50,
    //               decoration: BoxDecoration(
    //                   border:
    //                       Border.all(color: Color(0xffffffff), width: 1),
    //                   borderRadius: BorderRadius.circular(30)),
    //               child: Center(
    //                   child: IconButton(
    //                       onPressed: () async {
    //                         SharedPreferences sharedPreferences =
    //                             await SharedPreferences.getInstance();

    //                         setState(() async {
    //                           await sharedPreferences.clear();
    //                         });

    //                         Navigator.of(context).pushReplacement(
    //                             MaterialPageRoute(
    //                                 builder: (context) => LoginPage()));
    //                       },
    //                       icon: Icon(Icons.logout_rounded))),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // ));
  }
}
