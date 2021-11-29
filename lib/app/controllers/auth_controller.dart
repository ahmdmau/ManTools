import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mantools/app/data/models/user_model.dart';
import 'package:mantools/app/routes/app_pages.dart';
import 'package:mantools/app/utils/utils.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuthenticated = false.obs;
  final box = GetStorage();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount? _currentAccount;
  UserCredential? userCredential;
  UserModel? userModel;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      isAuthenticated.value = value;
    });

    await checkIsSkipIntro().then((value) {
      isSkipIntro.value = value;
    });
  }

  Future<bool> checkIsSkipIntro() async {
    if (box.read('skipIntro') != null || box.read('skipIntro') == true) {
      return true;
    }

    return false;
  }

  Future<bool> autoLogin() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final currUser = await userCollection.doc(currentUser.email).get();
        dynamic currUserData = currUser.data();
        userModel = UserModel.fromJson(currUserData);

        return true;
      }

      return false;
    } catch (e) {
      Utils.showSnackBar('Error', e.toString(), true);
      return false;
    }
  }

  Future<void> login() async {
    try {
      Utils.showLoading('Sedang masuk');
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _currentAccount = value);
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        final googleAuth = await _currentAccount!.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        try {
          await _auth
              .signInWithCredential(credential)
              .then((value) => userCredential = value);
        } on FirebaseAuthException catch (e) {
          Utils.hideLoading();
          Utils.showSnackBar('Terjadi Kesalahan', e.message ?? "Error", true);
        }
        if (!await checkIntro()) {
          box.write('skipIntro', true);
        }

        final checkUser =
            await userCollection.doc(_currentAccount!.email).get();

        if (checkUser.data() != null) {
          userCollection.doc(_currentAccount!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        } else {
          userCollection.doc(_currentAccount!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentAccount!.displayName,
            "email": _currentAccount!.email,
            "photoUrl": _currentAccount!.photoUrl,
            "roles": 0,
            "providers": 'google',
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
          });
        }

        final currUser = await userCollection.doc(_currentAccount!.email).get();
        dynamic currUserData = currUser.data();

        userModel = UserModel.fromJson(currUserData);

        isAuthenticated.value = true;
        Utils.hideLoading();
        Get.offAllNamed(Routes.MAIN);
      } else {
        Utils.hideLoading();
      }
    } on FirebaseAuthException catch (e) {
      Utils.hideLoading();
      Utils.showSnackBar('Terjadi Kesalahan', e.message ?? "Error", true);
    } catch (e) {
      Utils.hideLoading();
    }
  }

  Future<void> signInWithFacebook() async {
    Utils.showLoading('Sedang masuk');
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      try {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userData = await FacebookAuth.instance.getUserData();
        await _auth
            .signInWithCredential(credential)
            .then((value) => userCredential = value);
        if (!await checkIntro()) {
          box.write('skipIntro', true);
        }

        final checkUser = await userCollection.doc(userData['email']).get();

        if (checkUser.data() != null) {
          userCollection.doc(userData['email']).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        } else {
          userCollection.doc(userData['email']).set({
            "uid": userCredential!.user!.uid,
            "name": userData['name'],
            "email": userData['email'],
            "photoUrl": userData['picture']['data']['url'],
            "roles": 0,
            "providers": 'facebook',
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
          });
        }

        final currUser = await userCollection.doc(userData['email']).get();
        dynamic currUserData = currUser.data();

        userModel = UserModel.fromJson(currUserData);

        isAuthenticated.value = true;
        Utils.hideLoading();
        Get.offAllNamed(Routes.MAIN);
      } on FirebaseAuthException catch (error) {
        Utils.hideLoading();
        Utils.showSnackBar('Terjadi Kesalahan', error.message ?? "Error", true);
      }
    } else {
      Utils.hideLoading();
    }
  }

  Future<void> signUpWithEmail(
      String name, String email, String password) async {
    Utils.showLoading('Silahkan tunggu');
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => userCredential = value);

      if (!await checkIntro()) {
        box.write('skipIntro', true);
      }

      userCollection.doc(email).set({
        "uid": userCredential!.user!.uid,
        "name": name,
        "email": email,
        "photoUrl": '',
        "roles": 0,
        "providers": 'email',
        "creationTime":
            userCredential!.user!.metadata.creationTime!.toIso8601String(),
        "lastSignInTime":
            userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        "updatedTime": DateTime.now().toIso8601String(),
      });

      final currUser = await userCollection.doc(email).get();
      dynamic currUserData = currUser.data();

      userModel = UserModel.fromJson(currUserData);

      isAuthenticated.value = true;
      Utils.hideLoading();
      Get.offAllNamed(Routes.MAIN);
    } on FirebaseAuthException catch (e) {
      Utils.hideLoading();
      Utils.showSnackBar("Terjadi Kesalahan", e.message ?? "Error", true);
    } catch (e) {
      Utils.hideLoading();
      Utils.showSnackBar("Terjadi Kesalahan", e.toString(), true);
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    Utils.showLoading('Silahkan tunggu');
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => userCredential = value);
      if (!await checkIntro()) {
        box.write('skipIntro', true);
      }

      final currUser = await userCollection.doc(email).get();

      if (currUser.data() != null) {
        userCollection.doc(email).update({
          "lastSignInTime":
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });
      } else {
        return;
      }

      dynamic currUserData = currUser.data();

      userModel = UserModel.fromJson(currUserData);

      isAuthenticated.value = true;
      Utils.hideLoading();
      Get.offAllNamed(Routes.MAIN);
    } on FirebaseAuthException catch (e) {
      Utils.hideLoading();
      Utils.showSnackBar("Terjadi Kesalahan", e.message ?? "Error", true);
    } catch (e) {
      Utils.hideLoading();
      Utils.showSnackBar("Terjadi Kesalahan", e.toString(), true);
    }
  }

  Future<bool> checkIntro() async {
    bool isSkipIntro = await box.read('skipIntro');
    return isSkipIntro;
  }

  Future<void> logout(String providers) async {
    switch (providers) {
      case 'facebook':
        await FacebookAuth.instance.logOut();
        break;
      case 'google':
        await _googleSignIn.disconnect();
        await _googleSignIn.signOut();
        break;
      default:
        break;
    }
    userModel = null;
    await _auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
