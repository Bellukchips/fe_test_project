import 'package:fe_test_project/presentation/components/dash_divider.dart';
import 'package:fe_test_project/utils/color_assets.dart';
import 'package:flutter/material.dart';

class CategorySportBottomSheet extends StatefulWidget {
  const CategorySportBottomSheet({super.key});

  @override
  State<CategorySportBottomSheet> createState() => _CategorySportBottomSheetState();
}

class _CategorySportBottomSheetState extends State<CategorySportBottomSheet> {
  String? selectedCategory = "komunitas";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorAssets.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),

      child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Kategori",
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: generateDashedDivider(MediaQuery.sizeOf(context).width - 2 * 28),
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text("Individu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _radioSelect(context, title: "Tunggal", value: "tunggal", subtitle: ""),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _radioSelect(context, title: "Ganda", value: "ganda", subtitle: ""),
              ),
              _radioSelect(context, title: "Komunitas", value: "komunitas", subtitle: "",size: 18)
            ],
          )
      ),
    );
  }

  Widget _radioSelect(
      BuildContext context, {
        required String title,
        required String value,
        required String subtitle,
        double size = 15
      }) {
    return RadioListTile<String>(
      value: value,
      groupValue: selectedCategory,
      activeColor: ColorAssets.primaryColor,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        title,
        style: TextStyle(color: ColorAssets.blackColor,fontSize: size),
      ),
      subtitle: Text(subtitle, style: TextStyle(color: ColorAssets.blackColor),),
      onChanged: (val) {
        setState(() {
          selectedCategory = val!;
        });
      },
    );
  }
}
