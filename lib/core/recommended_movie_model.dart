// ignore_for_file: file_names

class RecommendedMovie{
  String title;
  String language;
  String overview;
  String imdbLink;

  RecommendedMovie({
    required this.title,
    required this.language,
    required this.overview,
    required this.imdbLink,required});

    factory RecommendedMovie.fromJson(json){
      return RecommendedMovie(
        title:json["Title"], 
        language:json["language"],
         overview:json["Overview"],
          imdbLink:json["IMDB_Link"]
          );
    }

}