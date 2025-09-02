import 'package:fe_test_project/presentation/components/dash_divider.dart';
import 'package:flutter/material.dart';
import 'package:fe_test_project/utils/color_assets.dart';

class PointSettingsBottomSheet extends StatefulWidget {
  const PointSettingsBottomSheet({super.key});

  @override
  State<PointSettingsBottomSheet> createState() => _PointSettingsBottomSheetState();
}

class _PointSettingsBottomSheetState extends State<PointSettingsBottomSheet> {
  Map<String, int> matchResults = {
    'Menang': 100,
    'Draw': 50,
    'Kalah': 30,
  };

  Map<String, double> bonusPoints = {
    'Bonus Kemenangan': 6.5,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: ColorAssets.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                 Expanded(
                  child: Text(
                    'Cara Mendapatkan Point',
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

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Kamu harus menyelesaikan pertandingan untuk dapat mendapatkan point.',
              style: TextStyle(
                color: ColorAssets.blackColor,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Hasil Pertandingan',
              style: TextStyle(
                color: ColorAssets.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xD7D7D7FF)),
                borderRadius: BorderRadius.circular(15)
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPointItem(
                    'Menang',
                    matchResults['Menang']!,
                    ColorAssets.greenColor,
                    onChanged: (value) {
                      setState(() {
                        matchResults['Menang'] = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  generateDashedDivider(MediaQuery.sizeOf(context).width - 2 * 48),
                  const SizedBox(height: 12),
                  _buildPointItem(
                    'Draw',
                    matchResults['Draw']!,
                    Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        matchResults['Draw'] = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  generateDashedDivider(MediaQuery.sizeOf(context).width - 2 * 48),
                  const SizedBox(height: 12),
                  _buildPointItem(
                    'Kalah',
                    matchResults['Kalah']!,
                    ColorAssets.redColor,
                    onChanged: (value) {
                      setState(() {
                        matchResults['Kalah'] = value;
                      });
                    },
                  ),

                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Bonus Point',
                  style: TextStyle(
                    color: ColorAssets.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xD7D7D7FF)),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  padding: const EdgeInsets.all(15),
                  child: _buildBonusPointItem(
                    'Bonus Kemenangan',
                    bonusPoints['Bonus Kemenangan']!,
                    'Point (x) didapatkan berdasarkan selisih peringkat dengan lawan di leaderboard. Nilai point maksimum yang dapat ditambahkan adalah 20 Pts',
                    onChanged: (value) {
                      setState(() {
                        bonusPoints['Bonus Kemenangan'] = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildPointItem(String title, int points, Color color, {required Function(int) onChanged}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style:  TextStyle(
              color: ColorAssets.blackColor,
              fontSize: 14,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _showPointEditDialog(context, title, points, onChanged),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color, width: 1),
            ),
            child: Text(
              '+$points Pts',
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBonusPointItem(String title, double multiplier, String description, {required Function(double) onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style:  TextStyle(
                  color: ColorAssets.blackColor,
                  fontSize: 14,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _showBonusEditDialog(context, title, multiplier, onChanged),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: ColorAssets.greenColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.green, width: 1),
                ),
                child: Text(
                  '+${multiplier}x Pts',
                  style:  TextStyle(
                    color: ColorAssets.greenColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  void _showPointEditDialog(BuildContext context, String title, int currentValue, Function(int) onChanged) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF374151),
        title: Text(
          'Edit $title Points',
          style: const TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Current: $currentValue Pts',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [10, 30, 50, 100].map((value) =>
                  ElevatedButton(
                    onPressed: () {
                      onChanged(value);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentValue == value
                          ? ColorAssets.primaryColor
                          : Colors.grey,
                    ),
                    child: Text('$value'),
                  ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showBonusEditDialog(BuildContext context, String title, double currentValue, Function(double) onChanged) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF374151),
        title: Text(
          'Edit $title Multiplier',
          style: const TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Current: ${currentValue}x',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [2.0, 5.0, 6.5, 10.0].map((value) =>
                  ElevatedButton(
                    onPressed: () {
                      onChanged(value);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentValue == value
                          ? ColorAssets.primaryColor
                          : Colors.grey,
                    ),
                    child: Text('${value}x'),
                  ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}