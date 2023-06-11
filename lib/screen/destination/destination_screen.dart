part of '../screen.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // go home
        Navigator.of(context).pop(true);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //app bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Menampilkan hasil pencarian',
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF4c4c4c),
                                  ),
                                ),
                                Text(
                                  '...',
                                  style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    color: const Color(0xFF4c4c4c),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0XFFFFC90E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Text(
                          'Ubah',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                color: const Color(0xffecedf2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: StreamBuilder(
                            stream: db.collection('destinations').snapshots(),
                            builder: (context, snapshots) {
                            if(snapshots.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if(snapshots.hasError) {
                              return const Center(
                                child: Text('Error')
                              );
                            }
                            //Olah data
                            var dataDestinations = snapshots.data!.docs;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: dataDestinations.length,
                              itemBuilder: (context, index) {
                              return Container(
                                    height: 120,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: const Color(0XFFf5f6f8),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      children: [
                                        //animation or picture
                                        // Container(
                                        //   height: 100,
                                        //   width: 100,
                                        //   child: CachedNetworkImage(
                                        //     imageUrl: widget.availModel
                                        //         .avails[itemIndex].images,
                                        //     placeholder: (context, url) =>
                                        //         const CircularProgressIndicator(),
                                        //     errorWidget:
                                        //         (context, url, error) =>
                                        //             const Icon(Icons.error),
                                        //   ),
                                        // ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        // how do you feel + get started button
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dataDestinations[index].data()['name'],
                                                style: GoogleFonts.nunito(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFF4c4c4c),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                dataDestinations[index]
                                                    .data()['location'],
                                                style: GoogleFonts.nunito(
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xFF4c4c4c),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                'Rp. Mahal',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFFE91E5A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                            },);
                          }
                          ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}