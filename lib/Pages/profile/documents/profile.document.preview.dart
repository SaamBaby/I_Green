import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class DocumentPreview extends StatefulWidget {
  final String filePath;

  DocumentPreview({Key key, this.filePath}) : super(key: key);

  @override
  _DocumentPreviewState createState() => _DocumentPreviewState();
}

class _DocumentPreviewState extends State<DocumentPreview> {
  @override
  Widget build(BuildContext context) {
    return (widget.filePath == null || widget.filePath.isEmpty)
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text("Document Preview"),
            ),
            body: Container(
                child: PDFView(
              filePath: widget.filePath,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
              onRender: (_pages) {
                setState(() {
                  // pages = _pages;
                  // isReady = true;
                });
              },
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                // _controller.complete(pdfViewController);
              },
              onPageChanged: (int page, int total) {
                print('page change: $page/$total');
              },
            )));
  }
}
