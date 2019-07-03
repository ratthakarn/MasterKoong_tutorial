import 'package:flutter/material.dart';
import 'package:masterkoong_tutorial/screens/my_play_video.dart';
import 'package:masterkoong_tutorial/screens/video_list.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoList(),
    );
  }
}
