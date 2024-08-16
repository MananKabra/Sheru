import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Firebase Instance
final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

// Database References
final usersRef = firestore.collection('users');
