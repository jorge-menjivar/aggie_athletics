import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/sport_events_bloc.dart';
import '../splash_screen.dart';
import '../utils/get_events_from_server.dart';
import 'package:date_format/date_format.dart';

class Home extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Home({super.key, required this.scaffoldKey});

  @override
  _HomeState createState() => _HomeState(scaffoldKey: this.scaffoldKey);
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<ScaffoldState> scaffoldKey;

  _HomeState({required this.scaffoldKey});

  final _listTitleStyle = const TextStyle(fontWeight: FontWeight.w800);
  final _biggerFont =
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
  final _subFont = const TextStyle(fontSize: 14.0);
  final _trailFont = const TextStyle(fontSize: 14.0);
  final _freeFont = const TextStyle(
      fontSize: 14.0, color: Colors.green, fontWeight: FontWeight.w600);

  bool _loadedNews = false;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    //TODO: download news
    var duration = const Duration(seconds: 5);
    print('Start sleeping');
    sleep(duration);
    print('5 seconds has passed');
    _loadedNews = true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print(_loadedNews);
    if (!_loadedNews) {
      return SplashScreen();
    }

    return Column(
      children: [Text("here")],
    );
  }
}
