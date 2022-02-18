import 'package:be_marvellous_admin/models/general.dart';
import 'package:be_marvellous_admin/models/watchlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late GeneralSettings generalSettings;
  late WatchListSettings watchListSettings;

  SettingServices() {
    _firestore.collection("settings").doc("general").get().then((value) {
      return GeneralSettings.fromMap(value.data() != null ? value.data()! : {});
    });

    _firestore.collection("settings").doc("watchlist").get().then((value) {
      return WatchListSettings.fromMap(
          value.data() != null ? value.data()! : {});
    });
  }

  Future<void> updateGeneralSettings(GeneralSettings settings) async {
    await _firestore
        .collection("settings")
        .doc("general")
        .set(settings.toMap());
  }

  Future<void> updateWatchListSettings(WatchListSettings settings) async {
    await _firestore
        .collection("settings")
        .doc("watchlist")
        .set(settings.toMap());
  }
}
