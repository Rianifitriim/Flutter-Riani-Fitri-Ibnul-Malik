import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/DetailBerita.dart';
import 'package:kel17/page/qna.dart';
import 'package:kel17/viewmodel/artikel_viewmodel.dart';
import 'package:kel17/viewmodel/pulsa_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

TabController? _tabController;
bool isAll = true;

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  List<String> imgList = [
    'assets/a.png',
    'assets/b.png',
    'assets/c.png',
    'assets/d.png',
    // 'assets/e.png',
    // 'assets/f.png',
    // 'assets/g.png',
    // 'assets/h.png',
  ];
  List<String> TextList = [
    'The North Face',
    'Unilever',
    'Uniqlo',
    'Motul',
    // 'Philips',
    // 'Erigo',
    // 'Adidas',
    // 'Nivea',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Box(),
              BoxProfile(),
              listpaket(),
              gridview1(imgList: imgList),
              gridview2(TextList: TextList),
              Carousel()
            ],
          ),
        ),
      ),
    );
  }
}

class gridview2 extends StatelessWidget {
  const gridview2({
    Key? key,
    required this.TextList,
  }) : super(key: key);
  final List<String> TextList;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListView.builder(
              itemCount: TextList.length,
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TextList[index],
                        ),
                      ],
                    )));
              })
        ]);
  }
}

class gridview1 extends StatelessWidget {
  const gridview1({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  final List<String> imgList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          children: List.generate(imgList.length, (index) {
            return Container(
              margin: const EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 216, 227, 252),
                borderRadius: BorderRadius.circular(15),
              ),

              // padding: const EdgeInsets.all(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imgList[index],
                    width: 75,
                  ),
                ],
              ),
            );
          })),
    );
  }
}

class listpaket extends StatelessWidget {
  const listpaket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 210,
          child: (Consumer<ArticleViewModel>(builder: (context, model, child) {
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                final contact = model.articles[index];
                return SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(contact.urlToImage ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 500,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 231, 238, 253),
                                  // borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Uniqlo',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Deskripsi ceritanya panjang ',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 3,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: model.articles.length,
              viewportFraction: 0.8,
              scale: 0.9,
            );
          })),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: GoogleFonts.poppins(
                  color: Color.fromRGBO(143, 148, 251, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See Details',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //list berita
        Consumer<ArticleViewModel>(builder: (context, model, child) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                final contact = model.articles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          DetailBerita(
                        title: model.articles[index].title,
                        urlToImage: model.articles[index].urlToImage ?? "",
                        content: model.articles[index].content ?? "",
                        author: model.articles[index].author ?? "",
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ));
                  },
                  //     )),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 8),
                    padding: const EdgeInsets.all(12.0),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(contact.urlToImage ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                contact.title,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          contact.publishedAt,
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 231, 238, 253),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                width: 50,
                fit: BoxFit.cover,
                image: AssetImage('assets/point.png'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        QnA(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
                },
                child: Image(
                  width: 50,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/FAQ.png'),
                ),
              ),
            ],
          ),
        ));
  }
}

class BoxProfile extends StatelessWidget {
  const BoxProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF6372F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text(
                      'A',
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    radius: 25,
                    backgroundColor: Color.fromARGB(255, 236, 187, 245),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      top: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back Robert!',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Your earnings point',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image(
                    width: 25,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/coins.png'),
                  ),
                  Text(
                    '350.000',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class Toko extends StatefulWidget {
  const Toko({
    Key? key,
  }) : super(key: key);

  @override
  State<Toko> createState() => _TokoState();
}

class _TokoState extends State<Toko> {
  var iconTypes = <IconData>[
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.call_end_sharp,
    Icons.equalizer_rounded,
    Icons.wifi_lock,
    Icons.mail,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: 10,
        child: Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(iconTypes.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 72, 189, 243),
                    child: Icon(
                      iconTypes[index],
                      color: Colors.white,
                    ),
                  ),
                );
              })),
        ),
      ),
    ));
  }
}

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PulsaViewModel>(context, listen: false).pulsa();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 210,
          child: (Consumer<PulsaViewModel>(builder: (context, model, child) {
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                final pulsa = model.data[index];
                return SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(pulsa.image ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 500,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 231, 238, 253),
                                  // borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pulsa.productName ?? " ",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        pulsa.descriptions ?? "",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 3,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: model.data.length,
              viewportFraction: 0.8,
              scale: 0.9,
            );
          })),
        ),
      ],
    );
  }
}
