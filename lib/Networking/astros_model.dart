class AstrosModel {
  List<People>? people;
  int? number;
  String? message;

  AstrosModel({this.people, this.number, this.message});

  AstrosModel.fromJson(Map<String, dynamic> json) {
    people = json["people"] == null
        ? null
        : (json["people"] as List).map((e) => People.fromJson(e)).toList();
    number = json["number"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (people != null) {
      data["people"] = people?.map((e) => e.toJson()).toList();
    }
    data["number"] = number;
    data["message"] = message;
    return data;
  }
}

class People {
  String? name;
  String? craft;
  String? thumbnailUrl;
  String? contentUrl;

  People({this.name, this.craft, this.thumbnailUrl, this.contentUrl});

  People.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    craft = json["craft"];
    thumbnailUrl = json["thumbnailUrl"];
    contentUrl = json["contentUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["craft"] = craft;
    data["thumbnailUrl"] = thumbnailUrl;
    data["contentUrl"] = contentUrl;
    return data;
  }
}
