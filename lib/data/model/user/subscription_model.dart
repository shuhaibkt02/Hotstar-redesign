import 'package:equatable/equatable.dart';

class SubscriptionModel extends Equatable {
  final bool hasSubscription;
  final String subscriptionType;
  final DateTime expirationDate;

  const SubscriptionModel({
    required this.hasSubscription,
    required this.subscriptionType,
    required this.expirationDate,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      hasSubscription: json['has_Subscription'],
      subscriptionType: json['subscriptionType'],
      expirationDate: json['expiryDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'has_Subscription': hasSubscription,
      'subscriptionType': subscriptionType,
      'expiryDate': expirationDate,
    };
  }

  @override
  List<Object?> get props =>
      [hasSubscription, subscriptionType, expirationDate];

  SubscriptionModel copyWith({
    bool? hasSubscription,
    String? subscriptionType,
    DateTime? expirationDate,
  }) {
    return SubscriptionModel(
      hasSubscription: hasSubscription ?? this.hasSubscription,
      subscriptionType: subscriptionType ?? this.subscriptionType,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }
}
