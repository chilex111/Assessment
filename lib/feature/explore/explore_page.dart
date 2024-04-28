
import 'package:assesment_project/constant/app_sizes.dart';
import 'package:assesment_project/constant/assets_constants.dart';
import 'package:assesment_project/constant/string_constants.dart';
import 'package:assesment_project/res/app_color.dart';
import 'package:assesment_project/routing/route_paths.dart';
import 'package:assesment_project/widget/fu_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils/dummies.dart';

final isTextVisibleProvider = StateProvider<bool>((ref) => true);

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final isVisible = ref.watch(isTextVisibleProvider);

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(child: Text('Explore', textAlign: TextAlign.center,)),
          leading: IconButton(icon: SvgPicture.asset(AssetConstants.scanIcon),
            onPressed: () {  },
            iconSize: 24,),
          actions: [
            IconButton(onPressed: (){},
                icon: SvgPicture.asset(AssetConstants.searchIcon)),
            gapW4,
            IconButton(onPressed: (){},
                icon: SvgPicture.asset(AssetConstants.notifyIcon)),
          ],
        ),
        body: SingleChildScrollView(
          // Allow scrolling for long content
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('My balance'),
                    IconButton(onPressed: (){
                      ref.read(isTextVisibleProvider.notifier).update((state) => !state);
                    },
                        icon: SvgPicture.asset(AssetConstants.eyeIcon))
                  ],
                ),

                Text(isVisible?"₦5,000.00": "...", style: const TextStyle(
                  fontSize: 32,
                    fontWeight: FontWeight.w700),),
                gapH5,
                Container(
                  height: 2,
                  color: AppColor.borderColor,
                ),
                gapH5, // Add spacing
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     const Text('My assets', style: TextStyle(
                        fontWeight: FontWeight.w700)),
                     TextButton(onPressed: (){},
                         child: Text("See all", style: TextStyle(color: AppColor.primaryColor),))
                   ],
                 ),
                gapH4, // Add spacing
                SizedBox(
                  height: 175,
                  child: ListView.builder(
                    shrinkWrap: true, // Prevent excessive scrolling
                    primary: false,
                    itemCount: cryptoData.length, // Assuming 3 assets
                    itemBuilder: (context, index) {
                      final currentItem = cryptoData[index];
                      return  myAssetCrypto(context, currentItem);
                    },
                  ) ,
                ),
                gapH8,
                Container(
                  height: 2,
                  color: AppColor.borderColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text('Today\'s Top Movers', style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16)),
                    TextButton(onPressed: (){},
                        child: Text("See all", style: TextStyle(color: AppColor.primaryColor),))
                  ],
                ),
                const SizedBox(height: 8.0), // Add spacing
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    itemCount: topCryptoData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final currentItem = topCryptoData[index];
                      return topMoverContainer(currentItem);
                    },
                  ),
                ),
                gapH20,
                Container(
                  height: 2,
                  color: AppColor.borderColor,
                ),
                const SizedBox(height: 16.0), // Add spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text('Trending news', style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16)),
                    TextButton(onPressed: (){},
                        child: Text("View more",
                          style: TextStyle(color: AppColor.primaryColor, fontSize: 14, fontWeight: FontWeight.w600),))
                  ],
                ),
                const SizedBox(height: 8.0), // Add spacing
                ListView.builder(
                  primary: false,
                  shrinkWrap: true, // Prevent excessive scrolling
                  itemCount: newsData.length, // Assuming 3 assets
                  itemBuilder: (context, index) {
                    final currentItem = newsData[index];
                    return  index == 0? firstNewsContainer(currentItem):newsContainer(currentItem);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget topMoverContainer(Map<String, dynamic> currentItem) {
    double priceChange = currentItem['price'] - currentItem['previous_price'];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 127,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderColor, width: 1),
        borderRadius: BorderRadius.circular(8), // Remove default corner radius
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FUImage.svgImage(assetStringOrUrl: currentItem['icon']),
          gapH8,
          Text(currentItem['name'] ?? 'Unknown',
            style: TextStyle(fontSize: 16, color: AppColor.black),),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(priceChange > 0 ? AssetConstants.greenArrowIcon : AssetConstants.redArrowIcon),
                Text('${currentItem['change']?.toString()}%',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: priceChange > 0?AppColor.primaryColor: AppColor.errorColor),),
              ],
            ),
          ),
        ],
      ) ,
    );
  }

  Widget myAssetCrypto(BuildContext context, Map<String, dynamic> currentItem) {
    double priceChange = currentItem['price'] - currentItem['previous_price'];
    return GestureDetector(
      onTap: (){
        if(currentItem['name'] =="Bitcoin"){
          context.goNamed(AppRoute.transactionHistory.name);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            FUImage.svgImage(assetStringOrUrl: currentItem['icon']),
            gapW8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentItem['name'] ?? 'Unknown',
                  style: TextStyle(fontSize: 16, color: AppColor.black),),
                Text(currentItem['short_name'] ?? 'Unknown',
                  style: TextStyle(fontSize: 14, color: AppColor.grey),),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('₦${currentItem['price']}', style: TextStyle(color: AppColor.tertiaryBlack),),
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(priceChange > 0 ? AssetConstants.greenArrowIcon : AssetConstants.redArrowIcon),
                      Text('${currentItem['change']?.toString()}%',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: priceChange > 0?AppColor.primaryColor: AppColor.errorColor),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget newsContainer(Map<String, dynamic> currentItem) {
    String time = convertTimestampToUnit(currentItem['created_at']);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FUImage.image(
                  assetStringOrUrl: currentItem['image'],width: 55, height: 73),
              gapW16,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentItem['title'], style: TextStyle(color: AppColor.black,
                        fontWeight: FontWeight.w400),),
                    Row(children: [
                      Text(currentItem['source'],style: TextStyle(color: AppColor.grey,
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
                      Text(time,style: TextStyle(color: AppColor.grey,
                          fontWeight: FontWeight.w400, fontSize: 12),)
                    ],),

                  ],
                ),
              )
            ],
          ),
          gapH20,
          Container(
            height: 1,
            color: AppColor.borderColor,
          ),
        ],
      ),
    );
  }

  Widget firstNewsContainer(Map<String, dynamic> currentItem) {
    String time = convertTimestampToUnit(currentItem['created_at']);
    return Column(
      children: [
        FUImage.image(assetStringOrUrl: currentItem['image']),
        gapH8,
        Text(currentItem['title'], style: TextStyle(color: AppColor.black
        ),),
        Row(children: [
          Text(currentItem['source'],style: TextStyle(color: AppColor.grey,
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
          Text(time, style: TextStyle(color: AppColor.grey,
              fontWeight: FontWeight.w400, fontSize: 12))
        ],),
        gapH10,
        Container(
          height: 1,
          color: AppColor.borderColor,
        ),
        gapH8,
      ],
    );
  }
}

