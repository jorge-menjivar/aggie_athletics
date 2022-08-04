import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/sport_events_bloc.dart';
import '../splash_screen.dart';
import '../utils/get_events_from_server.dart';
import 'package:date_format/date_format.dart';

class Calendar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  Calendar({super.key, required this.scaffoldKey});

  @override
  _CalendarState createState() => _CalendarState(scaffoldKey: this.scaffoldKey);
}

class _CalendarState extends State<Calendar>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> scaffoldKey;

  _CalendarState({required this.scaffoldKey});

  final _listTitleStyle = const TextStyle(fontWeight: FontWeight.w800);
  final _biggerFont =
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
  final _subFont = const TextStyle(fontSize: 14.0);
  final _trailFont = const TextStyle(fontSize: 14.0);
  final _freeFont = const TextStyle(
      fontSize: 14.0, color: Colors.green, fontWeight: FontWeight.w600);

  var variablesInitialized = false;

  late List<QueryDocumentSnapshot<Map<String, dynamic>>> _upcomingEvents;
  bool _loadedEvents = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // initUpcomingEventsBloc();
    super.initState();
    initUpcomingEvents();
  }

  void initUpcomingEvents() {
    FirebaseFirestore.instance
        .collection('upcoming_events')
        .orderBy('time', descending: false)
        .snapshots()
        .listen((docSnapshot) async {
      setState(() {
        _loadedEvents = true;
        _upcomingEvents = docSnapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (!_loadedEvents) {
      return SplashScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _upcomingEvents.length,
        itemBuilder: (itemBuilderContext, i) {
          final upcomingEvent = _upcomingEvents[i].data();

          Timestamp t = upcomingEvent['time'];
          var time = t.toDate();
          var timeString =
              formatDate(time, [M, ' ', dd, ', ', h, ':', nn, ' ', am]);

          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.all(6),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: CachedNetworkImageProvider(
                          upcomingEvent['photo_ref']),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                upcomingEvent['opponent'].toUpperCase(),
                                textAlign: TextAlign.left,
                                style: _biggerFont,
                              ),
                              Text(
                                upcomingEvent['sport'],
                                textAlign: TextAlign.left,
                                style: _biggerFont,
                              ),
                              Text(
                                upcomingEvent['location'],
                                textAlign: TextAlign.left,
                                style: _subFont,
                              ),
                              TextButton(
                                child: Text(
                                  (upcomingEvent['tickets'] == 'free')
                                      ? 'Free for Aggies'
                                      : 'Buy',
                                  style: TextStyle(
                                      color:
                                          (upcomingEvent['tickets'] == 'free')
                                              ? Colors.green
                                              : null),
                                ),
                                onPressed: () {
                                  launch(upcomingEvent['purchase']);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              timeString,
                              style: _trailFont,
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
