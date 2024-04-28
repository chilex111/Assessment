import 'dart:convert';

import 'package:assesment_project/feature/explore/data/model/block_transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/app_sizes.dart';
import '../../constant/assets_constants.dart';
import '../../constant/string_constants.dart';
import '../../res/app_color.dart';

class TransactionDetail extends StatelessWidget {
  final String jsonData;

  const TransactionDetail({super.key, required this.jsonData});

  @override
  Widget build(BuildContext context) {
    final data = Tx.fromJson(jsonDecode(jsonData));
    String time  = convertLongDateToString(data.time);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AssetConstants.backIcon), // Replace with your desired icon
          onPressed: () => Navigator.pop(context), // Handle back button press
        ),
        title:   Text('Transaction details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.black),),
        // App bar content (title, icon, etc.) based on the design
      ),
      body: Column(
        children: [
          detailContainer("Hash", data.hash),
          gapView(),
          detailContainer("Time",time),
          gapView(),
          detailContainer("Size", data.size.toString()),
          gapView(),
          detailContainer("Block index", data.blockIndex.toString()),
          gapView(),
          detailContainer("Height", data.blockHeight.toString()),
          gapView(),
          detailContainer("Received time", time),
          gapH24,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              SvgPicture.asset(AssetConstants.externalIcon),
              gapW8,
              const Expanded(child: Text("View on blockchain explorer")),
              SvgPicture.asset(AssetConstants.forwardIcon)
            ],),
          )
        ],
      ),
    );
  }

Widget gapView(){
   return
     Column(
      children: [
        gapH10,
        Container(
          height: 1,
          color: AppColor.black.withOpacity(0.08),
        ),
      ],
    );
}

  Widget detailContainer(String title, String value){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
            Expanded(
              flex: 1,
              child: Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.black.withOpacity(0.6)),),
            ),
            Expanded(
              flex: 2,
                child: Text(value,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.black.withOpacity(0.95))))
          ],),


        ],
      ),
    );
  }
}
