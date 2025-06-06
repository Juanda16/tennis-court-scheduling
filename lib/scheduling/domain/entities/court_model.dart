class CourtModel {
  String id;
  String? name;
  String? type;
  String? availableFrom;
  String? availableTo;
  double? lat;
  double? lon;
  int? price;
  String? locationName;
  List<InstructorList>? instructorList;
  List<FieldImage>? images;

  CourtModel({
    required this.id,
    this.name,
    this.type,
    this.availableFrom,
    this.availableTo,
    this.lat,
    this.lon,
    this.price,
    this.locationName,
    this.instructorList,
    this.images,
  });

  factory CourtModel.fromJson(Map<String, dynamic> json) => CourtModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        availableFrom: json["availableFrom"],
        availableTo: json["availableTo"],
        lat: double.parse(json["lat"].toString()),
        lon: double.parse(json["lon"].toString()),
        price: json["price"],
        locationName: json["location_name"],
        instructorList: json["instructorList"] == null
            ? []
            : List<InstructorList>.from(
                json["instructorList"]!.map((x) => InstructorList.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<FieldImage>.from(
                json["images"]!.map((x) => FieldImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "availableFrom": availableFrom,
        "availableTo": availableTo,
        "lat": lat,
        "lon": lon,
        "price": price,
        "location_name": locationName,
        "instructorList": instructorList == null
            ? []
            : List<dynamic>.from(instructorList!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class FieldImage {
  String? url;

  FieldImage({
    this.url,
  });

  factory FieldImage.fromJson(Map<String, dynamic> json) => FieldImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class InstructorList {
  String? name;
  int? id;

  InstructorList({
    this.name,
    this.id,
  });

  factory InstructorList.fromJson(Map<String, dynamic> json) => InstructorList(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
