class User {
  String? uID;
  String? email;
  String? fname;
  String? lname;
  String? profilePicURL;

  User({this.uID, this.email, this.fname, this.lname, this.profilePicURL});

  User.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    email = json['Email'];
    fname = json['Fname'];
    lname = json['Lname'];
    profilePicURL = json['ProfilePicURL'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['UID'] = uID;
    data['Email'] = email;
    data['Fname'] = fname;
    data['Lname'] = lname;
    data['ProfilePicURL'] = profilePicURL;
    return data;
  }
}
