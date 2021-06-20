class AstrosModel {
  int? number;
  String? message;
  List<People>? people;

  AstrosModel({this.number, this.message, this.people});

  AstrosModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    message = json['message'];
    if (json['people'] != null) {
      people = <People>[];
      json['people'].forEach((v) {
        people!.add(new People.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['message'] = this.message;
    if (this.people != null) {
      data['people'] = this.people!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class People {
  String? name;
  String? craft;

  People({this.name, this.craft});

  People.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    craft = json['craft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['craft'] = this.craft;
    return data;
  }
}
