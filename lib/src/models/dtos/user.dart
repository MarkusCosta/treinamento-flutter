class User {
  int id;
  String name;
  int points;
  String imagePath;

  User({
    this.id,
    this.name,
    this.points,
    this.imagePath,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    points: json["points"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "points": points,
    "image_path": imagePath,
  };

  @override
  String toString() {
    return 'User{id: $id, name: $name, points: $points, imagePath: $imagePath}';
  }


}