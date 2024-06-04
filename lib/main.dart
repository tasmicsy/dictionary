import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary/ad_helper.dart';
import 'package:dictionary/buttons.dart';
import 'package:dictionary/dictionaryList.dart';
import 'package:dictionary/firebase_options.dart';
import 'package:dictionary/readData.dart';
import 'package:dictionary/searchFields.dart';
import 'package:dictionary/titleLogo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share/share.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';

import 'appopenmanager.dart';


///全画面広告
/////テスト
AppOpenAd? openAd;

void loadInitialAd() {
  AppOpenAd.load(
      adUnitId: AdHelper.displayAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        openAd = ad;
        openAd!.show();
      }, onAdFailedToLoad: (error) {
        print("ad failed to load ${error}");
      }),
      orientation: AppOpenAd.orientationPortrait);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //app起動

  AppOpenAdManager appOpenAdManager = AppOpenAdManager();
  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  @override
  void initState() {
    super.initState();
    appOpenAdManager.loadAd();
    // Can't show a dialog in initState, delaying initialization
    WidgetsBinding.instance?.addPostFrameCallback((_) => initPlugin());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: ThemeData(fontFamily: "Comfortaa"),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  final player = AudioPlayer();
  final bgAudio = AudioPlayer();
  final bgAudio1 = AudioPlayer();
  final bgAudio2 = AudioPlayer();
  final _editController1 = TextEditingController();
  final _editController2 = TextEditingController();
  final _editController3 = TextEditingController();
  final _editController4 = TextEditingController();
  final _scrollController = ScrollController();
  String? cantoneseTmp;
  String? jyutpingTmp;
  String? catonkneesTmp;
  String? japaneseTmp;
  bool voiceTmp = false;
  InterstitialAd? _interstitialAd;
  AdInterstitial adInterstitial = new AdInterstitial();
  List<DictionaryModel>? dicTest;

  @override
  void initState() {
    // bgAudio.play(UrlSource("https://catonknees.com/wp-content/uploads/2022/05/2749.mp3"));
    super.initState();

    adInterstitial.createAd();

    loadInitialAd();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          //print("できてるらしい");
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          //print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
    Future(() async {
      await player.play(UrlSource(
          "https://catonknees.com/wp-content/uploads/2022/10/2s.mp3"));

      dicTest = await DictionaryModel.fetchDictionary();
      setState(() {
        dicTest = dicTest;
      });

      // print("yey")
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

// print("\ud84a\udf43");
// print("𢭃");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(37, 82, 143, 1),
          leading: const InfoButton(),
          title: Text(
            "Cantonese⇄Japanese",
            style: TextStyle(fontSize: 20.sp),
          ),
          actions: const [ShareButton()],
        ),
        backgroundColor: Color.fromRGBO(174, 192, 213, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CatOnKneesImages(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchContainer(
                      height: height * 0.3,
                      width: width,
                      isLeft: true,
                      child: Column(
                        children: [
                          LanguageTitle(
                            kanji: '粵',
                            alphabet: "Cantonese",
                          ),
                          SearchTextField(
                              fontSize: 23.sp,
                              height: height * 0.1,
                              onChangedFunc: (text) {
                                setState(() {
                                  cantoneseTmp = text;
                                  japaneseTmp = japaneseTmp;
                                  jyutpingTmp = jyutpingTmp;
                                  cantoneseTmp = cantoneseTmp;
                                });
                                _scrollController.animateTo(
                                  0, //最初の要素の指定
                                  duration:
                                      Duration(milliseconds: 2) /*スクロールの時間*/,
                                  curve: Curves.linear /*スクロールの仕方*/,
                                );
                              },
                              editController: _editController1,
                              label: """
漢字
Chinese Character
              """),
                          SearchTextField(
                              fontSize: 23.sp,
                              height: height * 0.1,
                              onChangedFunc: (text) {
                                setState(() {
                                  jyutpingTmp = text;
                                  japaneseTmp = japaneseTmp;
                                  catonkneesTmp = catonkneesTmp;
                                  cantoneseTmp = cantoneseTmp;
                                });
                                _scrollController.animateTo(
                                  0, //最初の要素の指定
                                  duration:
                                      Duration(milliseconds: 2) /*スクロールの時間*/,
                                  curve: Curves.linear /*スクロールの仕方*/,
                                );
                              },
                              editController: _editController2,
                              label: """
ピンイン
Jyutping/Yale
              """),
                          SearchTextField(
                              fontSize: 23.sp,
                              height: height * 0.1,
                              onChangedFunc: (text) {
                                setState(() {
                                  japaneseTmp = japaneseTmp;
                                  jyutpingTmp = jyutpingTmp;
                                  cantoneseTmp = cantoneseTmp;
                                  catonkneesTmp = text;
                                });
                                _scrollController.animateTo(
                                  0, //最初の要素の指定
                                  duration:
                                      Duration(milliseconds: 2) /*スクロールの時間*/,
                                  curve: Curves.linear /*スクロールの仕方*/,
                                );
                              },
                              editController: _editController3,
                              label: """
かな
CatOnKnees
              """),
                        ],
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SearchContainer(
                          height: height * 0.2,
                          width: width,
                          isLeft: false,
                          child: Column(
                            children: [
                              LanguageTitle(kanji: "日", alphabet: "Japanese"),
                              SearchTextField(
                                  fontSize: 23.sp,
                                  height: height * 0.1,
                                  onChangedFunc: (text) {
                                    setState(() {
                                      japaneseTmp = text;
                                      catonkneesTmp = catonkneesTmp;
                                      jyutpingTmp = jyutpingTmp;
                                      cantoneseTmp = cantoneseTmp;
                                    });
                                    _scrollController.animateTo(
                                      0, //最初の要素の指定
                                      duration: Duration(
                                          milliseconds: 1) /*スクロールの時間*/,
                                      curve: Curves.linear /*スクロールの仕方*/,
                                    );
                                  },
                                  editController: _editController4,
                                  label: """
日本語
Japanese
              """),
                            ],
                          )),
                      Container(
                        height: height * 0.1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClearButton(
                                  onPressedFunc: () {
                                    setState(() {
                                      japaneseTmp = japaneseTmp;
                                      catonkneesTmp = catonkneesTmp;
                                      jyutpingTmp = jyutpingTmp;
                                      cantoneseTmp = cantoneseTmp;
                                      voiceTmp =
                                          (voiceTmp == true) ? false : true;
                                      print(voiceTmp);
                                    });
                                    _scrollController.animateTo(
                                      0, //最初の要素の指定
                                      duration: Duration(
                                          milliseconds: 1) /*スクロールの時間*/,
                                      curve: Curves.linear /*スクロールの仕方*/,
                                    );
                                  },
                                  color: (voiceTmp == false)
                                      ? Colors.grey
                                      : Color.fromRGBO(186, 206, 179, 1),
                                  name: Icon(Icons.volume_up, size: 25.h)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClearButton(
                                  onPressedFunc: () {
                                    _scrollController.animateTo(
                                      0, //最初の要素の指定
                                      duration: Duration(
                                          milliseconds: 1) /*スクロールの時間*/,
                                      curve: Curves.linear /*スクロールの仕方*/,
                                    );
                                    _editController1.clear();
                                    _editController2.clear();
                                    _editController3.clear();
                                    _editController4.clear();
                                    setState(() {
                                      voiceTmp = false;
                                      japaneseTmp = null;
                                      cantoneseTmp = null;
                                      jyutpingTmp = null;
                                      catonkneesTmp = null;
                                    });
                                  },
                                  color: Colors.blue.shade100,
                                  name: Icon(Icons.delete, size: 25.h)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              //タイトル
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     decoration: InputDecoration(
              //         labelStyle: TextStyle(
              //           color: Colors.black54,
              //           fontSize: 13.h,
              //         ),
              //         // focusColor: Colors.black54,
              //
              //         fillColor: Colors.white,
              //         filled: true,
              //
              //         labelText: "検索する",
              //
              //     ),
              //   ),
              // ),
              // TextButton(
              //     style: ButtonStyle(
              //         // backgroundColor: MaterialStateProperty.all(Colors.yellow),
              //         alignment: Alignment.topCenter,
              //         overlayColor: MaterialStateProperty.all(
              //           Colors.white,
              //         )),
              //     onPressed: () async {
              //       bgAudio.play(UrlSource(
              //           "https://catonknees.com/wp-content/uploads/2022/05/2749.mp3"));
              //       await Future.delayed(const Duration(milliseconds: 800));
              //       bgAudio1.play(UrlSource(
              //           "https://catonknees.com/wp-content/uploads/2022/06/117.mp3"));
              //       await Future.delayed(const Duration(milliseconds: 800));
              //       bgAudio2.play(UrlSource(
              //           "https://catonknees.com/wp-content/uploads/2022/05/2749.mp3"));
              //     },
              //     child: const Icon(Icons.volume_up, color: Colors.black87, size: 20)),
              dicTest != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.43,
                      child: DictionaryList(
                          scrollController: _scrollController,
                          context: context,
                          dictionaryList: DictionaryModel.searchDictionary(
                              dicTest!,
                              cantoneseTmp,
                              jyutpingTmp,
                              catonkneesTmp,
                              japaneseTmp,
                              voiceTmp ?? false)))
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.43,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Colors.brown),
                          Text(
                            """
          起動時/ネット接続時は読み込みに時間がかかります。
          しばらくお待ちください。。☕️
          """,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))),
              (_isBannerAdReady)
                  ? SizedBox(
                      width: _bannerAd.size.width.toDouble(),
                      height: _bannerAd.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd),
                    )
                  : SizedBox(width: 30, height: 47),
            ],
          ),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
