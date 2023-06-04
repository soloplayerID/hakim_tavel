import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/apps_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = FirebaseFirestore.instance;
  String username = "user";
  var date = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kLightBlue,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://cdn3d.iconscout.com/3d/premium/thumb/man-avatar-6299539-5187871.png'))),
                  ),
                  const Spacer(),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selamat Datang',
                            style: knunitoBold.copyWith(fontSize: 12)),
                        // Text(
                        //     '${DateFormat('EEEE').format(date)} ${DateFormat('d MMM, yyyy').format(date)}',
                        //     style: knunitoRegularBold.copyWith(
                        //         color: kGrey, fontSize: 12)),
                      ]),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kWhite,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Center(
                        child: Icon(
                          Icons.menu,
                          size: 18,
                          color: kGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      Text(
                        'hello, xxx',
                        style: GoogleFonts.nunito(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4c4c4c),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // Text(
                      //   'Selamat Datang',
                      //   style: GoogleFonts.nunito(
                      //     fontSize: 20,
                      //     color: const Color(0xFF4c4c4c),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Container(
                        height: 100,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: Column(
                                children: [
                                  Container(
                                    // margin: const EdgeInsets.only(right: 30),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        image: AssetImage("assets/icons/mountain.png"),
                                          fit: BoxFit.cover
                                      )
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: const Text('Gunung', style: TextStyle(color: Colors.purple)),
                                  )
                                  
                                ],
                              ),
                            );
                        },),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 199,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 199,
                                  width: 310,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.blueAccent),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 140,
                                      width: 210,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/paket.png"),
                                              fit: BoxFit.cover)),
                                      child: Container(
                                        height: 140,
                                        width: 210,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.black
                                                      .withOpacity(0.61),
                                                  Colors.black.withOpacity(0)
                                                ])),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      // search bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color(0XFFF5F6F8),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              //animation or p
                              // how do you feel + get started button
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Kamu lagi mau\nliburan kemana ?',
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF5F6F8),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            print('test');
                                          },
                                          child: const IgnorePointer(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.search),
                                                border: InputBorder.none,
                                                hintText: '',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: const Color(0XFFFFC90E),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Cari di hakim travel',
                                          style: GoogleFonts.nunito(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      //doctor list
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pencarian terakhir',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {},
                            //   child: Text(
                            //     'Lihat semua',
                            //     style: GoogleFonts.nunito(
                            //       fontSize: 15,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}