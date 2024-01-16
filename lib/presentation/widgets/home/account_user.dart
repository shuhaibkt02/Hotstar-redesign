import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';
import 'package:hotstar/presentation/screen/home_screen.dart';
import 'package:hotstar/presentation/widgets/home/person_circle.dart';

class UserListSelection extends StatelessWidget {
  const UserListSelection({
    super.key,
    required this.userList,
  });

  final List<UserAccountModel> userList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double radiusNicon = size.width < 450
        ? size.width / 12
        : size.width < 700
            ? size.width / 15
            : 35;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        userList.length,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: PersonAvatar(
            radius: radiusNicon,
            user: userList[index].userName,
            userImage: userList[index].avatarImg,
            onpress: () => GoRouter.of(context).pushReplacementNamed(
              HomeScreen.home,
              extra: {
                'user': userList[index].userName,
                'accountImg': userList[index].avatarImg,
                'mood': userList[index].mood,
              },
            ),
          ),
        ),
      ),
    );
  }
}
