import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
final CollectionReference fireStoreRef = FirebaseFirestore.instance.collection('users');
FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
final ref = firebaseDatabase
    .refFromURL("https://krishna-c386a-default-rtdb.firebaseio.com/");

const String dbProfiles = 'Profiles';
const String dbLogin = 'login_page';
const String dbUserId = 'userId';
const String dbKey = 'key';
const String dbName = 'name';
const String dbEmail = 'email';
const String dbMobile = 'mobile';
const String dbDob = 'dob';
const String dbAge = 'age';
const String dbLastScreen = 'lastScreen';
const String dbLastBse = 'lastBse';
const String dbPassword = 'password';
const String dbCancerHistory = 'cancerHistory';
const String dbTitle = 'title';
const String dbImageUrl = 'imageUrl';
const String dbIsVideo = 'isVideo';
const String dbThumbNail = 'thumbNail';
