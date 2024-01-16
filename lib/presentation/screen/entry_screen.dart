import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';
import 'package:hotstar/logic/accounts/user_account_bloc.dart';
import 'package:hotstar/presentation/widgets/error_page.dart';
import 'package:hotstar/presentation/widgets/home/account_user.dart';
import 'package:hotstar/presentation/widgets/series/custom_icon_button.dart';

class EntryScreen extends StatelessWidget {
  static const String entry = 'entryPage';
  const EntryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: (size.height >= 430) ? 40 : 10),
          Padding(
            padding: (size.height >= 492)
                ? const EdgeInsets.symmetric(vertical: 38.0)
                : const EdgeInsets.all(0.0),
            child: Text(
              'Who\'s watching?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: BlocBuilder<UserAccountBloc, UserAccountState>(
              builder: (context, state) {
                switch (state) {
                  case UserAccountInitial():
                    final userList = state.user;
                    return UserListSelection(userList: userList);
                  case UserAccountLoading():
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case UserAccountLoaded():
                    final userList = state.updatedList;
                    return UserListSelection(userList: userList);
                  case UserAccountError():
                    return ErrorPage(
                      errorMsg: state.errorMessage,
                    );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: Icons.add,
                  alignment: Alignment.center,
                  opacity: 0.3,
                  onpress: () {
                    context.read<UserAccountBloc>().add(CreateUserAccount(
                        user: UserAccountModel(
                            userName: 'Kids',
                            avatarImg: '',
                            mood: UserMood.happy)));
                  },
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.blue),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
