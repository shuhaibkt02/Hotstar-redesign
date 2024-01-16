// user_model.dart
import 'package:equatable/equatable.dart';
import 'package:hotstar/data/model/user/device_model.dart';
import 'package:hotstar/data/model/user/subscription_model.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';


class UserModel extends Equatable {
  final String userID;
  final String userName;
  final String profilePicture;
  final String email;
  final int mobileNumber;
  final SubscriptionModel subscription;
  final List<DeviceModel> devices;
  final List<UserAccountModel> accounts;

  const UserModel({
    required this.userID,
    required this.userName,
    required this.profilePicture,
    required this.email,
    required this.mobileNumber,
    required this.subscription,
    required this.devices,
    required this.accounts,
  });

  @override
  List<Object?> get props {
    return [
      userID,
      userName,
      profilePicture,
      email,
      mobileNumber,
      subscription,
      devices,
      accounts,
    ];
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'] as String,
      userName: json['userName'] as String,
      profilePicture: json['profilePicture'] as String,
      email: json['email'] as String,
      mobileNumber: json['mobileNumber'] as int,
      subscription: SubscriptionModel.fromJson(json['subscription']),
      devices: (json['devices'] as List<dynamic>)
          .map((deviceJson) => DeviceModel.fromJson(deviceJson))
          .toList(),
      accounts: (json['accounts'] as List<dynamic>)
          .map((account) => UserAccountModel.fromJson(account))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'userName': userName,
      'profilePicture': profilePicture,
      'email': email,
      'mobileNumber': mobileNumber,
      'subscription': subscription.toJson(),
      'devices': devices.map((device) => device.toJson()).toList(),
      'accounts': accounts.map((account) => account.toJson()).toList(),
    };
  }

  UserModel copyWith({
    String? userID,
    String? userName,
    String? profilePicture,
    String? email,
    int? mobileNumber,
    SubscriptionModel? subscription,
    List<DeviceModel>? devices,
    List<UserAccountModel>? accounts,
  }) {
    return UserModel(
      userID: userID ?? this.userID,
      userName: userName ?? this.userName,
      profilePicture: profilePicture ?? this.profilePicture,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      subscription: subscription ?? this.subscription,
      devices: devices ?? this.devices,
      accounts: accounts ?? this.accounts,
    );
  }
}
