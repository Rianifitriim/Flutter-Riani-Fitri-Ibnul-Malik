import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/DetailBerita.dart';
import 'package:kel17/viewmodel/artikel_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

TabController? _tabController;
bool isAll = true;

class Tukar extends StatefulWidget {
  Tukar({Key? key}) : super(key: key);

  @override
  State<Tukar> createState() => _TukarState();
}

class _TukarState extends State<Tukar> {
  @override
  var iconTypes = <IconData>[
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              listpaket(),
              Container(
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: List.generate(iconTypes.length, (index) {
                      return Container(
                          margin: const EdgeInsets.all(20),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 216, 227, 252),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Center(
                                  child: Icon(
                                    iconTypes[index],
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ));
                    })),
              ),
            ],
          ),
        ),
      ),
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
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Text(
              'History',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //list berita
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status Redeem',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'April 2022',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<ArticleViewModel>(builder: (context, model, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      final contact = model.articles[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    DetailBerita(
                              title: model.articles[index].title,
                              urlToImage:
                                  model.articles[index].urlToImage ?? "",
                              content: model.articles[index].content ?? "",
                              author: model.articles[index].author ?? "",
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(contact.urlToImage ?? ""),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      contact.title,
                                      style: const TextStyle(
                                          fontSize: 15,
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
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
