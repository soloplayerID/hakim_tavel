part of '../screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements SearchState {
  late SearchModal _searchModel;
  late SearchPrensenter _searchPrensenter;
  List destinationResponse = [];

  _SearchScreenState() {
    _searchPrensenter = SearchPrensenter();
  }

  @override
  void initState() {
    _searchPrensenter.view = this;
    super.initState();
    searchFromFirebase();
  }

  void searchFromFirebase() async {
    final result =
        (await FirebaseFirestore.instance.collection('province').get()).docs;

    setState(() {
      destinationResponse = result.map((e) => e.data()).toList();
      print('=== $destinationResponse');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: kLightWhite,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          Text(
            "Mau Liburan kemana?",
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4c4c4c),
            ),
          ),
          const Gap(20),
          FittedBox(
            child: Container(
              padding: const EdgeInsets.all(3.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffF4F6F0)),
              child: Row(
                children: [
                  Container(
                    width: size.width * .44,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(50)),
                        color: Colors.white),
                    child: const Center(child: Text('Hakim Travel')),
                  ),
                  Container(
                    width: size.width * .44,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(50)),
                        color: Colors.grey.shade200),
                    child: const Center(child: Text('Travel')),
                  ),
                ],
              ),
            ),
          ),
          const Gap(25),
          InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModalSearch(
                        destinationResponse: destinationResponse,
                        isCalender: false,
                      ),
                    )).then((value) {
                  print(
                      '=== hasil adalah ${destinationResponse[value]['name']}');
                  setState(() {
                    _searchModel.originSelectName =
                        destinationResponse[value]['name'];
                  });
                });
              },
              child: AppIconText(
                icon: Icons.flight_takeoff_rounded,
                text: "Dari",
                destination: _searchModel.originSelectName,
              )),
          const Gap(15),
          InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModalSearch(
                        destinationResponse: destinationResponse,
                        isCalender: false,
                      ),
                    )).then((value) {
                  print(
                      '=== hasil adalah ${destinationResponse[value]['name']}');
                  setState(() {
                    _searchModel.destinationSelectName =
                        destinationResponse[value]['name'];
                  });
                });
              },
              child: AppIconText(
                icon: Icons.flight_land_rounded,
                text: "Ke",
                destination: _searchModel.destinationSelectName,
              )),
          const Gap(15),
          InkWell(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModalSearch(
                      destinationResponse: destinationResponse,
                      isCalender: true,
                    ),
                  )).then((value) {
                print('=== hasil adalah $value');
                setState(() {
                  _searchModel.dateSelected = value;
                });
              });
            },
            child: AppIconText(
              icon: Icons.date_range_rounded,
              text: "Tanggal Berangkat",
              destination: _searchModel.dateSelected,
            ),
          ),
          const Gap(15),
          InkWell(
            onTap: () {
              if (_searchModel.destinationSelectName == '') {
                Fluttertoast.showToast(
                    msg: 'Pilih dulu tujuan',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 15);
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DestinationScreen(
                              location: _searchModel.destinationSelectName,
                            )));
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0XFFFFC90E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Text(
                'Cari',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )),
            ),
          ),
          const Gap(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promo',
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
          const Gap(15),
          Container(
            width: size.width * .44,
            height: 150,
            decoration: BoxDecoration(
                color: const Color(0xff3A8888),
                borderRadius: BorderRadius.circular(18)),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discount 90% kalo anda membawa kendaraan sendiri 🚗 🎉",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onError(String error) {}

  @override
  void onSuccess(String success) {}

  @override
  void refreshData(SearchModal searchModal) {
    setState(() {
      _searchModel = searchModal;
    });
  }
}
