

import 'package:flutter/material.dart';


class ComeFunziona extends StatefulWidget {
  @override
  ComeFunzionaState createState() {
    return ComeFunzionaState();
  }

}


class ComeFunzionaState extends State<ComeFunziona> {



  @override
  Widget build(BuildContext context) {
    return Center();

    /*  return Scaffold(
      appBar: appbarSenzaActions("Come Funziona"),

      body: StreamBuilder(
        stream: getvideocomefunziona().asBroadcastStream(),
        builder: (context,snapshot) {
          if(!snapshot.hasData){
            return const Center(child: Text(" "));
          }
          var dato = snapshot.data as dynamic;
          return ListView.builder(itemBuilder: (BuildContext context, int index) { return creaelementosingolo(dato[index], context);},
            itemCount: dato.length,);
        },
      ),
    );
  }


  Widget creaelementosingolo(VideoComeFunziona video, context){
    YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: video.videosource!,
        flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false
        )
    );

    return Column(
      children: [
        const SizedBox(height: 10),
        Text(video.titolo!),
        const SizedBox(height: 10),
        Center(
            child: YoutubePlayer(controller: controller)
        ),
        const SizedBox(height: 10)
      ],
    );
  } */
    
  }
}