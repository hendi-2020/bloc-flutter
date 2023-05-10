import 'package:bloc_example/club_page_bloc/club_page_state.dart';
import 'package:bloc_example/component/image_preview.dart';
import 'package:bloc_example/component/tab_button.dart';
import 'package:bloc_example/data/data_source.dart';
import 'package:flutter/material.dart';

class ClubPage extends StatefulWidget {
  const ClubPage({Key? key}) : super(key: key);

  @override
  State<ClubPage> createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  // state
  ClubPageState state = LoadingState();

  @override
  Widget build(BuildContext context) {
    print("**** build all widgets ****");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Without state management"),
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
              child: (state is LoadedState)
                  ? ImagePreview(
                      imageUrl: (state as LoadedState).club.logo,
                      title: (state as LoadedState).club.name,
                    )
                  : const Center(child: Text("Loading..."))),
          TabButton(
            leftLabel: "MU",
            rightLabel: "Madrid",
            onPressed: (type) =>
                fetchClubById((type == TabButtonAction.left) ? "1" : "2"),
          )
        ],
      ),
    );
  }

  void fetchClubById(String id) {
    setState(() {
      state = LoadingState();
    });

    ClubDataSource.getClubById(id).then((value) {
      setState(() {
        state = LoadedState(value);
      });
    });
  }
}
