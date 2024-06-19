class SongModel{

  String songName;
  
  SongModel({required this.songName});

  factory SongModel.fromjson(json){
    return SongModel(songName: json["Song_name"]);
  }
}