import 'dart:convert';

import 'package:doctorAppointment_flutter/models/doctor.dart';

import 'package:http/http.dart' as http;

class HttpTasks {
  static var url = 'https://realtimedemoapp-3accc.firebaseio.com/doctors.json';

  static Future<List<Doctor>> fetchData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonList = ((json.decode(response.body)) as List);
      List<Doctor> doctors = List();
      for (var doc in jsonList) {
        doctors.add(Doctor.fromJson(doc));
      }
      return doctors;
    } else {
      throw Exception('Failed to load Doctors');
    }
  }
}
