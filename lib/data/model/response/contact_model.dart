class ContactModel {
  ContactModel({
      this.status, 
      this.data,});

  ContactModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ContactItem.fromJson(v));
      });
    }
  }
  String? status;
  List<ContactItem>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ContactItem {
  ContactItem({
      this.id, 
      this.fullName, 
      this.email, 
      this.phoneNumber,});

  ContactItem.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
  }
  int? id;
  String? fullName;
  String? email;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    return map;
  }

}