part of 'user_account_bloc.dart';

sealed class UserAccountEvent extends Equatable {
  const UserAccountEvent();

  @override
  List<Object> get props => [];
}

class CreateUserAccount extends UserAccountEvent {
  final UserAccountModel user;

  const CreateUserAccount({required this.user});
}

class UpdateUserAccount extends UserAccountEvent {
  final UserAccountModel user;

  const UpdateUserAccount({required this.user});
}

final class CheckUserProfile extends UserAccountEvent {
  final String profilePic;

  const CheckUserProfile({required this.profilePic});
}
