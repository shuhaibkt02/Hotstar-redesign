import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/data/model/content/content_model.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';
import 'package:hotstar/logic/accounts/user_account_bloc.dart';
import 'package:hotstar/logic/provider/user_image_provider.dart';
import 'package:hotstar/presentation/screen/category_screen.dart';
import 'package:hotstar/presentation/screen/downloads_screen.dart';
import 'package:hotstar/presentation/screen/series_screen.dart';
import 'package:hotstar/presentation/widgets/error_page.dart';
import 'package:hotstar/presentation/widgets/home/title_listview.dart';
import 'package:hotstar/presentation/widgets/home/usre_account_profile.dart';
import 'package:hotstar/presentation/widgets/navigation_head.dart';
import 'package:hotstar/presentation/widgets/series/custom_icon_button.dart';
import 'package:hotstar/utils/constant.dart';

class HomeScreen extends StatelessWidget {
  static const String home = 'homePage';

  final String selectedUser;
  final String avatarImg;
  final UserMood selectedMood;
  const HomeScreen(
      {super.key,
      required this.selectedUser,
      required this.avatarImg,
      required this.selectedMood});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double radiusNicon = (size.width < 325) ? size.width / 18 : 18;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: size.width / 2 + 50,
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        image: AssetImage(disneyLogo),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        NavigationHeader(
                          label: 'Everything',
                          onpress: () => GoRouter.of(context)
                              .pushNamed(CategoryScreen.category),
                        ),
                        Row(
                          children: [
                            CustomIconButton(
                              onpress: () {},
                              radius: radiusNicon,
                              iconSize: radiusNicon,
                              icon: Icons.search,
                              alignment: Alignment.bottomCenter,
                            ),
                            CustomIconButton(
                              onpress: () {
                                GoRouter.of(context)
                                    .pushNamed(DownloadScreen.download);
                              },
                              radius: radiusNicon,
                              iconSize: radiusNicon,
                              icon: Icons.arrow_downward_outlined,
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const TitleAndListView(
                    isWatched: true,
                    title: 'Continue watching',
                    contentType: ContentCategoryType.movie,
                  ),
                  TitleAndListView(
                    isWatched: false,
                    title: 'Latest Release',
                    contentType: ContentCategoryType.tvShow,
                    playMando: () {
                      GoRouter.of(context).pushNamed(SeriesPlay.seriesPlay);
                    },
                  ),
                  const TitleAndListView(
                    isWatched: false,
                    title: 'Popular Movies',
                    contentType: ContentCategoryType.movie,
                  ),
                  const TitleAndListView(
                    isWatched: false,
                    title: 'Exclusive Movies',
                    contentType: ContentCategoryType.movie,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: radiusNicon,
              child: BlocBuilder<UserAccountBloc, UserAccountState>(
                builder: (context, state) {
                  switch (state) {
                    case UserAccountInitial():
                      context.read<AccountImageProvider>().selectedImg =
                          avatarImg;
                      context.read<AccountImageProvider>().selectedMood =
                          selectedMood;
                      return UserAccountProfile(
                        radius: radiusNicon + 5,
                        selectedUser: selectedUser,
                        avatarImg: avatarImg,
                        selectedMood: selectedMood,
                      );
                    case UserAccountLoading():
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case UserAccountLoaded():
                      UserAccountModel updateUser = state.updatedList
                          .firstWhere((userAccount) =>
                              userAccount.userName == selectedUser);
                      return UserAccountProfile(
                        selectedUser: updateUser.userName,
                        avatarImg: updateUser.avatarImg,
                        selectedMood: updateUser.mood,
                        radius: radiusNicon + 3,
                      );

                    case UserAccountError():
                      return ErrorPage(
                        errorMsg: state.errorMessage,
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
