part of 'filter_cubit.dart';

class FilterCubitState {
  final String? sport;
  final String? category;
  final String? region;
  final String? period;

  FilterCubitState({this.sport, this.category, this.region, this.period});

  FilterCubitState copyWith({
    String? sports,
    String? category,
    String? region,
    String? period,
  }) {
    return FilterCubitState(
      sport: sports ?? this.sport,
      category: category ?? this.category,
      region: region ?? this.region,
      period: period ?? this.period,
    );
  }
}
