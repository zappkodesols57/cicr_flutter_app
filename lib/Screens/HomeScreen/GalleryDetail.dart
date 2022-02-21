import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryDetail extends StatefulWidget {
  String name;

  GalleryDetail(this.name);

  @override
  _GalleryDetailState createState() => _GalleryDetailState();
}

class _GalleryDetailState extends State<GalleryDetail> {
  List<ImageDetails1> images;

  String album;


  @override
  void initState() {
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 25,
                fontFamily: "PoppinsMedium",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            if(widget.name == "43rd Foundation")
            Expanded(
              child: Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black
                  ),
                    itemCount: _images1.length,
                    builder: (BuildContext context, int index){
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(_images1[index].imagePath),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: _images1[index].imagePath)
                      );
                    }
                ),
              ),
            ),
            if(widget.name == "CICR Kapas Mela")
            Expanded(
              child: Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black
                  ),
                    itemCount: _images2.length,
                    builder: (BuildContext context, int index){
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(_images2[index].imagePath),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: _images2[index].imagePath)
                      );
                    }
                ),
              ),
            ),
            if(widget.name == "Dissemination of Pink Bollworm Management Strategies ")
            Expanded(
              child: Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black
                  ),
                    itemCount: _images3.length,
                    builder: (BuildContext context, int index){
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(_images3[index].imagePath),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: _images3[index].imagePath)
                      );
                    }
                ),
              ),
            ),
            if(widget.name == "Exhibitions Interation with farmers ")
            Expanded(
              child: Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black
                  ),
                    itemCount: _images4.length,
                    builder: (BuildContext context, int index){
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(_images4[index].imagePath),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: _images4[index].imagePath)
                      );
                    }
                ),
              ),
            ),
            if(widget.name == "Hindi Workshop")
            Expanded(
              child: Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black
                  ),
                    itemCount: _images5.length,
                    builder: (BuildContext context, int index){
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(_images5[index].imagePath),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: _images5[index].imagePath)
                      );
                    }
                ),
              ),
            ),
            if(widget.name == "IRM ")
            Expanded(
              child: Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black
                  ),
                    itemCount: _images6.length,
                    builder: (BuildContext context, int index){
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(_images6[index].imagePath),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: _images6[index].imagePath)
                      );
                    }
                ),
              ),
            ),
            if(widget.name == "Mera Gaon Mera Gaurav Farmers Lab Visit ")
            Expanded(
              child: Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black
                  ),
                    itemCount: _images7.length,
                    builder: (BuildContext context, int index){
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(_images7[index].imagePath),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: _images7[index].imagePath)
                      );
                    }
                ),
              ),
            ),
            if(widget.name == "Tribal sub plan ")
            Expanded(
              child: Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black
                  ),
                    itemCount: _images8.length,
                    builder: (BuildContext context, int index){
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(_images8[index].imagePath),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: _images8[index].imagePath)
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  List<ImageDetails1> _images1 = [
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/0124768457743rd_Foundation_Day_1.JPG",
      title: '43rd Foundation',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1155327284243rd_Foundation_Day_2.JPG',
      title: '43rd Foundation',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/219775694043rd_Foundation_Day_3.JPG',
      title: '43rd Foundation',
    ),
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/326948168543rd_Foundation_Day_4.JPG",
      title: '43rd Foundation',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/473756421743rd_Foundation_Day_5.JPG',
      title: '43rd Foundation',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/549667920343rd_Foundation_Day_6.JPG',
      title: '43rd Foundation',
    ),
  ];

  List<ImageDetails1> _images2 = [
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01762642029CICR_Kapas_Mela.JPG",
      title: 'CICR Kapas Mela',
    ),
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/11854904329CICR_Kapas_Mela_2.JPG",
      title: 'CICR Kapas Mela',
    ),
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/21787350802CICR_Kapas_Mela_3.JPG",
      title: 'CICR Kapas Mela',
    ),
  ];

  List<ImageDetails1> _images3 = [
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01655139367Dissemination_of_Pink_Bollworm_Management_Strategies_ (1).JPG",
      title: 'Dissemination of Pink Bollworm Management Strategies',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1812474554Dissemination_of_Pink_Bollworm_Management_Strategies_ (2).JPG',
      title: 'Dissemination of Pink Bollworm Management Strategies',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/22140612998Dissemination_of_Pink_Bollworm_Management_Strategies_ (3).JPG',
      title: 'Dissemination of Pink Bollworm Management Strategies',
    ),
  ];

  List<ImageDetails1> _images4 = [
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01421790583Exhibitions_Interation_with_farmers.JPG",
      title: 'Exhibitions Interation with farmers',
    ),
  ];

  List<ImageDetails1> _images5 = [
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01401534429Hindi_Workshop_ (1).JPG",
      title: 'Hindi Workshop',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1422075371Hindi_Workshop_ (2).JPG',
      title: 'Hindi Workshop',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/2673015739Hindi_Workshop_ (3).JPG',
      title: 'Hindi Workshop',
    ),
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/3992979930Hindi_Workshop_ (4).JPG",
      title: 'Hindi Workshop',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/41622384273Hindi_Workshop_ (5).JPG',
      title: 'Hindi Workshop',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/5615953618Hindi_Workshop_ (6).JPG',
      title: 'Hindi Workshop',
    ),
  ];

  List<ImageDetails1> _images6 = [
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/0487490909IRM_1.JPG",
      title: 'IRM',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1557612185IRM_2.JPG',
      title: 'IRM',
    ),
  ];

  List<ImageDetails1> _images7 = [
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/02054556370Mera_Gaon_Mera Gaurav_Farmers_Lab_Visit_2.JPG",
      title: 'Mera Gaon Mera Gaurav Farmers Lab Visit',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/11976909656Mera_Gaon_Mera_Gaurav_1.JPG',
      title: 'Mera Gaon Mera Gaurav Farmers Lab Visit',
    ),
  ];

  List<ImageDetails1> _images8 = [
    ImageDetails1(
      imagePath: "https://www.zappkode.com/cicr/english/gallery/admin/gupload/01482579893Tribal_sub_plan_1.jpg",
      title: 'Tribal sub plan',
    ),
    ImageDetails1(
      imagePath: 'https://www.zappkode.com/cicr/english/gallery/admin/gupload/1616934257Tribal_sub_plan_2.jpg',
      title: 'Tribal sub plan',
    ),
  ];
}

class ImageDetails1 {
  final String imagePath;
  final String title;

  ImageDetails1({
    @required this.imagePath,
    @required this.title,
  });
}
