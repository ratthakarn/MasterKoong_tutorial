import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:masterkoong_tutorial/listview/tutorial_listview.dart';
import 'package:masterkoong_tutorial/models/tutorial_model.dart';

class VideoList extends StatefulWidget {





  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
// explicit
  Firestore fireStore = Firestore.instance;
  StreamSubscription<QuerySnapshot> streamSubsriptions;
  List<DocumentSnapshot> lists;
  List<TutorialModel> tutorialModels = [];

  

// Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = fireStore.collection('Tutorial');
    streamSubsriptions =
        await collectionReference.snapshots().listen((dataSnapshot) {
      lists = dataSnapshot.documents;

      setState(() {
        for (var list in lists) {
        String nameVideo = list.data['NameVideo'];
        String detailVideo = list.data['DetailVideo'];
        String pathImage = list.data['PathImage'];
        String pathVideo = list.data['PathVideo'];

        TutorialModel tutorialModel =
            TutorialModel(detailVideo, nameVideo, pathImage, pathVideo);

        tutorialModels.add(tutorialModel);
      }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Video')),
      body: TutorialListView(tutorialModels),
    );
  }
}
