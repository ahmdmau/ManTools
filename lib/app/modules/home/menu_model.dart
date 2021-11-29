class Menu {
  int? id;
  String? name;
  String? icon;

  Menu({this.id, this.name, this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}
