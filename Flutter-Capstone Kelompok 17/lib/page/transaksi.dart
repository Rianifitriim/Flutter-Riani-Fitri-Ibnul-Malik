import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/DetailBerita.dart';
import 'package:kel17/viewmodel/artikel_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class Transaksi extends StatefulWidget {
  Transaksi({Key? key}) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
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
                    Image.asset('assets/menu.png')
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //list berita
              Consumer<ArticleViewModel>(builder: (context, model, child) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
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
                            height: 100,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          contact.urlToImage ?? ""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        contact.title,
                                        style: const TextStyle(
                                            fontSize: 14,
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
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }),
              SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
