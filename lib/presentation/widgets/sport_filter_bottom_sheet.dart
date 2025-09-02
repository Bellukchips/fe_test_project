import 'package:fe_test_project/utils/color_assets.dart';
import 'package:flutter/material.dart';

import 'button_custom.dart';

class SportFilterBottomSheet extends StatefulWidget {
  const SportFilterBottomSheet({super.key});

  @override
  State<SportFilterBottomSheet> createState() => _SportFilterBottomSheetState();
}

class _SportFilterBottomSheetState extends State<SportFilterBottomSheet> {
  String? selectedSport;

  final List<Map<String, dynamic>> preferenceSports = [
    {"icon": Icons.sports_tennis, "label": "Badminton"},
    {"icon": Icons.sports, "label": "Squash"},
    {"icon": Icons.sports, "label": "Padel"},
    {"icon": Icons.sports_soccer, "label": "Mini Soccer"},
  ];

  final List<Map<String, dynamic>> allSports = [
    {"icon": Icons.sports_baseball, "label": "Tenis Meja"},
    {"icon": Icons.sports_tennis, "label": "Tenis"},
    {"icon": Icons.sports, "label": "Pickleball"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: ColorAssets.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Cabang Olahraga",
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

            _buildSectionHeader("Preferensi Olahragamu"),
            ...preferenceSports.map((sport) => _buildRadioItem(sport)),

            _buildSectionHeader("Semua Olahraga"),
            ...allSports.map((sport) => _buildRadioItem(sport)),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonCustom(
                height: 50,
                width: double.infinity,
                isEnable: selectedSport != null,
                onTap: () {
                  if (selectedSport != null) {
                    Navigator.pop(context, selectedSport);
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

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildRadioItem(Map<String, dynamic> sport) {
    return RadioListTile<String>(
      value: sport["label"],
      groupValue: selectedSport,
      activeColor: ColorAssets.primaryColor,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Row(
        children: [
          Icon(sport["icon"], size: 20, color: Colors.black54),
          const SizedBox(width: 12),
          Text(sport["label"]),
        ],
      ),
      onChanged: (val) {
        setState(() {
          selectedSport = val;
        });
      },
    );
  }
}
