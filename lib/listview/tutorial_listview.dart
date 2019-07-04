import 'package:flutter/material.dart';
import 'package:masterkoong_tutorial/models/tutorial_model.dart';

class TutorialListView extends StatelessWidget {
  List<TutorialModel> tutorialModels;
  TutorialListView(this.tutorialModels);

  Widget showName(int index) {
    return Text(tutorialModels[index].nameVideo);
  }

  Widget showDetail(int index) {
    return Text(tutorialModels[index].detailVideo);
  }

  Widget showImageTutorial(int index) {
    return Container(
      height: 100.0,
      width: 150.0,
      child: Image.network(
        tutorialModels[index].pathImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget groupText(int index) {
    return Container(
      child: Column(
        children: <Widget>[
          showName(index),
          showDetail(index),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tutorialModels.length,
      itemBuilder: (context, int index) {
        return Container(
          child: Row(
            children: <Widget>[
              showImageTutorial(index),
              groupText(index),
            ],
          ),
        );
      },
    );
  }
}
