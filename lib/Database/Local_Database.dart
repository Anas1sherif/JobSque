import 'package:jobsque/model/User_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataBase {
  static Future setFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isfirsttime', false);
  }

  static Future getFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('isfirsttime') ?? true;
    return isFirstTime;
  }

  static Future setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future? getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return token;
  }

  static Future setID(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }

  static Future getID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id');
    return id;
  }

  static Future deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('token');
  }

  static void setUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setStringList("user", [
      user.id!.toString(),
      user.name!,
      user.email!,
    ]);
  }

  static void setRecentSearche(User user, String searchJob) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List? temp = pref.getStringList("SearchJob ${user.id}");
    Set<String> search = {searchJob};

    if (temp != null) {
      search.addAll(pref.getStringList("SearchJob ${user.id}")!);
    }

    pref.setStringList("SearchJop ${user.id}", search.toList());
  }

  static Future getRecentSearche(User user, void setSearch) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // await Future.delayed(const Duration(seconds: 1));

    List? temp = pref.getStringList("SearchJob ${user.id}");

    return temp;
  }

  static void deleteRecentSearche(User user, String searchJop) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? search = pref.getStringList("SearchJob ${user.id}");
    if (search != null) {
      search.removeWhere((element) => element == searchJop);
      pref.setStringList("SearchJop ${user.id}", search);
    }
  }

  static Future getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));

    List<String>? usr = pref.getStringList("user");
    User? user;

    if (usr?[0] != null) {
      user = User(
        id: int.parse(usr![0]),
        name: usr[1],
        email: usr[2],
      );
    }

    return user;
  }

  static void setSaveJops(String userID, String jopID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List? temp = pref.getStringList("savejob $userID");
    List<String> savedJop = [jopID];

    if (temp != null) {
      savedJop.addAll(pref.getStringList("savejob $userID")!);
    }

    pref.setStringList("savejob $userID", savedJop);
  }

  static Future getSaveJops(int userID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // await Future.delayed(const Duration(seconds: 1));

    List? temp = pref.getStringList("savejob $userID");

    // print("The All Searched Jop is : $temp");
    return temp;
  }

  static void deleteSaveJops(String userId, String jobID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List<String>? search = pref.getStringList("savejob $userId");
    if (search != null) {
      search.removeWhere((element) => element == jobID);

      pref.setStringList("savejob $userId", search);
    }
  }
}
