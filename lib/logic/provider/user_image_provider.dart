import 'package:flutter/material.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';

class AccountImageProvider extends ChangeNotifier {
  String selectedImg = 'assets/avatar/woody.jpeg';
  UserMood selectedMood = UserMood.happy;

  void changeAccountImg({required String avtimg}) {
    selectedImg = avtimg;
    notifyListeners();
  }

  void changeAccountMood({required UserMood mood}) {
    selectedMood = mood;
    notifyListeners();
  }
}

class AssetPreLoading {
  // asset preloading
  static Future<void> preloadImage(
      List<String> imagePath, BuildContext context) async {
    await Future.wait(
        imagePath.map((image) => precacheImage(AssetImage(image), context)));
  }
}
