import 'package:fe_test_project/applications/cubit/filter_cubit.dart';
import 'package:fe_test_project/presentation/components/core_screen.dart';
import 'package:fe_test_project/presentation/widgets/appbar.dart';
import 'package:fe_test_project/presentation/widgets/category_sport_bottom_sheet.dart';
import 'package:fe_test_project/presentation/widgets/my_top_card.dart';
import 'package:fe_test_project/presentation/widgets/region_bottom_sheet.dart';
import 'package:fe_test_project/presentation/widgets/sport_filter_bottom_sheet.dart';
import 'package:fe_test_project/presentation/widgets/period_filter_bottom_sheet.dart';
import 'package:fe_test_project/utils/color_assets.dart';
import 'package:fe_test_project/utils/dummy/dummy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterCubitState>(
      builder: (context, state) {
        final players = DummyData.getRankingPlayers().where((p) {
          final matchSport = state.sport == null || p.sport == state.sport;
          final matchCategory =
              state.category == null || p.category == state.category;
          final matchRegion =
              state.region == null || p.region == state.region;
          final matchPeriod =
              state.period == null || p.period == state.period;
          return matchSport && matchCategory && matchRegion && matchPeriod;
        }).toList();

        final podium = players.take(3).toList();

        return CoreScreen(
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      AppBarCustom(isPrevious: true),
                      const SizedBox(height: 20),

                      Row(
                        children: [
                          _filterButton(
                            context,
                            label: state.sport ?? "Sport",
                            onTap: () => _showSportFilterBottomSheet(context),
                          ),
                          _filterButton(
                            context,
                            label: state.category ?? "Category",
                            onTap: () => _showCategoryBottomSheet(context),
                          ),
                          _filterButton(
                            context,
                            label: state.region ?? "Region",
                            onTap: () => _showRegionBottomSheet(context),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                      const MyTopCard(),
                      const SizedBox(height: 20),

                      SizedBox(
                        height: 290,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            podium.length,
                            (i) {
                              final player = podium[i];
                              final rank = i + 1;
                              final heights = [150, 120, 100];
                              return _buildPodiumPlatform(
                                heights[i].toDouble(),
                                rank,
                                ColorAssets.secondaryColor,
                                player.name,
                                "${player.points} ${player.pointsUnit}",
                                highlight: rank == 1,
                                avatar: player.avatar,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                DraggableScrollableSheet(
                  initialChildSize: 0.40,
                  minChildSize: 0.35,
                  maxChildSize: 0.9,
                  builder: (context, controller) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            height: 4,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Leaderboard",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.leaderboard,
                                  color: Colors.grey[600],
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1),

                          Expanded(
                            child: players.isEmpty
                                ? const Center(
                                    child: Text("No data available"),
                                  )
                                : ListView.builder(
                                    controller: controller,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    itemCount: players.length,
                                    itemBuilder: (context, index) {
                                      final user = players[index];
                                      final rank = index + 1;

                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 4,
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[50],
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.grey[200]!,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              rank.toString(),
                                              style: TextStyle(
                                                color: ColorAssets.blackColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundImage:
                                                  NetworkImage(user.avatar),
                                              onBackgroundImageError: (_, __) =>
                                                  const Icon(Icons.person),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    user.name,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    "@${user.name.toLowerCase().replaceAll(' ', '')}",
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "${user.points} ${user.pointsUnit}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Icon(
                                                  rank == 3
                                                      ? Icons.arrow_drop_down
                                                      : Icons.arrow_drop_up,
                                                  color: rank == 3
                                                      ? ColorAssets.redColor
                                                      : ColorAssets.greenColor,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _filterButton(
    BuildContext context, {
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: ColorAssets.whiteColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_sharp, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPodiumPlatform(
    double height,
    int rank,
    Color color,
    String name,
    String points, {
    bool highlight = false,
    required String avatar,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: highlight ? Colors.amber : Colors.white,
              width: 3,
            ),
          ),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(avatar),
            backgroundColor: Colors.grey[300],
            onBackgroundImageError: (_, __) =>
                const Icon(Icons.person, color: Colors.grey),
          ),
        ),
        SizedBox(
          width: 110,
          child: Text(
            name,
            style: TextStyle(
              color: ColorAssets.whiteColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: ColorAssets.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 25,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Text(
            points,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: ColorAssets.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: height,
          width: 110,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "$rank",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ColorAssets.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSportFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const SportFilterBottomSheet(),
    );
  }

  void _showRegionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const RegionBottomSheet(),
    );
  }

  void _showCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CategorySportBottomSheet(),
    );
  }
}
