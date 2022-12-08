
import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dictionary/readData.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
class DictionaryList extends StatefulWidget{
  BuildContext context;
  List<DictionaryModel> dictionaryList;
  ScrollController scrollController;

  // List<MonumentModel>? monumentList2 = MonumentModel.searchMonument3(monumentList, "xx");
  DictionaryList({required this.scrollController,required this.context, required this.dictionaryList});

  @override
  State<DictionaryList> createState() => _DictionaryListState();
}

class _DictionaryListState extends State<DictionaryList> {
  final bgAudio = AudioPlayer();
  final bgAudio1 = AudioPlayer();
  final bgAudio2 = AudioPlayer();
  final bgAudio3 = AudioPlayer();
  final bgAudio4 = AudioPlayer();
  final bgAudio5 = AudioPlayer();
  final bgAudio6 = AudioPlayer();
  final bgAudio7 = AudioPlayer();
  final bgAudio8 = AudioPlayer();
  final bgAudio9 = AudioPlayer();
  final bgAudio10 = AudioPlayer();
  Color colorvolume = Colors.black54;
  Widget? sound;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.dictionaryList.isNotEmpty ? Column(
      children: [
        SizedBox(height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.3,
                color: Colors.grey,
              ),
              Text("全${widget.dictionaryList.length}件", style: TextStyle(fontSize: 13.h),),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.3,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.builder(
            controller:widget.scrollController,

              padding: EdgeInsets.zero,
              itemCount: widget.dictionaryList.length,
              itemBuilder: (context, index) {

//print(monumentList2[index].initial);
                // if (index1== 0){
                //   return Text("全部で${monumentList2.length}件");
                // }
                // else{
                //   int index = index1-1;
                return Card(
                    margin: EdgeInsets.symmetric(horizontal:5.w, vertical: 2.h),
                    color: (index%2 == 0)? Colors.white: Colors.grey.shade100,
                    child: ListTile(
                      onTap: () {
                        // print(widget.dictionaryList[index].chinese.length);
                        showDialog(context: context, builder: (context) {
                          return SecondPage(
                              dictionaryItem: widget.dictionaryList[index]);
                        });
                      },
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: MediaQuery.of(context).size.width *0.5,
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.dictionaryList[index].chinese,

                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          fontSize: 15.h),),
                                    Text(widget.dictionaryList[index].jyutping,
                                      style: TextStyle(
                                          fontSize: 13.h),

                                    ),
                                    Text(widget.dictionaryList[index].catOnknees,
                                      style: TextStyle(
                                          fontSize: 13.h),

                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.dictionaryList[index].japanese,
                                  textAlign: TextAlign.start
                                  ,
                                  style: TextStyle(
                                    fontSize: 13.h,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                           (widget.dictionaryList[index].voiceData == "Y")?SizedBox(
                             width: MediaQuery.of(context).size.width*0.10,
                             child: TextButton(
                                 style: ButtonStyle(
                                     foregroundColor: MaterialStateProperty.all<Color>(colorvolume)
                                 ),
                                 onPressed: ()async {
                                   // print(widget.dictionaryList[index].audio1);
                                   // print(widget.dictionaryList[index].audio2);
                                   // print(widget.dictionaryList[index].audio7);
                                    if (sound==false) EasyLoading.show();
                                         bgAudio.play(UrlSource(
                                             widget.dictionaryList[index].audio1));

                                         if (widget.dictionaryList[index].audio2!=""&&widget.dictionaryList[index].audio2!=null){

                                           await Future.delayed(const Duration(milliseconds: 800));
                                           bgAudio1.play(UrlSource(
                                               widget.dictionaryList[index].audio2));
                                         }

                                    if (widget.dictionaryList[index].audio3!=""&&widget.dictionaryList[index].audio3!=null){
                                      print("2");
                                      await Future.delayed(const Duration(milliseconds: 800));
                                      bgAudio1.play(UrlSource(
                                          widget.dictionaryList[index].audio3));
                                    }

                                    if (widget.dictionaryList[index].audio4!=""&&widget.dictionaryList[index].audio4!=null){
                                      print("3");
                                      await Future.delayed(const Duration(milliseconds: 800));
                                      bgAudio1.play(UrlSource(
                                          widget.dictionaryList[index].audio4));
                                    }

                                    if (widget.dictionaryList[index].audio5!=""&&widget.dictionaryList[index].audio5!=null){
                                      print("4");
                                      await Future.delayed(const Duration(milliseconds: 800));
                                      bgAudio1.play(UrlSource(
                                          widget.dictionaryList[index].audio5));
                                    }

                                    if (widget.dictionaryList[index].audio6!=""&&widget.dictionaryList[index].audio6!=null){
                                      print("5");
                                      await Future.delayed(const Duration(milliseconds: 800));
                                      bgAudio1.play(UrlSource(
                                          widget.dictionaryList[index].audio6));
                                    }

                                    if (widget.dictionaryList[index].audio7!=""&&widget.dictionaryList[index].audio7!=null){
                                      print("6");
                                      await Future.delayed(const Duration(milliseconds: 800));
                                      bgAudio1.play(UrlSource(
                                          widget.dictionaryList[index].audio7));
                                    }
                                    if (widget.dictionaryList[index].audio8!=""&&widget.dictionaryList[index].audio8!=null){
                                      await Future.delayed(const Duration(milliseconds: 800));
                                      bgAudio1.play(UrlSource(
                                          widget.dictionaryList[index].audio8));
                                    }
                                    if (widget.dictionaryList[index].audio9!=""&&widget.dictionaryList[index].audio9!=null){
                                      await Future.delayed(const Duration(milliseconds: 800));
                                      bgAudio1.play(UrlSource(
                                          widget.dictionaryList[index].audio9));
                                    }
                                    if (widget.dictionaryList[index].audio10!=""&&widget.dictionaryList[index].audio10!=null){
                                      await Future.delayed(const Duration(milliseconds: 800));
                                      bgAudio1.play(UrlSource(
                                          widget.dictionaryList[index].audio10));
                                    }
                                   // if (voiceTimes== false)EasyLoading.dismiss();
                                   // if (voiceTimes==false) voiceTimes=true;

                                 },
                                 child: (sound!=null)?sound!: Icon(Icons.volume_up, size: 27.h,)
                             ),
                           ): SizedBox(width: MediaQuery.of(context).size.width*0.10),
                          ],
                        ),
                      ),
                    ));
                // }
              }),
        ),
      ],
    ):
    Container(child: Center(child: Text("Nodata"),),) ;
  }
}




