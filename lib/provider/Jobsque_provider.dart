import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/Database/Local_Database.dart';
import 'package:jobsque/Screens/Filter_Search/Resent_Search.dart';
import 'package:jobsque/Screens/Maasege/Chat_Screen.dart';
import 'package:jobsque/Screens/Maasege/Widget/message_items.dart';
import 'package:jobsque/Screens/Applyied_job_screen/Applyed_job_screen.dart';
import 'package:jobsque/Screens/Saved_screen/widget/Saved_Jobs_Item.dart';
import 'package:jobsque/Screens/profile/screen/Portoflio_screen.dart';
import 'package:jobsque/model/Jobs_model.dart';
import 'package:jobsque/model/User_model.dart';
import 'package:jobsque/model/company_model.dart';
import 'package:jobsque/widget/Jobs_Item.dart';

final jobsqueprov = ChangeNotifierProvider<Jobsqueprovider>(
  (ref) => Jobsqueprovider(),
);

class Jobsqueprovider extends ChangeNotifier {
  List<JobsItem> home = [];
  Set<PortfolioItem> portofelioList = {};
  List<SavedJopsItem> savedjobs = [];
  List<RecentSearches> resentsearch = [];
  List<AppliedJopItem> activeJob = [];
  List<JobsItem> filterJobs = [];
  List<MessageItems> messageList = [];
  List<ChatScreen> chatitem = [];
  String? typeOfWork;
  PlatformFile? pdfData;
  User? user;
  bool isSwitchingVerf = false;
  bool isTwoStepVerf = false;

  Future<void> getJops() async {
    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
    int userID = user?.id ?? await LocalDataBase.getID();

    List? savedJobsId = await LocalDataBase.getSaveJops(userID);

    final response = await dio.get(
      "https://project2.amit-learning.com/api/jobs",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    List listOfJobs = response.data['data'];
    home.clear();
    activeJob.clear();

    if (listOfJobs.isEmpty) {
    } else {
      for (var element in response.data['data']) {
        Jobs job = Jobs.fromJson(element);
        if (savedJobsId != null && savedJobsId.isNotEmpty) {
          for (var savejob in savedJobsId) {
            if (savejob == job.id.toString()) {
              savedjobs.add(savejob(jop: job));
              job.isSaved = true;
            }
          }
        }

        home.add(JobsItem(
          jobs: job,
        ));

        activeJob.add(AppliedJopItem(jobs: job));
      }
    }
    notifyListeners();
  }

  Future setSaveJobs(int jopID) async {
    // await Future.delayed(const Duration(seconds: 1));
    int userID = user?.id ?? await LocalDataBase.getID();
    LocalDataBase.setSaveJops(userID.toString(), jopID.toString());
    // print("the id : ${userID}");
  }

/////////////////////////////////////////////about user

  Future<void> selectImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    user!.image = pickedImage!.path;
    print("the image is ${user!.image}");
    notifyListeners();
  }

  Future<void> setImage() async {}

  Future login(String email, String password, bool isRmember) async {
    Dio dio = Dio();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/auth/login",
      data: {
        'email': email,
        'password': password,
      },
      options: Options(headers: {
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );
    if (response.statusCode != 200) {
      return false;
    } else {
      user = User.fromJson(response.data['user']);
      user!.token = response.data['token'];

      if (isRmember) {
        LocalDataBase.setUser(user!.id! as User);
        LocalDataBase.setToken(user!.token!);
      }

      // user = datauser;
      notifyListeners();
    }
    getSearch(email);

    getJops();
    return true;
  }

  Future<void> getUser() async {
    if (user != null) {
      return;
    }

    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
    final response = await dio.get(
      "https://project2.amit-learning.com/api/auth/profile",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    user = User.fromJson(response.data['data']);

    getMessage();
    getJops();
    getSearch(token);
    selectImage();
    notifyListeners();
  }

  Future<void> editUser() async {
    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
    await dio.put(
      "https://project2.amit-learning.com/api/user/profile/portofolios",
      data: {
        "bio": user?.bio,
        "address": user?.address,
        "mobile": user?.phone,
        "language": user?.language,
        "interested_work": user?.interestedWork,
        "offline_place": user?.offlinePlace,
        "remote_place": user?.remotePlace,
        "experience": user?.experience,
        "personal_detailed": user?.personalDetailed,
        "education": user?.education,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    notifyListeners();
  }

  Future<void> changePassword() async {
    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
    await dio.post(
      "https://project2.amit-learning.com/api/auth/user/update",
      data: {"password": user?.password},
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    // notifyListeners();
  }

  void logOut() {
    user = null;
    home = [];
    portofelioList = {};
    savedjobs = [];
    activeJob = [];
    filterJobs = [];
    resentsearch = [];
    messageList = [];
    chatitem = [];
    typeOfWork = null;
    pdfData = null;
    user = null;
    isSwitchingVerf = false;
    isTwoStepVerf = false;
    LocalDataBase.deleteUser();
    notifyListeners();
  }

/////////////////////////////////////////////message
  Future<void> getMessage() async {
    Dio dio = Dio();
    // String token = await LocalDataBase.getToken() ?? user!.token;
    String token = user?.token ?? await LocalDataBase.getToken();
    // int id = user!.id ?? await LocalDataBase.getID();
    final companyResponse = await dio.get(
      "https://project2.amit-learning.com/api/showCompany",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    List company = companyResponse.data["data"];
    for (var element in company) {
      messageList.add(MessageItems(
        company: Company.fromJson(element),
      ));
    }
  }

/////////////////////////////////////////////searchJops
  Future<void> searchJobs(String? nameOfJob) async {
    filterJobs.clear();
    Dio dio = Dio();
    // String token =  await LocalDataBase.getToken();
    String token = user?.token ?? await LocalDataBase.getToken();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/jobs/filter",
      data: {
        'name': nameOfJob,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    List listOfJobs = response.data['data'];
    if (listOfJobs.isEmpty) {
    } else {
      for (var element in response.data['data']) {
        filterJobs.add(JobsItem(
          jobs: Jobs.fromJson(element),
        ));
      }
    }
    notifyListeners();
  }

/////////////////////////////////////////////filterJop
  Future<void> getFilterdJobs(
      {String? name, String? location, String? salary}) async {
    filterJobs.clear();
    Dio dio = Dio();
    String token = await LocalDataBase.getToken();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/jobs/filter",
      data: {
        'name': name,
        'location': location,
        'salary': salary,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );
    List listOfJops = response.data['data'];
    if (listOfJops.isEmpty) {
    } else {
      for (var element in response.data['data']) {
        filterJobs.add(
          (JobsItem(
            jobs: Jobs.fromJson(element),
          )),
        );
      }
    }
    notifyListeners();
  }

/////////////////////////////////////////////about CV
  void setCVFile() async {
    var filePath = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    ).then((result) => result?.files.single);
    pdfData = filePath;
    notifyListeners();
  }

  void removeCVData() async {
    pdfData = null;
    notifyListeners();
  }
/////////////////////////////////////////////about Jops

  void savedJop(Jobs jobs) async {
    savedjobs.add(SavedJopsItem(savedjobs: jobs));

    int userID = user?.id ?? await LocalDataBase.getID();
    LocalDataBase.setSaveJops(userID.toString(), jobs.id.toString());
    jobs.isSaved = true;

    home[home.indexWhere((element) => element.jobs.id == jobs.id)] = JobsItem(
      jobs: jobs,
    );
    activeJob[activeJob.indexWhere((element) => element.jobs.id == jobs.id)] =
        AppliedJopItem(jobs: jobs);

    notifyListeners();
  }

  void unsaveJop(Jobs jobs) async {
    jobs.isSaved = false;
    savedjobs.removeWhere((element) => element.savedjobs.id == jobs.id);
    int userID = user?.id ?? await LocalDataBase.getID();

    LocalDataBase.deleteSaveJops(userID.toString(), jobs.id.toString());

    // int index = allJops.indexWhere((element) => element.jop.id == jops.id);
    home[home.indexWhere((element) => element.jobs.id == jobs.id)] =
        JobsItem(jobs: jobs);

    activeJob[activeJob.indexWhere((element) => element.jobs == jobs.id)] =
        AppliedJopItem(jobs: jobs);

    notifyListeners();
  }
/////////////////////////////////////////////about Portfolio

  void setPortfolio() async {
    var filePath = await FilePicker.platform
        .pickFiles()
        .then((result) => result?.files.single);
    if (filePath == null) {
    } else {
      if (portofelioList
          .where((element) => element.dataOfPdf!.name == filePath.name)
          .isNotEmpty) {
      } else {
        portofelioList.add(
          PortfolioItem(
            dataOfPdf: pdfData,
          ),
        );
      }
    }

    notifyListeners();
  }

  void removePortfolio(String name) async {
    portofelioList.removeWhere((element) => element.dataOfPdf!.name == name);

    notifyListeners();
  }

//////////////////////////////actev TWo Step verify
  void verifyde() async {
    isTwoStepVerf = !isTwoStepVerf;
    notifyListeners();
  }

  void switchVerify() async {
    isSwitchingVerf = !isSwitchingVerf;
    notifyListeners();
  }

  ////////////////////////////Search
  ///
  void getSearch(String text) async {
    List? temp = await LocalDataBase.getRecentSearche(user!, setSearch);

    if (temp == null || temp.isEmpty) {
      return;
    }
    for (var element in temp) {
      resentsearch.add(RecentSearches(
        searchName: element,
      ));
    }

    notifyListeners();
  }

  void setSearch(String searchname) async {
    if (searchname.isNotEmpty) {
      LocalDataBase.setRecentSearche(user!, searchname);
      searchJobs(searchname);

      await Future.delayed(const Duration(milliseconds: 1500));
      resentsearch.removeWhere((element) => element.searchName == searchname);
      resentsearch.insert(0, RecentSearches(searchName: searchname));

      notifyListeners();
    }
  }

  void deleteSearch(String searchname) async {
    LocalDataBase.deleteRecentSearche(user!, searchname);

    resentsearch.removeWhere((element) => element.searchName == searchname);

    notifyListeners();
  }

  Future<Void?> sentDataToapplyJop(name, email, mobile, workType, jopId) async {
    Dio dio = Dio();
    // String token = await LocalDataBase.getToken();
    int id = user!.id ?? await LocalDataBase.getID();
    String token = user?.token ?? await LocalDataBase.getToken();
    final response = await dio.post(
      'https://project2.amit-learning.com/api/apply',
      data: {
        // 'cv_file': null,
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': workType,
        // 'other_file': null,

        'jobs_id': jopId,
        'user_id': id
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    return null;
  }
}
