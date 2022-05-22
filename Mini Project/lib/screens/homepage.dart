import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soal1/screens/DetailBerita.dart';
import 'package:soal1/viewmodel/viewmodel.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isAll = true;

  final List<String> _tabs = <String>[
    "Featured",
    "Popular",
    "Latest",
    "Latest",
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  Widget content(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(
          height: 24.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending',
                style: GoogleFonts.poppins(
                  color: Color.fromRGBO(143, 148, 251, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(143, 148, 251, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Hot News',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 300,
          child: (Consumer<ContactViewModel>(builder: (context, model, child) {
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                final contact = model.articles[index];
                return SizedBox(
                  height: 300,
                  width: double.infinity,
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Trending',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              DetailBerita(
                                            title: model.articles[index].title,
                                            urlToImage: model.articles[index]
                                                    .urlToImage ??
                                                "",
                                            content:
                                                model.articles[index].content ??
                                                    "loading...",
                                            author:
                                                model.articles[index].author ??
                                                    "",
                                          ),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            const begin = Offset(0.0, 1.0);
                                            const end = Offset.zero;
                                            const curve = Curves.ease;

                                            var tween = Tween(
                                                    begin: begin, end: end)
                                                .chain(
                                                    CurveTween(curve: curve));

                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ));
                                      },
                                      child: Text(
                                        'Read Now',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                'News',
                style: GoogleFonts.poppins(
                  color: Color.fromRGBO(143, 148, 251, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'View All',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //list berita
        Consumer<ContactViewModel>(builder: (context, model, child) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: model.articles.length,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                titleSpacing: 0,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(16.0),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    isScrollable: true,
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Color.fromRGBO(143, 148, 251, 1),
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: Color.fromRGBO(143, 148, 251, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tabs: _tabs
                        .map(
                          (String name) => Tab(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(name),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                pinned: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: TabBarView(
              controller: _tabController,
              children: List.generate(_tabs.length,
                  (index) => index == 0 ? content(context) : content(context))),
        ),
      ),
    );
  }
}
