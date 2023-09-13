part of '../screen.dart';

class CheckoutScreen extends StatefulWidget {
  final String placeName;
  final String destination;
  final int harga;
  const CheckoutScreen(
      {super.key,
      required this.placeName,
      required this.destination,
      required this.harga});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selected = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'Pembayaran',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                color: const Color(0xffecedf2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                widget.placeName,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                child: Text(
                                  widget.destination,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                CurrencyFormat.convertToIdr(widget.harga),
                                style: GoogleFonts.poppins(
                                    color: Colors.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 10),
                        child: Text(
                          'Pilih Metode Pembayarannya',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Bank Transfer',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'mandiri';
                          });
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 7.5, top: 7.5),
                          decoration: BoxDecoration(
                              color: selected == 'mandiri'
                                  ? Colors.grey[400]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                    width: 60,
                                    margin: const EdgeInsets.all(5),
                                    child: ClipRRect(
                                      // borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          'assets/icons/mandiri.png'),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'E-Wallet',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'gopay';
                          });
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 7.5, top: 7.5),
                          decoration: BoxDecoration(
                              color: selected == 'gopay'
                                  ? Colors.grey[400]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                    width: 60,
                                    margin: const EdgeInsets.all(5),
                                    child: ClipRRect(
                                      // borderRadius: BorderRadius.circular(10),
                                      child:
                                          Image.asset('assets/icons/gopay.png'),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
                height: 45,
                child: MaterialButton(
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue,
                  disabledColor: Colors.red,
                  onPressed: () async {
                    print('1');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Text(
                    'Checkout',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
