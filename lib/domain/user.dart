// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String login;
    String avatarUrl;
    String bio;

    User({
        required this.login,
        required this.avatarUrl,
        required this.bio,
    });

   

  User copyWith({
    String? login,
    String? avatarUrl,
    String? bio,
  }) {
    return User(
      login: login ?? this.login,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'login': login});
    result.addAll({'avatarUrl': avatarUrl});
    result.addAll({'bio': bio});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      login: map['login'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      bio: map['bio'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(login: $login, avatarUrl: $avatarUrl, bio: $bio)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.login == login &&
      other.avatarUrl == avatarUrl &&
      other.bio == bio;
  }

  @override
  int get hashCode => login.hashCode ^ avatarUrl.hashCode ^ bio.hashCode;
}
