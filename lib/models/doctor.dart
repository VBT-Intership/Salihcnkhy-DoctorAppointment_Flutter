class Doctor {
  String about;
  Communication communication;
  int experience;
  String field;
  String name;
  int patients;
  String photo;
  double ratings;
  Workingday workingday;
  Workingday workingtime;

  Doctor(
      {this.about,
      this.communication,
      this.experience,
      this.field,
      this.name,
      this.patients,
      this.photo,
      this.ratings,
      this.workingday,
      this.workingtime});

  Doctor.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    communication = json['communication'] != null
        ? new Communication.fromJson(json['communication'])
        : null;
    experience = json['experience'];
    field = json['field'];
    name = json['name'];
    patients = json['patients'];
    photo = json['photo'];
    ratings = json['ratings'];
    workingday = json['workingday'] != null
        ? new Workingday.fromJson(json['workingday'])
        : null;
    workingtime = json['workingtime'] != null
        ? new Workingday.fromJson(json['workingtime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    if (this.communication != null) {
      data['communication'] = this.communication.toJson();
    }
    data['experience'] = this.experience;
    data['field'] = this.field;
    data['name'] = this.name;
    data['patients'] = this.patients;
    data['photo'] = this.photo;
    data['ratings'] = this.ratings;
    if (this.workingday != null) {
      data['workingday'] = this.workingday.toJson();
    }
    if (this.workingtime != null) {
      data['workingtime'] = this.workingtime.toJson();
    }
    return data;
  }
}

class Communication {
  String audiocall;
  String messaging;
  String videocall;

  Communication({this.audiocall, this.messaging, this.videocall});

  Communication.fromJson(Map<String, dynamic> json) {
    audiocall = json['audiocall'];
    messaging = json['messaging'];
    videocall = json['videocall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audiocall'] = this.audiocall;
    data['messaging'] = this.messaging;
    data['videocall'] = this.videocall;
    return data;
  }
}

class Workingday {
  String from;
  String to;

  Workingday({this.from, this.to});

  Workingday.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
