

// kg797BU328c
// hBtPDDXp37w
// Ne2pICxP-Vo


Stream<List<VideoComeFunziona>> getvideocomefunziona(){
  return dummydata();
}

int numeroelementicomefunziona(){
  return 3;
}

Stream<List<VideoComeFunziona>> dummydata(){
  List<VideoComeFunziona> listaoggetti =  List.empty(growable: true);

  VideoComeFunziona v1 = VideoComeFunziona(titolo: "Tutorial 1", videosource: "e11Mzy2kYnY");
  VideoComeFunziona v2 = VideoComeFunziona(titolo: "Tutorial 2", videosource: "e11Mzy2kYnY");
  VideoComeFunziona v3 = VideoComeFunziona(titolo: "Tutorial 3", videosource: "e11Mzy2kYnY");

  listaoggetti.add(v1);
  listaoggetti.add(v2);
  listaoggetti.add(v3);

  List<List<VideoComeFunziona>> result =  List.empty(growable: true);

  result.add(listaoggetti);

  return Stream.fromIterable(result);
}

class VideoComeFunziona {
  String? titolo;
  String? videosource;

  VideoComeFunziona({this.titolo,this.videosource});
}