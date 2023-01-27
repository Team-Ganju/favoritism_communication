import 'package:favoritism_communication/app/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:favoritism_communication/app/utils/ad_util.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:favoritism_communication/app/routes/app_pages.dart';
import 'package:favoritism_communication/app/components/pages/search/views/search_view.dart';

class NavigationInfo{
  const NavigationInfo({
    required this.icon,
    required this.initialRoot,
    required this.label,
    required this.isModal,
    this.modalWindow,
  });

  final IconData icon;
  final String initialRoot;
  final String label;
  final bool isModal;
  final Widget? modalWindow;
}


class DashboardController extends GetxController {
  final TabService tabService = Get.find();
  BannerAd? _ad;
  final isShowAd = false.obs;

  final List<NavigationInfo> navigationInfo = const [
    NavigationInfo(icon: CupertinoIcons.home, initialRoot: Routes.home, label: 'ホーム', isModal: false),
    NavigationInfo(icon: CupertinoIcons.search, initialRoot: Routes.search, label: 'さがす', isModal: true, modalWindow: SearchView()),
    NavigationInfo(icon: CupertinoIcons.chat_bubble, initialRoot: Routes.chat, label: 'トーク', isModal: false),
    NavigationInfo(icon: CupertinoIcons.person, initialRoot: Routes.mypage, label: 'プロフィール', isModal: false),
  ];

  BannerAd? getAd() {
    return _ad;
  }

  @override
  void onInit() {
    super.onInit();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _ad = ad as BannerAd;
          isShowAd.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint(
              'Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    ).load();
  }

  @override
  void onClose() {
    super.onClose();
    if (_ad != null) {
      _ad!.dispose();
    }
  }

  void changeIndex(int index) {
    // モーダルの場合
    if(navigationInfo[index].isModal){
      Get.dialog(navigationInfo[index].modalWindow!); // ダイアログで表示
    }
    else{
      tabService.changeIndex(index);  // インデックスを変更
    }
  }
}
