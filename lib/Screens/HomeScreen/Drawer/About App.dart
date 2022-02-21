import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TabAboutApp extends StatelessWidget {
  int tabSelected;
  TabController controller;
  TabAboutApp(this.tabSelected);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: tabSelected,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            backgroundColor:  Colors.green,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'ABOUT CICR'),
                Tab(text: '      ABOUT \nDEVELOPERS',),
                Tab(text: 'ABOUT APP',)
              ],
            ),
          ),

          body: TabBarView(
            children: [
              AboutCICR(),
              AboutDev(),
              AboutApp(),
            ],
          ),
        ),
      ),
    );
  }
}
class AboutApp extends StatefulWidget {
  const AboutApp({Key key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 15.0,bottom: 15.0),
                child: ListTile(
                  dense: false,
                  title: Text("* This App is a user friendly software tool developed to support the cotton stake holders involved with cotton production. \n\n* It covers A to Z about cotton cultivation including crop improvement, crop production and crop protection. \n\n* The user can refer at any time in offline mode as well. \n\n* The size of the app is 24 MB that makes the users to download it no time. \n\n* The targeted end users are not only the Farmers but also Students, Researchers, State Department personnel, Extension functionaries, KVK personnel, Policy makers etc. ",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "PoppinsMedium")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class AboutCICR extends StatefulWidget {
  const AboutCICR({Key key}) : super(key: key);

  @override
  _AboutCICRState createState() => _AboutCICRState();
}

class _AboutCICRState extends State<AboutCICR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            new Card(
              elevation: 5.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: ListTile(
                  dense: false,
                  title: Text("The Institute",textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "PoppinsBold")),
                ),
              ),
            ),
            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: ListTile(
                  dense: false,
                  title: Text("\t\tThe Central Institute for Cotton Research (CICR) was established in 1976 at Nagpur by the Indian Council of Agricultural Research (ICAR), New Delhi. ICAR-CICR was developed with the main goal of providing scientific leadership in cotton research. It has two regional stations located at Sirsa, Haryana and Coimbatore, Tamil Nadu. These centres cater to the needs of north and south India, respectively.",textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "PoppinsMedium")),
                ),
              ),
            ),
            new Card(
              elevation: 5.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: ListTile(
                  dense: false,
                  title: Text("Mission",textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "PoppinsBold")),
                ),
              ),
            ),
            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: ListTile(
                  dense: false,
                    title: Text("\t\tTo accelerate growth in national cotton productivity and minimize yield gaps by developing farm technologies for the different agro-ecoregions and to provide products and services to various stakeholders (farmers, textile and processing industries and other R and D organizations).",textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "PoppinsMedium")),
                ),
              ),
            ),
            new Card(
              elevation: 5.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: ListTile(
                  dense: false,
                  title: Text("Mandate",textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "PoppinsBold")),
                ),
              ),
            ),
            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: ListTile(
                  dense: false,
                  title: Text("\t\tBasic, Strategic and adaptive research on production, protection, fibre quality and by-products of cotton.\n\nCreation of new genetic variability for location-specific adoption in cotton-based cropping systems\n\nCoordination and monitoring of applied research on national and regional issues to develop improved varieties and technologies.\n\nDissemination of technologies and capacity building.",textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "PoppinsMedium")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class AboutDev extends StatefulWidget {
  const AboutDev({Key key}) : super(key: key);

  @override
  _AboutDevState createState() => _AboutDevState();
}

class _AboutDevState extends State<AboutDev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            new Card(
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: ListTile(
                  dense: false,
                  title: Text("Integrated Cotton App",textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "PoppinsBold")),
                ),
              ),
            ),
            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: false,
                      title: Text("Principal Investigator",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsBold")),
                    ),
                    Divider(
                      //thickness: 2.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      dense: false,
                      title: Text("Dr. S. M. Wasnik, Principal Scientist(Agri. Extension)",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsMedium")),
                    ),
                  ],
                ),
              ),
            ),

            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: false,
                      title: Text("Team Of Scientists Involved",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsBold")),
                    ),
                    Divider(
                      //thickness: 2.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      dense: false,
                      title: Text("Dr. D. Blaise, I/C Head, Crop Production. \nDr. V. N. Waghmare, Head, Crop Improvement. \nDr. Nandini Ghokhte, I/C Head, Crop Protection. \nDr. S. M. Wasnik, Dr. M. Sabesh, Dr. C. Karpagam. ",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsMedium")),
                    ),
                  ],
                ),
              ),
            ),

            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: false,
                      title: Text("Information and Inputs",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsBold")),
                    ),
                    Divider(
                      //thickness: 2.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      dense: false,
                      title: Text("Crop Improvements: Dr. S. Manickam and Dr. H. B. Santosh \n\nCrop Protection: Dr. V. Nagrare and Dr. S. Gawande \n\nCrop Production: Dr. GI Ramakrushna and Dr. A. R. Reddy",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsMedium")),
                    ),
                  ],
                ),
              ),
            ),
            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: false,
                      title: Text("Cotton Update Committee",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsBold")),
                    ),
                    Divider(
                      //thickness: 2.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      dense: false,
                      title: Text("Dr. Jayant Meshram. \nDr. GI Ramakrushna. \nDr. H. B. Santosh. \nDr. Vivek Shah. \nDr. B. Bhargavi. \nDr. Nilkanth Hiremani. \nDr. Chinna Babu Naik  ",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsMedium")),
                    ),
                  ],
                ),
              ),
            ),
            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: false,
                      title: Text("Language Translation",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsBold")),
                    ),
                    Divider(
                      //thickness: 2.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      dense: false,
                      title: Text("Marathi: Dr. S. Mahajan, \nDr. B. Fand and \nDr. H. B. Kumbhalkar. \n\nGujrati: Dr. Vivek Shah and Dr. Desai. \n\nKannada: Dr. Raghvendra and Dr. H. B. Santosh. \n\nHindi: Dr. Rachna Pande and Dr. Pooja Verma.",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsMedium")),
                    ),
                  ],
                ),
              ),
            ),
            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: false,
                      title: Text("Software Providers",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsBold")),
                    ),
                    Divider(
                      //thickness: 2.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      dense: false,
                      title: Text("Zappkode Solutions, Nagpur.",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsMedium")),
                    ),
                  ],
                ),
              ),
            ),
            new Card(
              color: Colors.green.shade100,
              elevation: 3.0,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: false,
                      title: Text("Published By",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsBold")),
                    ),
                    Divider(
                      //thickness: 2.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      dense: false,
                      title: Text("Dr. V. N. Waghmare, Director(Upto 11th Oct 2020). \n\nDr. Y. G. Prasad, Director(w.e.f. 12th Oct 2020).",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "PoppinsMedium")),
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
