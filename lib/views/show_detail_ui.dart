import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetailUI extends StatefulWidget {
  String? name_fs, web_fs, facebook_fs, phone_fs, image_fs, lat_fs, lng_fs;

  ShowDetailUI({
    Key? key,
    this.name_fs,
    this.web_fs,
    this.facebook_fs,
    this.phone_fs,
    this.image_fs,
    this.lat_fs,
    this.lng_fs,
  }) : super(key: key);

  @override
  State<ShowDetailUI> createState() => _ShowDetailUIState();
}

class _ShowDetailUIState extends State<ShowDetailUI> {
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        title: Text(
          'รายละเอียดร้าน',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/images/' + widget.image_fs.toString(),
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: Card(
                elevation: 20,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.home,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              widget.name_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(
                          widget.web_fs.toString(),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.networkWired,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              widget.web_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(
                          'https://fb.com/' + widget.facebook_fs.toString(),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.facebook,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              widget.facebook_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _makePhoneCall(
                          widget.phone_fs.toString(),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.phone,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              widget.phone_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(
                          'https://www.google.co.th/maps/@${widget.lat_fs.toString()},${widget.lng_fs.toString()},17z',
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapMarker,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Go To Map',
                            ),
                          ],
                        ),
                      ),
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
