import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff4B4487);
const double kPrimaryPadding = 15;
const String kAppName = "ChatApp";
const String kPrimaryLogo = "assets/images/Logo - Dra_ Patrícia Moura.jpg";
const String kCreatedAt = 'createdAT';
const String kMessage = 'message';
const String kId = 'id';
 
CollectionReference message = FirebaseFirestore.instance.collection('message');
