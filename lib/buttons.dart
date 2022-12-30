import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(

      onPressed: (){
        Share.share(
            """
広東語の発音をひらがな表記に！
iOS版→ https://apple.co/3eJfskB 
Android版→ https://play.google.com/store/apps/details?id=com.catonknees.conversion&hl=ja&gl=US
                            """
        );
      },
      icon: Icon(Icons.ios_share_outlined,),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      showDialog(context: context, builder: (context){
        return SimpleDialog(

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse("https://catonknees.com/privacy-policy-tc/")) ;
              }, child: Text("プライバシーポリシー", style: TextStyle(fontSize: 15.h),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse("https://www.freeprivacypolicy.com/live/fee39dae-6962-4722-a07d-1e71c92801d7"));
              }, child: Text("利用規約", style: TextStyle(fontSize: 15.h),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse('mailto:info@catonknees.com?subject=お問い合せ&body=お問合せ内容を書いてください。'));
              }, child: Text("お問合せ", style: TextStyle(fontSize: 15.h),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse("https://catonknees.com/"));
              }, child: Text("ホームページ", style: TextStyle(fontSize: 15.h),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                Share.share("""
広東語の発音をひらがな表記に！
iOS版→ https://apple.co/3eJfskB 
Android版→ https://play.google.com/store/apps/details?id=com.catonknees.conversion&hl=ja&gl=US
                            """);
              }, child: Text("シェアする", style: TextStyle(fontSize: 15.h),)),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse("https://catonknees.com/DicAppRequest"));
              }, child: Text("単語追加・訂正・その他リクエスト", style: TextStyle(fontSize: 15.h),)),
            ),
          ],

        );
      });
    },

        icon: Icon(Icons.dehaze, ));
  }
}

class ClearButton extends StatelessWidget {
  void Function() onPressedFunc;
  Color color;
  Widget name;
 ClearButton({
    required this.onPressedFunc,
    required this.color,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: ElevatedButton(

        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontWeight: FontWeight.bold)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.grey)
                )
            )
        ),
        onPressed: onPressedFunc,child: SizedBox(
          width:MediaQuery.of(context).size.width*0.1,
          height: MediaQuery.of(context).size.height*0.04,
          child: name),),
    );
  }
}
