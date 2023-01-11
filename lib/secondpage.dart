import 'package:dictionary/parameters.dart';
import 'package:just_audio/just_audio.dart';
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
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.height *0.07,
                child: ListView.builder(
                  itemCount: widget.dictionaryItem.chinese.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width:  MediaQuery.of(context).size.width*0.7/widget.dictionaryItem.chinese.length,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          FittedBox(child: SelectableText(widget.dictionaryItem.chinese[index],maxLines: 1,style: TextStyle(fontSize: 37.h),)),
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
              width: MediaQuery.of(context).size.width*0.7,
              height: MediaQuery.of(context).size.height *0.06,
              child: ListView.builder(
                  itemCount: widget.dictionaryItem.jyutping.split(' ').length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    return Container(
                      width:  MediaQuery.of(context).size.width*0.7/widget.dictionaryItem.jyutping.split(' ').length,
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            FittedBox(child: SelectableText(widget.dictionaryItem.catOnknees.split(' ')[index], maxLines: 1)),
                            
                            FittedBox(child: SelectableText(widget.dictionaryItem.jyutping.split(' ')[index], maxLines: 1)),

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

               Column(
                 children: [
                   ///スピーカー
                   (widget.dictionaryItem.voiceData== "Y")?TextButton(
                       style: ButtonStyle(
                         // backgroundColor: MaterialStateProperty.all(Colors.yellow),
                           alignment: Alignment.topCenter,
                           overlayColor: MaterialStateProperty.all(Colors.white,)
                       ),
                       onPressed: ()async{
                         // if (voiceTimes==false) EasyLoading.show(status: "音声読み込み中");
                         setState((){colorvolume = Colors.grey;});
                         await player.setUrl(widget.dictionaryItem.audio1);
                         if (widget.dictionaryItem.audio2!=""&&widget.dictionaryItem.audio2!=null){
                           await player1.setUrl(
                               widget.dictionaryItem.audio2);
                         }
                         if (widget.dictionaryItem.audio3!=""&&widget.dictionaryItem.audio3!=null){
                           await player2.setUrl(
                               widget.dictionaryItem.audio3);
                         }

                         if (widget.dictionaryItem.audio4!=""&&widget.dictionaryItem.audio4!=null){
                           await player3.setUrl(
                               widget.dictionaryItem.audio4);
                         }
                         if (widget.dictionaryItem.audio5!=""&&widget.dictionaryItem.audio5!=null){
                           await player4.setUrl(
                               widget.dictionaryItem.audio5);
                         }
                         if (widget.dictionaryItem.audio6!=""&&widget.dictionaryItem.audio6!=null){
                           await player5.setUrl(
                               widget.dictionaryItem.audio6);
                         }

                         if (widget.dictionaryItem.audio7!=""&&widget.dictionaryItem.audio7!=null){
                           await player6.setUrl(
                               widget.dictionaryItem.audio7);
                         }
                         if (widget.dictionaryItem.audio8!=""&&widget.dictionaryItem.audio8!=null){
                           await player7.setUrl(
                               widget.dictionaryItem.audio8);
                         }

                         if (widget.dictionaryItem.audio9!=""&&widget.dictionaryItem.audio9!=null){
                           await player8.setUrl(
                               widget.dictionaryItem.audio9);
                         }

                         player.play();
                         if (widget.dictionaryItem.audio2!=""&&widget.dictionaryItem.audio2!=null){
                           await Future.delayed(Duration(milliseconds: soundDelay));
                           player1.play();
                         }

                         if (widget.dictionaryItem.audio3!=""&&widget.dictionaryItem.audio3!=null){
                           print("2");
                           await Future.delayed(Duration(milliseconds: soundDelay));
                           player2.play();
                         }

                         if (widget.dictionaryItem.audio4!=""&&widget.dictionaryItem.audio4!=null){
                           print("3");
                           await Future.delayed(Duration(milliseconds: soundDelay));
                          player3.play();
                         }
                         if (widget.dictionaryItem.audio5!=""&&widget.dictionaryItem.audio5!=null){
                           await Future.delayed(Duration(milliseconds: soundDelay));
                           player4.play();
                         }

                         if (widget.dictionaryItem.audio6!=""&&widget.dictionaryItem.audio6!=null){
                           print("2");
                           await Future.delayed(Duration(milliseconds: soundDelay));
                           player5.play();
                         }

                         if (widget.dictionaryItem.audio7!=""&&widget.dictionaryItem.audio7!=null){
                           print("3");
                           await Future.delayed(Duration(milliseconds: soundDelay));
                           player6.play();
                         }
                         if (widget.dictionaryItem.audio8!=""&&widget.dictionaryItem.audio8!=null){
                           print("2");
                           await Future.delayed(Duration(milliseconds: soundDelay));
                           player7.play();
                         }

                         if (widget.dictionaryItem.audio9!=""&&widget.dictionaryItem.audio9!=null){
                           print("3");
                           await Future.delayed(Duration(milliseconds: soundDelay));
                           player8.play();
                         }


                         //
                         // if (widget.dictionaryItem.audio5!=""&&widget.dictionaryItem.audio5!=null){
                         //   print("4");
                         //   await Future.delayed(const Duration(milliseconds: 800));
                         //  player4.play(UrlSource(
                         //       widget.dictionaryItem.audio5));
                         // }
                         //
                         // if (widget.dictionaryItem.audio6!=""&&widget.dictionaryItem.audio6!=null){
                         //   print("5");
                         //   await Future.delayed(const Duration(milliseconds: 800));
                         //   player5.play(UrlSource(
                         //       widget.dictionaryItem.audio6));
                         // }
                         //
                         // if (widget.dictionaryItem.audio7!=""&&widget.dictionaryItem.audio7!=null){
                         //   print("6");
                         //   await Future.delayed(const Duration(milliseconds: 800));
                         //   player6.play(UrlSource(
                         //       widget.dictionaryItem.audio7));
                         // }
                         // if (widget.dictionaryItem.audio8!=""&&widget.dictionaryItem.audio8!=null){
                         //   await Future.delayed(const Duration(milliseconds: 800));
                         //   player7.play(UrlSource(
                         //       widget.dictionaryItem.audio8));
                         // }
                         // if (widget.dictionaryItem.audio9!=""&&widget.dictionaryItem.audio9!=null){
                         //   await Future.delayed(const Duration(milliseconds: 800));
                         //   player8.play(UrlSource(
                         //       widget.dictionaryItem.audio9));
                         // }
                         // if (widget.dictionaryItem.audio10!=""&&widget.dictionaryItem.audio10!=null){
                         //   await Future.delayed(const Duration(milliseconds: 800));
                         //   player9.play(UrlSource(
                         //       widget.dictionaryItem.audio10));
                         // }
                         setState((){colorvolume = Colors.black;});
                         // if (voiceTimes==false) EasyLoading.dismiss();
                         // if (voiceTimes==false) voiceTimes=true;
                       },
                       child:Icon(Icons.volume_up, color: colorvolume, size:30.h)):SizedBox(height: 50.h),


                   ///区切り線
                   Container(
                     height: 1,
                     width: MediaQuery.of(context).size.width*0.7,
                     color: Colors.grey,
                   ),

                   ///日本語訳
                   Container(
                     alignment: Alignment.center,
                       width: MediaQuery.of(context).size.width*0.75,
                     padding: EdgeInsets.all(5),
                     child: SelectableText(
                       widget.dictionaryItem.japanese
                     ),
                   )

                 ],
               ),



            ]
          )
        ),


        /// ドロップダウン
        Container(

          height: MediaQuery.of(context).size.height*0.5,
          child: SingleChildScrollView(
            child: Column(
              children: [

                ///ドロップダウン備考
                if(widget.dictionaryItem.note1!= ""|| widget.dictionaryItem.note2!= ""||widget.dictionaryItem.yale!= "")
                  CustomBoard(
                  title:  Column(
              children: [
                SelectableText(widget.dictionaryItem.category, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SelectableText(widget.dictionaryItem.type)
              ],
          ),
                  color: Color.fromRGBO(239, 239, 239, 1),
                  contents: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(widget.dictionaryItem.note1 != "")SelectableText(widget.dictionaryItem.note1, ),
                        if(widget.dictionaryItem.note1 != "")SizedBox(height: 30.h),
                        if(widget.dictionaryItem.note2 != "")SelectableText(widget.dictionaryItem.note2,),
                        if(widget.dictionaryItem.note2 != "")SizedBox(height: 30.h),
                        SelectableText("Yale: ${widget.dictionaryItem.yale}", )
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
                        SelectableText("関連語彙・例文", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                    color: Color.fromRGBO(239, 239, 239, 1),
                    contents: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(widget.dictionaryItem.vocabulary, ),
                        ],
                      ),
                    ), expanded: expanded2,
                    expansionFunc: (panelIndex, isExpanded){
                      setState((){expanded2 = (expanded2) ?  false: true;

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
      child: SelectableText(title, textAlign: TextAlign.center,style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.bold)),
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
