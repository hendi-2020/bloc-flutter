import 'package:bloc_example/model/club.dart';

import '../component/tab_button.dart';

abstract class ClubPageEvent {}

class FetchClub extends ClubPageEvent {
  final String id;

  FetchClub(this.id);
}
