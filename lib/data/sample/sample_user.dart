import 'package:hotstar/data/model/user/device_model.dart';
import 'package:hotstar/data/model/user/subscription_model.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';
import 'package:hotstar/data/model/user/user_model.dart';
import 'package:hotstar/utils/constant.dart';

List<UserModel> sampleUserList = [
  UserModel(
    userID: '1',
    userName: 'admin',
    profilePicture: mandlorian,
    email: 'admin@admin',
    mobileNumber: 1234567890,
    subscription: SubscriptionModel(
      hasSubscription: true,
      subscriptionType: '3 month',
      expirationDate: DateTime.now(),
    ),
    devices: const [
      DeviceModel(
        deviceID: '1',
        deviceName: 'Samsung',
        deviceType: 'android',
      )
    ],
    accounts: [
      UserAccountModel(
        userName: 'Shu',
        avatarImg: 'assets/avatar/woody.jpeg',
        mood: UserMood.happy,
      ),
      UserAccountModel(
        userName: 'Anna',
        avatarImg: 'assets/avatar/jessie.jpeg',
        mood: UserMood.angry,
      ),
    ],
  ),
];
