part of 'screen.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // _profileModel.isloading
          //     ? Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: double.infinity,
          //         child: Column(
          //           children: [
          //             Container(
          //                 padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Row(
          //                       children: [
          //                         InkWell(
          //                           onTap: () {
          //                             Navigator.of(context).pop(true);
          //                           },
          //                           child: Icon(LineIcons.arrowLeft),
          //                         ),
          //                         const SizedBox(
          //                           width: 10,
          //                         ),
          //                         const Text(
          //                           'Ubah Profile',
          //                           style: TextStyle(fontSize: 18),
          //                         ),
          //                       ],
          //                     ),
          //                   ],
          //                 )),
          //             Expanded(
          //                 child: Container(
          //               padding: const EdgeInsets.only(top: 40),
          //               width: MediaQuery.of(context).size.width,
          //               height: double.infinity,
          //               color: const Color(0xffecedf2),
          //               child: SingleChildScrollView(
          //                 scrollDirection: Axis.vertical,
          //                 child: Column(
          //                   children: [
          //                     Container(
          //                       child: const CircularProgressIndicator(),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             )),
          //           ],
          //         ),
          //       )
          //     :
          SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Icon(LineIcons.arrowLeft),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Info Akun',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  height: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama Lengkap',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Abdul Hakim',
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Ubah',
                                style: TextStyle(
                                    color: Colors.blue.withOpacity(1.0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'abdulhakim@gmail.com',
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Ubah',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(1.0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Nomer Telepon',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '1234567',
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Ubah',
                                style: TextStyle(
                                    color: Colors.blue.withOpacity(1.0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Ionicons.wallet_outline,
                                      color: Colors.black,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('History Pesanan',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 18)),
                                  ],
                                ),
                                const Icon(
                                  Ionicons.chevron_forward_outline,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Ionicons.information_circle,
                                      color: Colors.black,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('Pusat Bantuan',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 18)),
                                  ],
                                ),
                                const Icon(
                                  Ionicons.chevron_forward_outline,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 12.0),
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: InkWell(
                            splashColor: const Color(0xff7474BF),
                            onTap: () {},
                            child: Container(
                              height: 43,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 28),
                                        blurRadius: 40,
                                        spreadRadius: -12)
                                  ],
                                  color: Color.fromARGB(255, 206, 208, 211),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
