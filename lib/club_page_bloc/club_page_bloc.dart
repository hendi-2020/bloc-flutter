import 'dart:async';

import 'package:bloc_example/club_page_bloc/club_page_event.dart';
import 'package:bloc_example/club_page_bloc/club_page_state.dart';
import 'package:bloc_example/data/data_source.dart';

class ClubPageBloc {
  // state
  ClubPageState _club = LoadingState();

  final StreamController<ClubPageEvent> _eventController =
      StreamController<ClubPageEvent>();

  StreamSink<ClubPageEvent> get eventSink => _eventController.sink;

  final StreamController<ClubPageState> _stateController =
      StreamController<ClubPageState>();

  StreamSink<ClubPageState> get _stateSink => _stateController.sink;

  Stream<ClubPageState> get stateStream => _stateController.stream;

  void _mapEventToState(ClubPageEvent event) async {
    if (event is FetchClub) {
      _club = LoadingState();
      _stateSink.add(_club);

      final club = await ClubDataSource.getClubById(event.id);
      _club = LoadedState(club);
      _stateSink.add(_club);
    }
  }

  ClubPageBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
