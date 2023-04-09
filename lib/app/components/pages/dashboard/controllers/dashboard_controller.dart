import 'package:favoritism_communication/app/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:favoritism_communication/app/utils/ad_util.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DashboardController extends GetxController {
  final TabService tabService = Get.find();
  BannerAd? _ad;
  final isShowAd = false.obs;

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
}
