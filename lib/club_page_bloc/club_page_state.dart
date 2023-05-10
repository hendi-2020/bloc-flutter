import 'package:bloc_example/model/club.dart';

abstract class ClubPageState {}

class LoadingState extends ClubPageState {}

class LoadedState extends ClubPageState {
  Club club;

  LoadedState(
    this.club,
  );
}
