
import 'dart:convert';

import 'package:assesment_project/constant/app_sizes.dart';
import 'package:assesment_project/constant/assets_constants.dart';
import 'package:assesment_project/feature/explore/data/explore_provider.dart';
import 'package:assesment_project/feature/explore/data/model/block_transaction_model.dart';
import 'package:assesment_project/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../res/app_color.dart';

class TransactionHistory extends ConsumerStatefulWidget {
  String coin;
  TransactionHistory(this.coin, {super.key});

  @override
  ConsumerState<TransactionHistory> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends ConsumerState<TransactionHistory> {

  @override
  Widget build(BuildContext context) {
    final exploreState = ref.watch(exploreProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AssetConstants.backIcon), // Replace with your desired icon
          onPressed: () => Navigator.pop(context), // Handle back button press
        ),
        title:   Text('BTC transactions',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.black),),
        // App bar content (title, icon, etc.) based on the design
      ),
      body: exploreState.when(data: (data) => ListView.builder(
        itemCount: data.transactions.length,
        itemBuilder: (context, index) => transactionContainer(context, index, data.transactions)
      ),
          error: (error, _) => Center(child: Text('Error: $error')),
    loading: ()=>  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
          children: [
            SpinKitFadingCircle(
              size: 80, color: AppColor.primaryColor,
            ),
            Text('Fetching your ${widget.coin} transactions')
          ],
        ),
      ),
    )),
    );
  }

  Widget transactionContainer(BuildContext context, int index, List<Tx> data) {
    final transaction = data[index];
    String jsonData = jsonEncode(transaction);

    return
      InkWell(
        onTap: (){
          print(jsonData);
          context.goNamed(AppRoute.transactionDetail.name, pathParameters: {"detail":jsonData});
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(transaction.hash, overflow: TextOverflow.ellipsis,maxLines: 1,)),
                gapW8,
                InkWell(
                  onTap: (){

                    print(jsonData);
                    context.goNamed(AppRoute.transactionDetail.name, queryParameters: {"detail":jsonData});
                  },
                    child: SvgPicture.asset(AssetConstants.forwardIcon))
              ],
            ),
            Row(children: [
              Text(transaction.time.toString(),style: TextStyle(color: AppColor.grey,
                  fontWeight: FontWeight.w400, fontSize: 12),),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 4.0, // Adjust size as needed
                height: 4.0, // Adjust size as needed
                decoration: BoxDecoration(
                  color: AppColor.grey, // Change color as desired
                  shape: BoxShape.circle,
                ),
              ),
              Text(transaction.time.toString(),style: TextStyle(color: AppColor.grey,
                  fontWeight: FontWeight.w400, fontSize: 12),)
            ],),
            gapH10,
            Container(
              height: 1,
              color: AppColor.borderColor,
            ),

            gapH10,
          ],
        ),
      );
  }

}