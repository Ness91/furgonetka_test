import 'package:furgonetka/models/parcel.dart';
import 'package:furgonetka/models/person.dart';
import 'package:intl/intl.dart';

class Package {
  int? id;
  String? service;
  DateTime? dateTimeSend;
  Person? sender;
  Person? receiver;
  List<Parcel>? parcels;

  Package({
    this.id,
    this.service,
    this.dateTimeSend,
    this.sender,
    this.receiver,
    this.parcels,
  });

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service = json['service'];
    dateTimeSend = json['datetime_send'] == null
        ? null
        : DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['datetime_send']);
    sender = Person.fromJson(json['sender']);
    receiver = Person.fromJson(json['receiver']);

    if (json['parcels'] != null) {
      parcels = [];
      if (json['parcels'] is List<dynamic>) {
        for (var j in json['parcels']) {
          parcels!.add(Parcel.fromJson(j));
        }
      } else {
        parcels!.add(Parcel.fromJson(json['parcels']));
      }
    }
  }
}
