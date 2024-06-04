import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.isLeft,
    required this.child,
  }) : super(key: key);
  final double height;
  final double width;
  final bool isLeft;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: child,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black45, //色
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(1, 1),
          ),
        ],
        borderRadius:
        (isLeft)?BorderRadius.horizontal(
          right: Radius.circular(20),
        ):BorderRadius.horizontal(
          left: Radius.circular(20),
        ) ,
        color: Color.fromRGBO(234, 240, 247, 1),
      ),
      height: height,
      width: width*0.47,
    );
  }
}

class LanguageTitle extends StatelessWidget {

  const LanguageTitle({
    required this. kanji,
    required this.alphabet,
    Key? key,
  }) : super(key: key);
  final String kanji;
  final String alphabet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(children: [
        Center(child: Text(kanji, textAlign: TextAlign.center,style:
        TextStyle(
            fontSize: 45.h,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic
        ),)),
        SizedBox(
          height: 60.h,
          child: Center(
            child: Text(alphabet,textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.h,
                  color: Colors.grey),),
          ),
        )
      ]),
    );
  }
}

class SearchTextField extends StatelessWidget {
  String label;
  TextEditingController editController;
  void Function(String)? onChangedFunc;
  double height;
  double fontSize;

  SearchTextField({
    required this.fontSize,
    required this.height,
    required this.onChangedFunc,
    required this.editController,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.h),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
               spreadRadius: 0,
               blurRadius: 1,
               color: Colors.grey,
               offset: Offset(1, 0),
            ),
          ],
        ),
        child: TextField(
          style: TextStyle(
              fontSize: 18.sp),
          cursorColor: Colors.brown,
          textAlignVertical: TextAlignVertical.center,
          controller: editController,
          onChanged: onChangedFunc,
          decoration: InputDecoration(

              labelStyle: TextStyle(

                color: Colors.black38,
                fontSize: 13.h,
              ),
              // focusColor: Colors.black54,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black54,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black87,
                ),
              ),

              fillColor: Colors.white,
              filled: true,
              contentPadding: (height >= 100) ? EdgeInsets.fromLTRB(
                  10.h, 18.h, 10.h, 18.h) : EdgeInsets.fromLTRB(
                  10.h, 5.h, 10.h, 0),
              labelText: label,
              border: OutlineInputBorder(

                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              )
          ),

        ),
      ),
    );
  }

}
