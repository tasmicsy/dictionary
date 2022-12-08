import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatOnKneesImages extends StatelessWidget {
  const CatOnKneesImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/logostraight.png", height: 40.h,
          // width: MediaQuery
          //               .of(context)
          //               .size
          //               .width * 0.65,
        ),
        SizedBox(
            height: 60.h,
            child: FittedBox(
                child: Text(
                  " 式",
                  style: TextStyle(fontSize: 40.sp),
                ))),
      ],
    );
  }
}
