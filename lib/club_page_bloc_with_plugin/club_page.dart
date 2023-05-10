import 'package:bloc_example/club_page_bloc/club_page_event.dart';
import 'package:bloc_example/club_page_bloc/club_page_state.dart';
import 'package:bloc_example/club_page_bloc_with_plugin/club_page_bloc.dart';
import 'package:bloc_example/component/image_preview.dart';
import 'package:bloc_example/component/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClubPage extends StatelessWidget {
  const ClubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("**** build all widgets ****");

    context.read<ClubPageBloc>().add(FetchClub("1"));

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
            child: BlocBuilder<ClubPageBloc, ClubPageState>(
                builder: (context, state) {
              if (state is LoadedState) {
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
            onPressed: (type) => context
                .read<ClubPageBloc>()
                .add(FetchClub((type == TabButtonAction.left) ? "1" : "2")),
          )
        ],
      ),
    );
  }
}
