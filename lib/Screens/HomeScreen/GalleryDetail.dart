import 'dart:convert';
import 'package:cicr_flutter_app/Model/Model_gallaryInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryDetail extends StatefulWidget {
  String name;

  GalleryDetail(this.name);

  @override
  _GalleryDetailState createState() => _GalleryDetailState();
}

class _GalleryDetailState extends State<GalleryDetail> {
  final ScrollController _controller = ScrollController();

  List _images;

  String album;

  @override
  void initState() {
    getAlbum();
    // super.initState();
  }

  void getAlbum() {
    if (widget.name == "43rd Foundation") {
      setState(() {
        _images = _images1;
      });
    } else if (widget.name == "CICR Kapas Mela") {
      setState(() {
        _images = _images2;
      });
    } else if (widget.name ==
        "Dissemination of Pink Bollworm Management Strategies ") {
      setState(() {
        _images = _images3;
      });
    } else if (widget.name == "Exhibitions Interation with farmers ") {
      setState(() {
        _images = _images4;
      });
    } else if (widget.name == "Hindi Workshop") {
      setState(() {
        _images = _images5;
      });
    } else if (widget.name == "IRM ") {
      setState(() {
        _images = _images6;
      });
    } else if (widget.name == "Mera Gaon Mera Gaurav Farmers Lab Visit ") {
      setState(() {
        _images = _images7;
      });
    } else if (widget.name == "Tribal sub plan ") {
      setState(() {
        _images = _images8;
      });
    }
  }

  // Future<GalleryInfoModel> getAlbum() async {
  //   final res = await http.get(
  //       Uri.parse("https://www.zappkode.com/cicr/english/webservices/gallery/gallery"));
  //   print(res.body);
  //   print(res.statusCode);
  //   var responseJson = json.decode(res.body);
  //   if (200 == res.statusCode) {
  //     print(responseJson[0]);
  //     return galleryInfoFromJson(res.body);
  //   } else {
  //     throw Exception('Failed to load Bills');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        elevation: 0,
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
      body: GridView.builder(
        itemCount: _images.length,
        shrinkWrap: true,
        reverse: false,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    _images[index],
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress){
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                          value: loadingProgress.expectedTotalBytes != null? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                          : null,
                        ),
                      );
                    },
                  )),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhotoView(_images,index)));
              // return PhotoView(imageProvider: _images[index]);
              // launch(_images[index],forceWebView: true);
            },
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
      ),
    );
  }

  List<String> _images1 = [
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/0124768457743rd_Foundation_Day_1.JPG',
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1155327284243rd_Foundation_Day_2.JPG',
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/219775694043rd_Foundation_Day_3.JPG',
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/326948168543rd_Foundation_Day_4.JPG',
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/473756421743rd_Foundation_Day_5.JPG',
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/549667920343rd_Foundation_Day_6.JPG',
  ];

  List<String> _images2 = [
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01762642029CICR_Kapas_Mela.JPG",
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/11854904329CICR_Kapas_Mela_2.JPG",
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/21787350802CICR_Kapas_Mela_3.JPG",
  ];

  List<String> _images3 = [
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01655139367Dissemination_of_Pink_Bollworm_Management_Strategies_ (1).JPG",
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1812474554Dissemination_of_Pink_Bollworm_Management_Strategies_ (2).JPG',
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/22140612998Dissemination_of_Pink_Bollworm_Management_Strategies_ (3).JPG',
  ];

  List<String> _images4 = [
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01421790583Exhibitions_Interation_with_farmers.JPG",
  ];

  List<String> _images5 = [
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01401534429Hindi_Workshop_ (1).JPG",
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1422075371Hindi_Workshop_ (2).JPG',
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/2673015739Hindi_Workshop_ (3).JPG',
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/3992979930Hindi_Workshop_ (4).JPG",
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/41622384273Hindi_Workshop_ (5).JPG',
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/5615953618Hindi_Workshop_ (6).JPG',
  ];

  List<String> _images6 = [
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/0487490909IRM_1.JPG",
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1557612185IRM_2.JPG',
  ];

  List<String> _images7 = [
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/02054556370Mera_Gaon_Mera Gaurav_Farmers_Lab_Visit_2.JPG",
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/11976909656Mera_Gaon_Mera_Gaurav_1.JPG',
  ];

  List<String> _images8 = [
    "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01482579893Tribal_sub_plan_1.jpg",
    'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1616934257Tribal_sub_plan_2.jpg',
  ];
}

class PhotoView extends StatefulWidget {
      List img;
      int index;

  PhotoView(this.img, this.index);

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: widget.index);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      body: SafeArea(
        child: Expanded(
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.all(5),
            child: PhotoViewGallery.builder(
                // scrollPhysics: new NeverScrollableScrollPhysics(),
                backgroundDecoration: BoxDecoration(color: Colors.black),
                itemCount: widget.img.length,
                pageController: _pageController,
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(widget.img[index]),
                      initialScale: PhotoViewComputedScale.contained,
                      heroAttributes: PhotoViewHeroAttributes(tag: widget.img)
                  );
                }
                ),
          ),
        ),
      ),
    );
  }
}
