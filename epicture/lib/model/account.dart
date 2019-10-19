import 'dart:convert';

class AccountData {
  final int id;
  final String url;
  final String bio;
  final String avatar;
  final String avatar_name;
  final String cover;
  final String cover_name;
  final int reputation;
  final String reputation_name;
  final int created;
  final bool pro_expiration;
//  final bool status;

  AccountData({
    this.id,
    this.url,
    this.bio,
    this.avatar,
    this.avatar_name,
    this.cover,
    this.cover_name,
    this.reputation,
    this.reputation_name,
    this.created,
    this.pro_expiration
  });

  factory AccountData.fromJson(Map<String, dynamic> json) {
    return new AccountData(
      id: json['id'],
      url: json['url'],
      bio: json['bio'],
      avatar: json['avatar'],
      avatar_name: json['avatar_name'],
      cover: json['cover'],
      cover_name: json['cover_name'],
      reputation: json['reputation'],
      reputation_name: json['reputation_name'],
      created: json['created'],
      pro_expiration: json['pro_expiration']
    );
  }
}

class Account {
//  final bool is_blocked;
  final bool success;
  final int status;
  final AccountData data;

  Account({
    this.data,
    this.success,
    this.status
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return new Account(
      data: AccountData.fromJson(json['data']),
      success: json['success'],
      status: json['status']
    );
  }
}

Account parseAccount(String responseBody) {
  final parsed = json.decode(responseBody);

  return new Account.fromJson(parsed);
}
