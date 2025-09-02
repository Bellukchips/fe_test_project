import 'package:fe_test_project/utils/color_assets.dart';
import 'package:flutter/material.dart';


class MyTopCard extends StatefulWidget {
  const MyTopCard({super.key});

  @override
  State<MyTopCard> createState() => _MyTopCardState();
}

class _MyTopCardState extends State<MyTopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: ColorAssets.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: ColorAssets.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorAssets.primaryColor,
                  backgroundImage: NetworkImage("https://placehold.jp/150x150.png"),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Budiman Tanuwijaya", style: TextStyle(fontSize: 12),),
                        Text("Surabaya", style: TextStyle(fontSize: 12,color: Colors.grey),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorAssets.primaryColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  height: 25,
                  padding: const EdgeInsets.all(5),
                  alignment: FractionalOffset.center,
                  child: Text("50 Pts", style: TextStyle(fontSize: 12,color: ColorAssets.whiteColor),),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kamu ada di peringkat #456, bagikan yuk!", style: TextStyle(fontSize: 13, color: ColorAssets.whiteColor),),
                Icon(Icons.share,color: ColorAssets.whiteColor,size: 20,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
