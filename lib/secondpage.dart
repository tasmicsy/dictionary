import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary/readData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class SecondPage extends StatefulWidget {
  DictionaryModel dictionaryItem;

 SecondPage({required this.dictionaryItem,Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final player = AudioPlayer();
  final player1 = AudioPlayer();
  final player2 = AudioPlayer();
  final player3 = AudioPlayer();
  final player4 = AudioPlayer();
  final player5 = AudioPlayer();
  final player6 = AudioPlayer();
  final player7 = AudioPlayer();
  final player8 = AudioPlayer();
  final player9 = AudioPlayer();
  Color colorvolume = Colors.black;
  bool expanded1 = false;

  bool expanded2 = false;

  bool expanded3 = false;

  bool expanded4 = false;



  @override
  Widget build(BuildContext context) {
     print(widget.dictionaryItem.japanese);
    return Padding(
      padding:  EdgeInsets.only(top:90.h, left:10.w, right: 10.w, bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child:         Column(
          children: [

/// 一番上のリスト
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height *0.07,
                child: ListView.builder(
                  itemCount: widget.dictionaryItem.chinese.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width:  MediaQuery.of(context).size.width*0.5/widget.dictionaryItem.chinese.length,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          FittedBox(child: Text(widget.dictionaryItem.chinese[index], style: TextStyle(fontSize: 37),)),
                          // Text(widget.dictionaryItem.catOnknees.split(' ')[index]),
                          // Text(widget.dictionaryItem.yale.split(' ')[index]),

                          ]
                      ),
                    );
                  }
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: MediaQuery.of(context).size.height *0.05,
              child: ListView.builder(
                  itemCount: widget.dictionaryItem.catOnknees.split(' ').length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width:  MediaQuery.of(context).size.width*0.5/widget.dictionaryItem.catOnknees.split(' ').length,
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            FittedBox(child: Text(widget.dictionaryItem.catOnknees.split(' ')[index])),
                            
                            FittedBox(child: Text(widget.dictionaryItem.yale.split(' ')[index])),

                          ]
                      ),
                    );
                  }
              ),
            ),



            /// 単語共通の文章（スピーカーとか）
        SizedBox(
          child: Column(
            children:[

              if (widget.dictionaryItem.voiceData!= "") SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    ///スピーカー
                    TextButton(
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(Colors.yellow),
                            alignment: Alignment.topCenter,
                            overlayColor: MaterialStateProperty.all(Colors.white,)
                        ),
                        onPressed: ()async{
                          // if (voiceTimes==false) EasyLoading.show(status: "音声読み込み中");
                          setState((){colorvolume = Colors.grey;});
                          player.play(UrlSource(
                              widget.dictionaryItem.audio1));

                          if (widget.dictionaryItem.audio2!=""&&widget.dictionaryItem.audio2!=null){

                            await Future.delayed(const Duration(milliseconds: 800));
                            player1.play(UrlSource(
                                widget.dictionaryItem.audio2));
                          }

                          if (widget.dictionaryItem.audio3!=""&&widget.dictionaryItem.audio3!=null){
                            print("2");
                            await Future.delayed(const Duration(milliseconds: 800));
                            player2.play(UrlSource(
                                widget.dictionaryItem.audio3));
                          }

                          if (widget.dictionaryItem.audio4!=""&&widget.dictionaryItem.audio4!=null){
                            print("3");
                            await Future.delayed(const Duration(milliseconds: 800));
                           player3.play(UrlSource(
                                widget.dictionaryItem.audio4));
                          }

                          if (widget.dictionaryItem.audio5!=""&&widget.dictionaryItem.audio5!=null){
                            print("4");
                            await Future.delayed(const Duration(milliseconds: 800));
                           player4.play(UrlSource(
                                widget.dictionaryItem.audio5));
                          }

                          if (widget.dictionaryItem.audio6!=""&&widget.dictionaryItem.audio6!=null){
                            print("5");
                            await Future.delayed(const Duration(milliseconds: 800));
                            player5.play(UrlSource(
                                widget.dictionaryItem.audio6));
                          }

                          if (widget.dictionaryItem.audio7!=""&&widget.dictionaryItem.audio7!=null){
                            print("6");
                            await Future.delayed(const Duration(milliseconds: 800));
                            player6.play(UrlSource(
                                widget.dictionaryItem.audio7));
                          }
                          if (widget.dictionaryItem.audio8!=""&&widget.dictionaryItem.audio8!=null){
                            await Future.delayed(const Duration(milliseconds: 800));
                            player7.play(UrlSource(
                                widget.dictionaryItem.audio8));
                          }
                          if (widget.dictionaryItem.audio9!=""&&widget.dictionaryItem.audio9!=null){
                            await Future.delayed(const Duration(milliseconds: 800));
                            player8.play(UrlSource(
                                widget.dictionaryItem.audio9));
                          }
                          if (widget.dictionaryItem.audio10!=""&&widget.dictionaryItem.audio10!=null){
                            await Future.delayed(const Duration(milliseconds: 800));
                            player9.play(UrlSource(
                                widget.dictionaryItem.audio10));
                          }
                          setState((){colorvolume = Colors.black;});
                          // if (voiceTimes==false) EasyLoading.dismiss();
                          // if (voiceTimes==false) voiceTimes=true;
                        },
                        child:Icon(Icons.volume_up, color: colorvolume, size:30.h)),


                    ///区切り線
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width*0.7,
                      color: Colors.grey,
                    ),

                    ///日本語訳
                    Text(
                      widget.dictionaryItem.japanese
                    )

                  ],
                ),
              ),



            ]
          )
        ),


        /// ドロップダウン
        SizedBox(
          height: MediaQuery.of(context).size.height*0.3,
          child: SingleChildScrollView(
            child: Column(
              children: [

                ///ドロップダウン備考
                if(widget.dictionaryItem.note1!= ""|| widget.dictionaryItem.note2!= ""||widget.dictionaryItem.yale!= "")
                  CustomBoard(
                  title:  Column(
              children: [
                Text(widget.dictionaryItem.category, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Text(widget.dictionaryItem.type)
              ],
          ),
                  color: Color.fromRGBO(239, 239, 239, 1),
                  contents: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.dictionaryItem.note1, ),
                        SizedBox(height: 10),
                        Text(widget.dictionaryItem.note2,),
                        SizedBox(height: 10),
                        Text("Yale: ${widget.dictionaryItem.yale}", )
                      ],
                    ),
                  ), expanded: expanded1,
                  expansionFunc: (panelIndex, isExpanded){
                    setState((){expanded1 = (expanded1) ?  false: true;

                    });
                  },
                ),


                /// どろっぽだうん関連語彙
                if(widget.dictionaryItem.vocabulary!="")
                  CustomBoard(
                    title:  Column(
                      children: [
                        Text("関連語彙", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                    color: Color.fromRGBO(239, 239, 239, 1),
                    contents: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.dictionaryItem.vocabulary, ),
                        ],
                      ),
                    ), expanded: expanded1,
                    expansionFunc: (panelIndex, isExpanded){
                      setState((){expanded1 = (expanded1) ?  false: true;

                      });
                    },
                  ),
  ],
            ),
          ),
        ),
            ],
        ),
      ),
    );
  }
}

class TextWithPad extends StatelessWidget {
  const TextWithPad({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: content,
    );
  }
}

class CustromTitle extends StatelessWidget {
  String title;
  CustromTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 8.h),
      child: Text(title, textAlign: TextAlign.center,style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.bold)),
    );
  }
}

class CustomBoard extends StatelessWidget {
  void Function(int, bool) expansionFunc;
  Widget contents;
  Color color;
  bool expanded;
  Widget title;
  CustomBoard({required this.title,required this.expanded,
    required this.expansionFunc,required this.color, required this. contents, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45, //色
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
          color: color,
        ),
        child: ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.zero,
          animationDuration: Duration(milliseconds: 1000),
          children: [ExpansionPanel(
            backgroundColor: color,
            isExpanded: expanded,
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return title;
            },
            body: Container(
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45, //色
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(1, 1),
                  ),
                ],
                color: color,

              ),
              child: contents,
            ),

          )],
    dividerColor: Colors.grey,
    expansionCallback: expansionFunc,
        ),
      ),
    );
  }
}
