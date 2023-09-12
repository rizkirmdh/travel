import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitState extends Equatable {
  const CubitState();

  @override
  List<Object?> get props => [];
}

class InitialState extends CubitState {}

class WelcomeState extends CubitState {}

class LoadingState extends CubitState {}

class LoadedState extends CubitState {
  final List<DataModel> places;

  const LoadedState(this.places);
}

class DetailState extends CubitState {
  final DataModel place;

  const DetailState(this.place);
}