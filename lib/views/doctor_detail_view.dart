import 'package:doctorAppointment_flutter/main.dart';
import 'package:doctorAppointment_flutter/models/doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorDetail extends StatefulWidget {
  final Doctor doc;
  DoctorDetail({Key key, @required this.doc}) : super(key: key);

  @override
  _DoctorDetailState createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.yellow[50]])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buildAppBar(context),
                      CircleProfilePhoto(
                        url: widget.doc.photo,
                        height: 100,
                        width: 100,
                        borderWidth: 50,
                      ),
                      Spacer(),
                      Text(
                        widget.doc.name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(widget.doc.field),
                      Spacer(),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: DoctorSpecRow(
                            doc: widget.doc,
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "About Doctor",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.doc.about),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Working Time",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "${widget.doc.workingday.from} - ${widget.doc.workingday.to} (${widget.doc.workingtime.from} - ${widget.doc.workingtime.to})"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: Colors.black54),
              borderRadius: BorderRadius.circular(12)),
          child: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class CircleProfilePhoto extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final double borderWidth;
  const CircleProfilePhoto({
    Key key,
    this.url,
    this.height,
    this.width,
    this.borderWidth = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black26, offset: Offset(1, 1))
        ],
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.brown[200], Colors.white70]),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(url),
            ),
          ),
        ),
      ),
    );
  }
}
