import 'package:bookly/core/utils/function/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class SaerchResultListView extends StatelessWidget {
  const SaerchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, intext) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          // child: BestSallerListViewItem(),
          child: GestureDetector(
            onTap: (){
              customSnackBar(context, "khadijhe hassoun");
            },
            child: Text("data"))
          ,
        );
      },
    );
  }
}
