import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:auto_orientation/auto_orientation.dart';

class MyPlayVideo extends StatefulWidget {
  @override
  _MyPlayVideoState createState() => _MyPlayVideoState();
}

class _MyPlayVideoState extends State<MyPlayVideo> {
//Explicit
  String urlVideo = 'https://www.androidthai.in.th/tae/Video/TestVideo.mp4';
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

//Method

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Set Orintation
// AutoOrientation.landscapeRightMode();

    

    // setup Video
    videoPlayerController = VideoPlayerController.network(urlVideo);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Video'),
      ),
      body: Center(
        child: Chewie(controller: chewieController,),
      ),
    );
  }
}
