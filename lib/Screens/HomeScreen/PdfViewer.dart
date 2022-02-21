import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
class PdfViewer extends StatefulWidget {
  String title,description,pdf,name;

  PdfViewer(this.title,this.description,this.pdf,this.name);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text((widget.title)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            dense: false,
            title: Html(data: widget.description),
            isThreeLine: false,
            trailing:Wrap(
              children: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: (){
                    Share.share('${widget.name} \n\n${widget.pdf}');},
                ),
                IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () async {
                    launch(widget.pdf);
                  },
                ),
              ],
            ) ,
          ),
          if(widget.pdf.endsWith(".pdf"))
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0,right: 15.0,top: 10,bottom: 10),
              child:  Container(
                  height: MediaQuery.of(context).size.height,
                  child: PDF(
                      enableSwipe: true,
                      swipeHorizontal: true).cachedFromUrl(widget.pdf)
              )
            ),
          ),
          if(!widget.pdf.endsWith(".pdf"))
            Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Text("No Pdf Available"),
            )
        ],
      ),
    );
  }
}
