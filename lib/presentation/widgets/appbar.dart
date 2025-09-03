import 'package:fe_test_project/applications/cubit/filter_cubit.dart';
import 'package:fe_test_project/presentation/widgets/point_settings_bottom_sheet.dart';
import 'package:fe_test_project/utils/assets_image.dart';
import 'package:fe_test_project/utils/color_assets.dart';
import 'package:fe_test_project/utils/dummy/dummy.dart';
import 'package:flutter/material.dart';
import 'package:fe_test_project/presentation/widgets/period_filter_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBarCustom extends StatefulWidget {
  final bool isPrevious;
  const AppBarCustom({super.key, this.isPrevious = false});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit,FilterCubitState>(
      builder: (context,state) {
        final players = DummyData.getRankingPlayers().where((p) {
          final matchPeriod =
              state.period == null || p.period == state.period;
          return  matchPeriod;
        }).toList();

        return Container(
              height: 50,
              decoration: BoxDecoration(
                color: ColorAssets.primaryColor
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ?widget.isPrevious ? Icon(Icons.arrow_back_ios_new_outlined,color: ColorAssets.whiteColor,) : null,
              Row(
                children: [
                  Text(state.period?.toUpperCase() ?? "Period" , style: TextStyle(color: ColorAssets.whiteColor,fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                      onTap: () => _showPeriodFilterBottomSheet(context),
                      child: Image.asset(AssetsImages.get(AssetsImages.play)))
                ],
              ),
              GestureDetector(
                  onTap:() => _showPointSettingsBottomSheet(context),
                  child: Image.asset(AssetsImages.get(AssetsImages.howItWorks),scale: 3.5,))
            ],
          ),
        );
      }
    );
  }

  void _showPointSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const PointSettingsBottomSheet(),
    );
  }

  void _showPeriodFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorAssets.whiteColor,
      isScrollControlled: true,
      builder: (context) => const PeriodFilterBottomSheet(),
    );
  }
}
