import '../model/club.dart';

class ClubDataSource {
  static final clubs = <Club>[
    Club(
      "1",
      "Manchester United",
      "https://dlscenter.com/wp-content/uploads/2017/06/manchester-united-escudo.png",
    ),
    Club(
      "2",
      "Real Madrid",
      "https://i.imgur.com/Vz2HtKe.png",
    )
  ];

  static Future<Club> getClubById(String id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return clubs.firstWhere((element) => element.id == id);
  }
}
