// @JsonSerializable()
class UserInfo {
  String? name;
  String? job;
  String? id;
  String? createdAt;
  String? updatedAt;

  UserInfo({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
    this.updatedAt,
  });
  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    job = json["job"];
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
      };
}
