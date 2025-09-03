import 'package:fe_test_project/applications/cubit/filter_cubit.dart';
import 'package:fe_test_project/presentation/widgets/button_custom.dart';
import 'package:fe_test_project/utils/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeriodFilterBottomSheet extends StatelessWidget {
  const PeriodFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedPeriod = context.read<FilterCubit>().state.period;
    final int currentYear = DateTime.now().year;

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

          RadioListTile<String>(
            value: "all",
            groupValue: selectedPeriod,
            activeColor: ColorAssets.primaryColor,
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              "All Time ${currentYear}",
              style: TextStyle(color: ColorAssets.blackColor),
            ),
            onChanged: (val) {
              if (val != null) {
                context.read<FilterCubit>().setPeriod(val);
                Navigator.pop(context);
              }
            },
          ),
          RadioListTile<String>(
            value: "season",
            groupValue: selectedPeriod,
            activeColor: ColorAssets.primaryColor,
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              "Current Season",
              style: TextStyle(color: ColorAssets.blackColor),
            ),
            onChanged: (val) {
              if (val != null) {
                context.read<FilterCubit>().setPeriod(val);
                Navigator.pop(context);
              }
            },
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

}
