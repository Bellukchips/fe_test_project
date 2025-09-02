import 'package:fe_test_project/presentation/widgets/button_custom.dart';
import 'package:fe_test_project/utils/color_assets.dart';
import 'package:flutter/material.dart';

class PeriodFilterBottomSheet extends StatefulWidget {
  const PeriodFilterBottomSheet({super.key});

  @override
  State<PeriodFilterBottomSheet> createState() => _PeriodFilterBottomSheetState();
}

class _PeriodFilterBottomSheetState extends State<PeriodFilterBottomSheet> {
  String selectedPeriod = "all";
  final int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorAssets.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Period',
                    style: TextStyle(
                      color: ColorAssets.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          _radioSelect(
            context,
            title: "All Time ($currentYear)",
            value: "all",
            subtitle: ""
          ),
          _radioSelect(
            context,
            title: "Februari - Maret 2025",
            value: "season",
            subtitle: "Current Season "
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonCustom(
              height: 50,
              width: double.maxFinite,
              isEnable: true,
              onTap: () {
                Navigator.pop(context, selectedPeriod);
              },
              isLoading: false,
              text: "Terapkan",
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Custom Radio Widget
  Widget _radioSelect(
      BuildContext context, {
        required String title,
        required String value,
        required String subtitle
      }) {
    return RadioListTile<String>(
      value: value,
      groupValue: selectedPeriod,
      activeColor: ColorAssets.primaryColor,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        title,
        style: TextStyle(color: ColorAssets.blackColor),
      ),
      subtitle: Text(subtitle, style: TextStyle(color: ColorAssets.blackColor),),
      onChanged: (val) {
        setState(() {
          selectedPeriod = val!;
        });
      },
    );
  }
}
