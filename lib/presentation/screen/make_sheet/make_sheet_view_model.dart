import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:good_job/config/service/ad_mob_service.dart';
import 'package:good_job/domain/model/check.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/repository/sheet_repository.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MakeSheetViewModel with ChangeNotifier {
  final SheetRepository repository;
  InterstitialAd? interstitialAd;
  Box<Check>? checkBox;

  MakeSheetViewModel({
    required this.repository,
  }) {
    init();
  }

  MakeSheetState _state = const MakeSheetState();

  MakeSheetState get state => _state;

  void init() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) => interstitialAd = ad,
          onAdFailedToLoad: (error) => interstitialAd = null),
    );
    checkBox = Hive.box<Check>('check');
  }

  Future<Sheet> addSheet(String name, int count) async {
    final String id = DateTime.now().toString();

    final Sheet sheet = Sheet(
        id: id, name: name, count: count, filledCount: 0, ableToCheck: true);
    repository.getSheetsBox().put(id, sheet);

    notifyListeners();
    return sheet;
  }

  void selectButton(int value) {
    _state = state.copyWith(selectedButton: value);
    notifyListeners();
  }

  String getStickerPath(int value) {
    String stickerPath = '';
    switch (value) {
      case 10:
        stickerPath = 'assets/10_0_1.png';
      case 15:
        stickerPath = 'assets/15_0_0.png';
      case 20:
        stickerPath = 'assets/4.png';
      case 30:
        stickerPath = 'assets/7.png';
    }
    return stickerPath;
  }

  String getStickerName(int value) {
    String stickerName = '';
    switch (value) {
      case 10:
        stickerName = '도넛';
      case 15:
        stickerName = '당구공';
      case 20:
        stickerName = '과일';
      case 30:
        stickerName = '과일';
    }
    return stickerName;
  }

  void hideSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  void showSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  void showAd() {
    if (interstitialAd != null) {
      hideSystemUI(); // 광고를 보여주기 전에 시스템 UI 숨기기

      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          showSystemUI(); // 광고가 닫힐 때 시스템 UI 복원
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          showSystemUI(); // 광고 표시 실패 시에도 시스템 UI 복원
          ad.dispose();
          init();
        },
      );
      interstitialAd!.show();
      interstitialAd = null;
    }
  }

  bool isFirstMake() {
    final check = checkBox?.get(1);
    return check?.isFirstMake ?? true;
  }

  void updateCheck() {
    Check? check = checkBox?.get(1);
    if (check != null) {
      check.isFirstMake = false;
      checkBox?.put(1, check);
    }
  }
}
