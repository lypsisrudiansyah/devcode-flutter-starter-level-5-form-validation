import 'package:devcode_flutter_starter/data/model/response/contact_model.dart';

class CreateContactModel {
  CreateContactModel({
      this.status, 
      this.message, 
      this.data,});

  CreateContactModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ContactItem.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  ContactItem? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}