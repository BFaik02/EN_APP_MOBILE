import 'package:flutter/material.dart';
import 'package:formation_app/screen/api.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:formation_app/screen/document_mobile.dart';
import 'package:formation_app/screen/home_page.dart';
import 'package:formation_app/screen/reader_screen.dart';
import 'dart:convert';

import 'package:formation_app/style/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FormationScreen extends StatefulWidget {
  const FormationScreen({Key? key}) : super(key: key);

  @override
  _FormationScreenState createState() => _FormationScreenState();
}

class _FormationScreenState extends State<FormationScreen> {
  void openPdf(BuildContext context, String pdfPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFView(
          filePath: pdfPath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: AppColors.blueDarkColor,
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text(
              "Formation",
              style: TextStyle(color: AppColors.backColor),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  "NOS FORMATIONS",
                  style: GoogleFonts.roboto(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //wrap the whole body in a scroller
              LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: Document.doc_list
                        .map((doc) => _buildBlock(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReaderScreen(doc),
                                  ),
                                );
                              },
                              doc,
                              constraints,
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlock(Document doc, BoxConstraints constraints,
      {required Null Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Stack(
          children: [
            Container(
              width: 850,
              height: 276,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  doc.doc_image!,
                  fit: BoxFit.cover,
                  height: 172,
                  width: 82,
                ),
              ),
            ),
            SizedBox(
              height: 490,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.homeColor.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc.doc_title!,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunito(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.backColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      doc.doc_description!,
                      style: GoogleFonts.nunito(
                        fontSize: 22.0,
                        color: AppColors.backColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: AppColors.backColor,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "${doc.page_num} heures",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                            fontSize: 26.0,
                            color: AppColors.backColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
