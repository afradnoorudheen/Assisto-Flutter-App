import 'package:assisto/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  User? user;
  User_? user_;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    checkAuth();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkAuth() async {
    if (auth.currentUser != null) {
      user = auth.currentUser;

      if (await getUserDetails())
        Get.toNamed(Routes.HOME);
      else
        Get.toNamed(Routes.REGISTER);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  Future<bool> getUserDetails() async {
    final data = await FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser!.uid)
        .get();

     user_ = User_.fromFirebase(data);
    return user_!.isComplete;
  }
}

class User_ {
  String? id, firstName, lastName, dob, mailID, gender, googleID;

  User_(
      {this.firstName,
      this.lastName,
      this.googleID,
      this.mailID,
      this.id,
      this.dob,
      this.gender});

  User_.fromFirebase(DocumentSnapshot<Map<String, dynamic>> doc) {
    id = doc.id;

    final data = doc.data()!;

    firstName = data['firstName'];
    lastName = data['lastName'];
    dob = data['dob'];
    mailID = data['mailID'];
    gender = data['gender'];
    googleID = data['googleID'];
  }

  toFirebase() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'mailID': mailID,
      'gender': gender,
      'googleID': googleID,
      'id': id,
    };
  }

  bool get isComplete =>
      (id != null && id != '') &&
      (firstName != null && firstName != '') &&
      (lastName != null && lastName != '') &&
      (dob != null && dob != '') &&
      (mailID != null && mailID != '') &&
      (gender != null && gender != '') &&
      (googleID != null && googleID != '');
}
