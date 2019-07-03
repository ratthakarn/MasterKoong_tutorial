import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
// explicit
  Firestore fireStore = Firestore.instance;
  StreamSubscription<QuerySnapshot> streamSubsriptions;
  List<DocumentSnapshot> lists;

// Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = fireStore.collection('Tutorial');
    streamSubsriptions = await collectionReference.snapshots().listen((dataSnapshot){

      lists = dataSnapshot.documents;

      for (var list in lists) {

        String nameVideo = list.data['NameVideo'];
        print('nameVideo==> $nameVideo');
        
      }

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Video')),
      body: Text('body'),
    );
  }
}
