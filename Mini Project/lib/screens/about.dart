import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetailScreen extends StatefulWidget {
  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berkabar'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // ignore: prefer_const_constructors
                margin: EdgeInsets.all(20),
                // ignore: prefer_const_constructors
                child: Center(
                  child: Image(
                    width: 200,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/about.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Text(
                      "Berkabar",
                      style: GoogleFonts.poppins(
                          color: Color.fromRGBO(143, 148, 251, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        "Aplikasi baca berita menjadi sebuah trend tersendiri di masyarakat, saat ini banyak pembaca koran dan majalah yang beralih membaca media online. Akses berita dan informasi kini bisa dengan mudah didapat, hanya melalui smartphone kita bisa bisa membaca berita dari seluruh dunia kapanpun dan dimanapun secara gratis.Dengan perkembangan teknologi yang pesat kini koran dan majalah telah berevolusi menjadi media online atau aplikasi baca berita, dimana pembaca dapat mengakses berita lebih mudah. Berbeda dengan koran dan majalah, media online atau apliaksi baca berita dapat menyuguhkan informasi dengan lebih cepat dan aktual.Untuk mendapatkan pengalaman membaca berita yang lebih praktis, banyak tersedia aplikasi baca berita yang dapat diunduh di Play Store secara gratis. Dengan mengunduhnya, kita tak akan lagi ketinggalan update terbaru mengenai berita yang sedang terjadi dalam negeri maupun mancanegara.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
