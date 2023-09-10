part of '../screen.dart';

class DetailScreen extends StatefulWidget {
  final String imgUrl;
  final String placeName;
  final double rating;
  const DetailScreen(
      {super.key,
      required this.imgUrl,
      required this.placeName,
      required this.rating});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/img/ilham.jpg",
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    color: Colors.black12,
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              const Icon(Icons.star_border_outlined,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.placeName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Koh Chang Tai, Thailand",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     RatingBar(widget.rating.round()),
                              //     SizedBox(
                              //       width: 8,
                              //     ),
                              //     Text(
                              //       "${widget.rating}",
                              //       style: TextStyle(
                              //           color: Colors.white70,
                              //           fontWeight: FontWeight.w600,
                              //           fontSize: 17),
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     FeaturesTile(
              //       icon: Icon(Icons.wifi, color: Color(0xff5A6C64)),
              //       label: "Free Wi-Fi",
              //     ),
              //     FeaturesTile(
              //       icon: Icon(Icons.beach_access, color: Color(0xff5A6C64)),
              //       label: "Sand Beach",
              //     ),
              //     FeaturesTile(
              //       icon: Icon(Icons.card_travel, color: Color(0xff5A6C64)),
              //       label: "First Coastline",
              //     ),
              //     FeaturesTile(
              //       icon: Icon(Icons.local_drink, color: Color(0xff5A6C64)),
              //       label: "bar and Resturant",
              //     )
              //   ],
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 24),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [DetailsCard(), DetailsCard()],
              //   ),
              // ),
              // SizedBox(
              //   height: 8,
              // ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut scelerisque arcu quis eros auctor, eu dapibus urna congue. Nunc nisi diam, semper maximus risus dignissim, semper maximus nibh. Sed finibus ipsum eu erat finibus efficitur. ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff879D95)),
                ),
              ),
              // SizedBox(
              //   height: 16,
              // ),
              // Container(
              //   height: 240,
              //   child: ListView.builder(
              //       padding: EdgeInsets.symmetric(horizontal: 24),
              //       itemCount: country.length,
              //       shrinkWrap: true,
              //       physics: ClampingScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return ImageListTile(
              //           imgUrl: country[index].imgUrl,
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
