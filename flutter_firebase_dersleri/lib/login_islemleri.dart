import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuth auth;
  final String _email = '11756786124e@gmail.com';
  final String _password = 'emin5656';
  @override
  void initState() {
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) {
          print('Kullanıcı şu anda çıkış yapmış durumda!');
        }
      } else {
        if (kDebugMode) {
          print(
              'Kullanıcı oturum açtı!${user.email} ve email durumu: ${user..emailVerified}');
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Firebase Dersleri"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                loginUserEmailAndPassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              child: Text("Email / Şifre ile Giriş"),
            ),
            ElevatedButton(
              onPressed: () {
                createUserEmailAndPassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              child: Text("Email / Şifre ile Kayıt "),
            ),
            ElevatedButton(
              onPressed: () {
                singOutherUser();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              child: Text("Oturumu Kapat Yap"),
            ),
            ElevatedButton(
              onPressed: () {
                deleteUser();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              child: Text("Hesabı Sil"),
            ),
            ElevatedButton(
              onPressed: () {
                changePassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              child: Text("Parola Değiştir "),
            ),
            ElevatedButton(
              onPressed: () {
                changeEmail();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              child: Text("Email Değiştir "),
            ),
            ElevatedButton(
              onPressed: () {
                googleIleGiris();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              child: Text("Gmail İle Giriş Yap"),
            ),
            ElevatedButton(
              onPressed: () {
                loginWithPhoneNumber();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              child: Text("Telefon Numarası İle Giriş Yap"),
            ),
            ElevatedButton(
              onPressed: userAnonim,
              child: Text("anonim kullanici"),
            )
          ],
        ),
      ),
    );
  }

  void loginWithPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+905352345650',
      verificationCompleted: (PhoneAuthCredential credential) async {
        if (kDebugMode) {
          print("verification Tetiklendi ");
          print(credential.toString());
        }
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          print("Hata Oluştu: $e");
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        String _smsCode = '123456';
        if (kDebugMode) {
          print("code send  Tetiklendi");
        }
        var _credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: _smsCode);
        await auth.signInWithCredential(_credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (kDebugMode) {
          print("code auto retrieval Timeout  Tetiklendi");
        }
      },
    );
  }

  void createUserEmailAndPassword() async {
    try {
      var _userCredential = await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      var _myUser = _userCredential.user;
      if (!_myUser!.emailVerified) {
        await _myUser.sendEmailVerification();
      } else {
        if (kDebugMode) {
          print("Email Doğrulandı");
        }
      }
      if (kDebugMode) {
        print(_userCredential.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print("Hata Oluştu: $e");
      }
    }
  }

  void loginUserEmailAndPassword() async {
    try {
      var _userCredential = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (kDebugMode) {
        print(_userCredential.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print("Hata Oluştu: $e");
      }
    }
  }

  void singOutherUser() async {
    var _user = GoogleSignIn().currentUser;
    if (_user != null) {
      GoogleSignIn().currentUser;
    }

    await auth.signOut();
  }

  void deleteUser() async {
    try {
      if (auth.currentUser != null) {
        await auth.currentUser!.delete();
      } else {
        if (kDebugMode) {
          print("Kullanıcı Bulunamadı");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Hata Oluştu: $e");
      }
    }
  }

  void changePassword() async {
    try {
      await auth.currentUser!.updatePassword('emin5656');
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        if (kDebugMode) {
          print("reauthenticate olunacak");
        }
        var credential =
            EmailAuthProvider.credential(email: _email, password: _password);
        await auth.currentUser!.reauthenticateWithCredential(credential);
        await auth.currentUser!.updatePassword('emin5656');
        await auth.signOut();
        if (kDebugMode) {
          print("Şifre Güncllendi");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Hata Oluştu: $e");
      }
    }
  }

  void changeEmail() async {
    try {
      await auth.currentUser!.updateEmail('eminalan334@gmail.com');
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        if (kDebugMode) {
          print("reauthenticate olunacak");
        }
        var credential =
            EmailAuthProvider.credential(email: _email, password: _password);
        await auth.currentUser!.reauthenticateWithCredential(credential);
        await auth.currentUser!.updateEmail('eminalan334@gmail.com');
        await auth.signOut();
        if (kDebugMode) {
          print("Email Güncllendi");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Hata Oluştu: $e");
      }
    }
  }

  void googleIleGiris() async {
    // Kimlik doğrulama akışını tetikle
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // İstekten kimlik doğrulama ayrıntılarını alın
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Yeni bir kimlik bilgisi oluştur
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Oturum açtıktan sonra UserCredential'ı döndür
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void userAnonim() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    print("Oturum açılıdı misafir : ${userCredential.user!.uid}");
  }
}
