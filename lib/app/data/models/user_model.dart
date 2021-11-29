class UserModel {
  String? uid;
  String? name;
  String? email;
  String? photoUrl;
  int? roles;
  String? creationTime;
  String? lastSignInTime;
  String? updatedTime;
  String? providers;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.photoUrl,
      this.roles,
      this.creationTime,
      this.lastSignInTime,
      this.updatedTime,
      this.providers});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    roles = json['roles'];
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
    updatedTime = json['updatedTime'];
    providers = json['providers'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['roles'] = roles;
    data['creationTime'] = creationTime;
    data['lastSignInTime'] = lastSignInTime;
    data['updatedTime'] = updatedTime;
    data['providers'] = providers;
    return data;
  }
}
