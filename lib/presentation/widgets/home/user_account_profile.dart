import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';
import 'package:hotstar/logic/accounts/user_account_bloc.dart';
import 'package:hotstar/logic/provider/user_image_provider.dart';
import 'package:hotstar/presentation/widgets/home/person_circle.dart';
import 'package:hotstar/presentation/widgets/series/custom_icon_button.dart';
import 'package:hotstar/utils/constant.dart';
import 'package:provider/provider.dart';

class UserAccountProfile extends StatelessWidget {
  const UserAccountProfile({
    super.key,
    required this.selectedUser,
    required this.avatarImg,
    required this.selectedMood,
    required this.radius,
  });

  final String selectedUser;
  final String avatarImg;
  final UserMood selectedMood;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return PersonAvatar(
      radius: radius,
      noName: true,
      user: selectedUser,
      userImage: avatarImg,
      onpress: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          barrierColor: Colors.black,
          builder: (BuildContext context) {
            final _provider = context.read<AccountImageProvider>();
            return Container(
              height: 500,
              decoration: const BoxDecoration(
                color: Color.fromARGB(193, 0, 0, 0),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Consumer<AccountImageProvider>(
                builder: (context, value, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 26),
                          Center(
                            child: Text('What\'s the mood ?',
                                style: Theme.of(context).textTheme.titleMedium),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomIconButton(
                              onpress: () {
                                context.pop();
                              },
                              icon: Icons.close,
                              radius: 14,
                              iconSize: 13,
                              opacity: 0.1,
                              alignment: Alignment.centerRight,
                              iconColors: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 5),
                          itemCount: getList(_provider.selectedMood).length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final listImg = getList(_provider.selectedMood);
                            bool isCurrentImg =
                                _provider.selectedImg == listImg[index];

                            return Center(
                              child: InkWell(
                                onTap: () {
                                  _provider.changeAccountImg(
                                      avtimg: listImg[index]);
                                },
                                child: ClipOval(
                                  child: Container(
                                    width: (isCurrentImg) ? 170 : 140,
                                    height: (isCurrentImg) ? 170 : 140,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(
                                        width: (isCurrentImg) ? 3 : 0,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: AssetImage(listImg[index]),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Row(
                          children:
                              List.generate(UserMood.values.length, (index) {
                            bool isCurrentMood = _provider.selectedMood ==
                                UserMood.values[index];
                            return Expanded(
                              child: InkWell(
                                onTap: () {
                                  _provider.changeAccountMood(
                                      mood: UserMood.values[index]);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: (isCurrentMood)
                                        ? Colors.grey.shade900
                                        : Colors.grey.shade800,
                                    borderRadius: (isCurrentMood)
                                        ? BorderRadius.circular(6)
                                        : BorderRadius.circular(0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    UserMood.values[index].name.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 12.5,
                                          color: (isCurrentMood)
                                              ? Colors.grey.shade200
                                              : Colors.grey.shade400,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            );
          },
        ).whenComplete(
          () {
            if (context.read<AccountImageProvider>().selectedImg.isNotEmpty) {
              BlocProvider.of<UserAccountBloc>(context).add(
                UpdateUserAccount(
                  user: UserAccountModel(
                    userName: selectedUser,
                    avatarImg: context.read<AccountImageProvider>().selectedImg,
                    mood: context.read<AccountImageProvider>().selectedMood,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
