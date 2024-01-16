import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';
import 'package:hotstar/data/sample/sample_user.dart';

part 'user_account_event.dart';
part 'user_account_state.dart';

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  UserAccountBloc()
      : super(UserAccountInitial(user: sampleUserList[0].accounts)) {
    on<CreateUserAccount>((event, emit) async {
      try {
        emit(UserAccountLoading());
        final List<UserAccountModel> updatedList = [
          ...sampleUserList[0].accounts,
          event.user
        ];
        await Future.delayed(const Duration(seconds: 1), () {
          emit(UserAccountLoaded(updatedList: updatedList));
        });
      } catch (e) {
        emit(UserAccountError(errorMessage: '$e'));
      }
    });

    on<UpdateUserAccount>((event, emit) async {
      try {
        emit(UserAccountLoading());
        final List<UserAccountModel> updatedList =
            sampleUserList.expand((user) => user.accounts).map((userAccount) {
          if (userAccount.userName == event.user.userName) {
            return event.user;
          } else {
            return userAccount;
          }
        }).toList();

        emit(UserAccountLoaded(updatedList: updatedList));
      } catch (e) {
        emit(UserAccountError(errorMessage: '$e'));
      }
    });
    on<CheckUserProfile>((event, emit) {
      // UserMood updatedUserMood = widget.selectedMood;
      // String selectedAvatarImg = widget.avatarImg;
    });
  }
}
