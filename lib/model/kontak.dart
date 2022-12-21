// ignore_for_file: file_names, unnecessary_this, prefer_collection_literals

class Kontak{
  int? id;
  String? name;
  String? NIM;
  String? mobileNo;
  String? email;
  Kontak({this.id, this.name, this.NIM, this.mobileNo, this.email, });
  Map<String, dynamic> toMap() {var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;map['NIM'] = NIM;map['mobileNo'] = mobileNo;map['email'] = email;
    return map;
  }
  Kontak.fromMap(Map<String, dynamic> map) {
  this.id = map['id'];this.name = map['name']; this.NIM = map['NIM']; this.mobileNo = map['mobileNo'];this.email = map['email'];
  }
}