import 'package:bloc_example/club_page_bloc/club_page_bloc.dart';
import 'package:bloc_example/club_page_bloc/club_page_event.dart';
import 'package:bloc_example/club_page_bloc/club_page_state.dart';
import 'package:bloc_example/component/image_preview.dart';
import 'package:bloc_example/component/tab_button.dart';
import 'package:flutter/material.dart';

class ClubPage extends StatefulWidget {
  const ClubPage({Key? key}) : super(key: key);

  @override
  State<ClubPage> createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  ClubPageBloc bloc = ClubPageBloc();

  @override
  void initState() {
    bloc.eventSink.add(FetchClub("1"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("**** build all widgets ****");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc page without plugin"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Your selected team",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: StreamBuilder<ClubPageState>(
                stream: bloc.stateStream,
                initialData: LoadingState(),
                builder: (context, snapshot) {
                  if (snapshot.data is LoadedState) {
                    final state = snapshot.data as LoadedState;
                    return ImagePreview(
                      imageUrl: state.club.logo,
                      title: state.club.name,
                    );
                  } else {
                    return const Center(child: Text("Loading..."));
                  }
                }),
          ),
          TabButton(
            leftLabel: "MU",
            rightLabel: "Madrid",
            onPressed: (type) => bloc.eventSink
                .add(FetchClub((type == TabButtonAction.left) ? "1" : "2")),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
