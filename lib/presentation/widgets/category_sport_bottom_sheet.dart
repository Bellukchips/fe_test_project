import 'package:fe_test_project/applications/cubit/filter_cubit.dart';
import 'package:fe_test_project/presentation/widgets/button_custom.dart';
import 'package:fe_test_project/utils/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';

import '../components/dash_divider.dart';

class CategorySportBottomSheet extends StatefulWidget {
  const CategorySportBottomSheet({super.key});

  @override
  State<CategorySportBottomSheet> createState() => _CategorySportBottomSheetState();
}

class _CategorySportBottomSheetState extends State<CategorySportBottomSheet> {
  String? selectedCategory;

  final List<String> categories = ["Tunggal", "Ganda", "Tim"];

  @override
  void initState() {
    super.initState();
    selectedCategory = context.read<FilterCubit>().state.category;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorAssets.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Kategori",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            ...categories.asMap().entries.map((entry) {
              final index = entry.key;
              final cat = entry.value;

              final widgetItem = _radioSelect(
                context,
                title: cat,
                value: cat,
                subtitle: cat,
              );

              if (index != categories.length - 1) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: widgetItem,
                );
              }

              return widgetItem;
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonCustom(
                height: 50,
                width: double.infinity,
                isEnable: selectedCategory != null,
                onTap: () {
                  if (selectedCategory != null) {
                    context.read<FilterCubit>().setCategory(selectedCategory!);
                    Navigator.pop(context);
                  }
                },
                isLoading: false,
                text: "Terapkan",
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
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
