import 'package:flutter/material.dart';
import 'package:formation_app/screen/api.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:formation_app/screen/document_mobile.dart';
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
  // List<Formation> formations = [];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchFormations();
  // }

  // Future<void> fetchFormations() async {
  //   var res = await CallApi().getData('formation');

  //   var body = json.decode(res.body);
  //   print(res.body);
  //   formations =
  //       body.map((formationJson) => Formation.fromJson(formationJson)).toList();
  //   print(formations);
  //   setState(() {});
  // }

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
      appBar: AppBar(
        backgroundColor: AppColors.blueDarkColor,
        title: const Text('Mes Formations',
            style: TextStyle(color: AppColors.backColor)),
      ),
      // body: ListView.builder(
      //   itemCount: formations.length,
      //   itemBuilder: (context, index) {
      //     final formation = formations[index];
      //     return Card(
      //       child: ListTile(
      //         leading: Image.network(
      //           formation.imageUrl,
      //           width: 80,
      //           height: 80,
      //           fit: BoxFit.cover,
      //         ),
      //         title: Text(formation.title),
      //         subtitle: Text(formation.time),
      //         onTap: () {
      //           openPdf(context, formation.pdfPath);
      //         },
      //       ),
      //     );
      //   },
      // ),

      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.6),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Liste Formation",
                    style: GoogleFonts.roboto(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: Document.doc_list
                        .map((doc) => ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReaderScreen(doc)));
                              },
                              title: Text(
                                doc.doc_title!,
                                style: GoogleFonts.nunito(),
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle:  Text(doc.doc_description!),
                              trailing: 
                              
                              Text(
                               
                                "${doc.page_num} heures",
                                style: GoogleFonts.nunito(
                                    color: AppColors.blueDarkColor),
                              ),
                              leading: const Icon(
                                Icons.picture_as_pdf,
                                color: Colors.red,
                              ),
                            ))
                        .toList(),
                  )
                ]),
          )),
    );
  }
}

// class Formation {
//   final String title;
//   final String imageUrl;
//   final String description;
//   final String time;
//   final String pdfPath;

//   Formation({
//     required this.title,
//     required this.imageUrl,
//     required this.description,
//     required this.time,
//     required this.pdfPath,
//   });

//   factory Formation.fromJson(Map<String, dynamic> json) {
//     return Formation(
//       title: json['title'],
//       imageUrl: json['imageUrl'],
//       description: json['description'],
//       time: json['time'],
//       pdfPath: json['pdfPath'],
//     );
//   }
// }
