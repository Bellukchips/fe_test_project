import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_cubit_state.dart';

class FilterCubit extends Cubit<FilterCubitState> {
  FilterCubit() : super(FilterCubitState());
  void setSport(String sport) => emit(state.copyWith(sports: sport));
  void setCategory(String category) => emit(state.copyWith(category: category));
  void setRegion(String region) => emit(state.copyWith(region: region));
  void setPeriod(String period) => emit(state.copyWith(period: period));

  void resetFilters() => emit(FilterCubitState());
}
