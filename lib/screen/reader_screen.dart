import 'package:flutter/material.dart';
import 'package:formation_app/screen/document_mobile.dart';
import 'package:formation_app/style/app_colors.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReaderScreen extends StatefulWidget {
  final Document doc;

  const ReaderScreen(this.doc, {Key? key}) : super(key: key);

  @override
  _ReaderScreenState createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueDarkColor,
        title: Text(
          widget.doc.doc_title!,
          style: TextStyle(color: AppColors.backColor),
        ),
      ),
      body: SfPdfViewer.network(
        widget.doc.doc_url!,
        key: UniqueKey(),
      ),
    );
  }
}
