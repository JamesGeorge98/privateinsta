// import 'package:shared_preferences/shared_preferences.dart';

// saveSharedPrefList(String listName, List<String> listData) async {
//   SharedPreferences perfs = await SharedPreferences.getInstance();
//   perfs.setStringList(listName, listData);
//   return perfs.commit();
// }

// getSharedPrefList(String listName) async {
//   SharedPreferences perfs = await SharedPreferences.getInstance();
//   List<String>? listData = perfs.getStringList(listName);
//   return listData;
// }

// removeListSharedPref(String listName) async {
//   SharedPreferences perfs = await SharedPreferences.getInstance();
//   perfs.remove(listName);
// }

// saveBoolSharedPref(String boolName, bool data) async {
//   SharedPreferences perfs = await SharedPreferences.getInstance();
//   perfs.setBool(boolName,data);
//   return perfs.commit();
// }

// getBoolSharedPref(String boolName)async {
//   SharedPreferences perfs = await SharedPreferences.getInstance();
//   bool? boolData = perfs.getBool(boolName);
//   return boolData;
// }

// removeBoolSharedPref(String boolName) async {
//   SharedPreferences perfs = await SharedPreferences.getInstance();
//   perfs.remove(boolName);
// }
