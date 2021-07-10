// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


List<Images> imageFromJson(String str) => List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));

String imageToJson(List<Images> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Images {
  Images({
    this.id,
    this.description,
    this.urls,
    this.categories,
    this.likes,
    // this.user,
    // this.color,  // this.links,
  });

  String? id;
  String? color;
  String? description;
  String? altDescription;
  Urls? urls;
  // ImagesLinks? links;
  List<dynamic>? categories;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  // User? user;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    // width: json["width"],
    // height: json["height"],
    // // color: json["color"],
    description: json["description"] == null ? null : json["description"],
    urls: Urls.fromJson(json["urls"]),
    // links: ImagesLinks.fromJson(json["links"]),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    likes: json["likes"],
    // user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "width": width,
    // "height": height,
    "color": color,
    "description": description == null ? null : description,
    "alt_description": altDescription,
    "urls": urls!.toJson(),
    // "links": links!.toJson(),
    "categories": List<dynamic>.from(categories!.map((x) => x)),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections!.map((x) => x)),
    // "user": user!.toJson(),
  };
}

// class ImagesLinks {
//   ImagesLinks({
//     this.self,
//     this.html,
//     this.download,
//     this.downloadLocation,
//   });
//
//   String? self;
//   String? html;
//   String? download;
//   String? downloadLocation;
//
//   factory ImagesLinks.fromJson(Map<String, dynamic> json) => ImagesLinks(
//     self: json["self"],
//     html: json["html"],
//     download: json["download"],
//     downloadLocation: json["download_location"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "self": self,
//     "html": html,
//     "download": download,
//     "download_location": downloadLocation,
//   };
// }


// class User {
//   User({
//     this.id,
//     this.username,
//     this.name,
//     this.firstName,
//     this.lastName,
//     this.twitterUsername,
//     this.portfolioUrl,
//     this.bio,
//     this.location,
//     this.instagramUsername,
//     this.totalCollections,
//     this.totalLikes,
//     this.totalPhotos,
//     this.acceptedTos,
//     this.forHire,
//   });
//
//   String? id;
//   String? username;
//   String? name;
//   String? firstName;
//   String? lastName;
//   String? twitterUsername;
//   String? portfolioUrl;
//   String? bio;
//   String? location;
//   String? instagramUsername;
//   int? totalCollections;
//   int? totalLikes;
//   int? totalPhotos;
//   bool? acceptedTos;
//   bool? forHire;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     username: json["username"],
//     name: json["name"],
//     firstName: json["first_name"],
//     bio: json["bio"] == null ? null : json["bio"],
//     location: json["location"] == null ? null : json["location"],
//     instagramUsername: json["instagram_username"] == null ? null : json["instagram_username"],
//     totalCollections: json["total_collections"],
//     totalLikes: json["total_likes"],
//     totalPhotos: json["total_photos"],
//     acceptedTos: json["accepted_tos"],
//     forHire: json["for_hire"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "username": username,
//     "name": name,
//     "first_name": firstName,
//     "last_name": lastName == null ? null : lastName,
//     "twitter_username": twitterUsername == null ? null : twitterUsername,
//     "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
//     "bio": bio == null ? null : bio,
//     "location": location == null ? null : location,
//     "instagram_username": instagramUsername == null ? null : instagramUsername,
//     "total_collections": totalCollections,
//     "total_likes": totalLikes,
//     "total_photos": totalPhotos,
//     "accepted_tos": acceptedTos,
//     "for_hire": forHire,
//   };
// }



class Urls {
  Urls({
    this.raw,
    this.full,
  });

  String? raw;
  String? full;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
  };
}
