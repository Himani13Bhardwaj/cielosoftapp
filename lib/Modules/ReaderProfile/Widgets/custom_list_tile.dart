import 'package:bookatease/Utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../Utils/custom_widget.dart';

class CustomListTile extends StatelessWidget {
  IconData iconData;
  String title;
  Function() onTap;
  CustomListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          onTap: onTap,
          title: CustomWidget.text(title,
              fontWeight: FontWeight.w700,
              color: AppColor.textPrimaryColor,
              textAlign: TextAlign.left,
              fontSize: 12),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          leading: Icon(
            iconData,
            color: AppColor.blackColor,
          ),
        ),
      ),
    );
  }
}
