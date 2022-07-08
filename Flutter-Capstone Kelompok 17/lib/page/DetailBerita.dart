// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBerita extends StatefulWidget {
  final String content;
  final String urlToImage;
  final String title;
  final String author;

  const DetailBerita({
    Key? key,
    required this.content,
    required this.title,
    required this.urlToImage,
    required this.author,
  }) : super(key: key);

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
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
              Stack(
                children: [
                  Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // ignore: prefer_const_constructors
                    image: NetworkImage(widget.urlToImage),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(143, 148, 251, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "Author : ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.author,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Text(
                        widget.content,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
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
