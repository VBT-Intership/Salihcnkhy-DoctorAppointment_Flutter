import 'package:doctorAppointment_flutter/core/HttpTask.dart';
import 'package:doctorAppointment_flutter/models/doctor.dart';
import 'package:doctorAppointment_flutter/views/doctor_detail_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  // get that list from realtime db
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var doctorList = new List<Doctor>();

  Future<List<Doctor>> futureDoctors;

  @override
  void initState() {
    super.initState();
    futureDoctors = HttpTasks.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Doctor List'),
            ),
            body: Center(
              child: FutureBuilder<List<Doctor>>(
                future: futureDoctors,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    doctorList = snapshot.data;
                    return ListView.builder(
                      itemCount: doctorList.length,
                      itemBuilder: (context, index) {
                        var doc = doctorList.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorDetail(
                                        doc: doc,
                                      )),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Card(
                              elevation: 3,
                              shadowColor: Colors.black45,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          doc.photo,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0),
                                              child: Text(doc.name),
                                            )),
                                        Expanded(
                                          flex: 5,
                                          child: DoctorSpecRow(
                                            doc: doc,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )));
  }
}

class DoctorSpecRow extends StatelessWidget {
  final Doctor doc;

  const DoctorSpecRow({
    Key key,
    this.doc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DoctorSpecCard(
          icon: Icons.portrait,
          countLabel: "Patients",
          countText: doc.patients > 1000 ? "1000+" : doc.patients.toString(),
          color: Colors.lightBlueAccent[100],
          iconColor: Colors.lightBlueAccent[400],
        ),
        DoctorSpecCard(
          icon: Icons.card_membership,
          countLabel: "Experience",
          countText: "${doc.experience} Yrs",
          color: Colors.pink[100],
          iconColor: Colors.pink[200],
        ),
        DoctorSpecCard(
          icon: Icons.star_border,
          countLabel: "Ratings",
          countText: doc.ratings.toString(),
          color: Colors.orange[200],
          iconColor: Colors.orange[500],
        ),
      ],
    );
  }
}

class DoctorSpecCard extends StatelessWidget {
  final IconData icon;
  final String countText;
  final String countLabel;
  final Color color;
  final Color iconColor;
  const DoctorSpecCard({
    Key key,
    this.icon,
    this.countText,
    this.countLabel,
    this.color,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black45,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Center(
                        child: Icon(
                          icon,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
            Spacer(),
            Expanded(
                child: Text(
              countText,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                  fontSize: 12),
            )),
            Expanded(
                child: Text(
              countLabel,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                  fontSize: 8),
            )),
          ],
        ),
      ),
    );
  }
}
