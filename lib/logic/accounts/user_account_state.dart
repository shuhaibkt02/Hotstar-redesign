part of 'user_account_bloc.dart';

sealed class UserAccountState extends Equatable {
  const UserAccountState();

  @override
  List<Object> get props => [];
}

final class UserAccountInitial extends UserAccountState {
  final List<UserAccountModel> user;

  const UserAccountInitial({required this.user});
}

final class UserAccountLoading extends UserAccountState {}

final class UserAccountLoaded extends UserAccountState {
  final List<UserAccountModel> updatedList;

  const UserAccountLoaded({required this.updatedList});
}

final class UserAccountError extends UserAccountState {
  final String errorMessage;

  const UserAccountError({required this.errorMessage});
}
