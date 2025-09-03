import 'package:fe_test_project/applications/cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionBottomSheet extends StatefulWidget {
  const RegionBottomSheet({super.key});

  @override
  State<RegionBottomSheet> createState() => _RegionBottomSheetState();
}

class _RegionBottomSheetState extends State<RegionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> popularRegions = [
    "Jakarta",
    "Tangerang",
    "Bekasi",
    "Bogor",
    "Depok",
    "Bandung",
    "Yogyakarta",
    "Surabaya",
    "Malang",
  ];

  final List<String> allRegions = [
    "Bandung",
    "Badung",
    "Bangkalan",
    "Banda Aceh",
    "Bandengan",
    "Bangka",
    "Balikpapan",
    "Banjar",
    "Banjarmasin",
    "Banyuwangi",
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final selectedRegion = context.watch<FilterCubit>().state.region;

    final filteredRegions = allRegions
        .where((region) =>
            region.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pilih Region",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Cari nama kota",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            searchQuery = "";
                            _searchController.clear();
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
              onChanged: (val) {
                setState(() => searchQuery = val);
              },
            ),
            const SizedBox(height: 16),

            if (searchQuery.isEmpty) ...[
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: popularRegions.map((region) {
                  final isSelected = region == selectedRegion;
                  return ChoiceChip(
                    label: Text(region),
                    selected: isSelected,
                    onSelected: (_) {
                      context.read<FilterCubit>().setRegion(region);
                      Navigator.pop(context);
                    },
                    selectedColor: Colors.purple[100],
                  );
                }).toList(),
              ),
            ] else ...[
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredRegions.length,
                  itemBuilder: (context, index) {
                    final region = filteredRegions[index];
                    return ListTile(
                      title: Text(region),
                      trailing: region == selectedRegion
                          ? const Icon(Icons.check, color: Colors.purple)
                          : null,
                      onTap: () {
                        context.read<FilterCubit>().setRegion(region);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
