import 'package:bloc_example/club_page_bloc/club_page_event.dart';
import 'package:bloc_example/club_page_bloc/club_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_source.dart';

class ClubPageBloc extends Bloc<ClubPageEvent, ClubPageState> {
  ClubPageBloc() : super(LoadingState()) {
    // on<FetchClub>((event, emit) => emit(state + 1));
    on<FetchClub>((event, emit) async {
      emit(LoadingState());
      final club = await ClubDataSource.getClubById(event.id);
      emit(LoadedState(club));
    });
  }
}
