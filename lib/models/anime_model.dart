class Anime {
  final Data data;

  Anime({
    required this.data,
  });
}

class Data {
  final int malId;
  final String url;
  final Map<String, Image> images;
  final Trailer trailer;
  final bool approved;
  final List<Title> titles;
  final String title;
  final String titleEnglish;
  final String titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String source;
  final int episodes;
  final String status;
  final bool airing;
  final Aired aired;
  final String duration;
  final String rating;
  final int score;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int members;
  final int favorites;
  final String synopsis;
  final String background;
  final String season;
  final int year;
  final Broadcast broadcast;
  final List<Demographic> producers;
  final List<Demographic> licensors;
  final List<Demographic> studios;
  final List<Demographic> genres;
  final List<Demographic> explicitGenres;
  final List<Demographic> themes;
  final List<Demographic> demographics;
  final List<Relation> relations;
  final Theme theme;
  final List<External> dataExternal;
  final List<External> streaming;

  Data({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
    required this.relations,
    required this.theme,
    required this.dataExternal,
    required this.streaming,
  });
  // factory Data.fromJson(Map<String, dynamic> json) => Data(
  //   malId: json["mal_id"],
  //   url: json["url"],
  //   images: json["images"],
  //   trailer: json["trailer"], 
  //   approved: json["approved"],
  //   titles: json["titles"],
  //   title:  json["title"],


    

  // );
}

class Aired {
  final String from;
  final String to;
  final Prop prop;

  Aired({
    required this.from,
    required this.to,
    required this.prop,
  });
}

class Prop {
  final From from;
  final From to;
  final String string;

  Prop({
    required this.from,
    required this.to,
    required this.string,
  });
}

class From {
  final int day;
  final int month;
  final int year;

  From({
    required this.day,
    required this.month,
    required this.year,
  });
}

class Broadcast {
  final String day;
  final String time;
  final String timezone;
  final String string;

  Broadcast({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });
}

class External {
  final String name;
  final String url;

  External({
    required this.name,
    required this.url,
  });
}

class Demographic {
  final int malId;
  final String type;
  final String name;
  final String url;

  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });
}

class Image {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  Image({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });
}

class Relation {
  final String relation;
  final List<Demographic> entry;

  Relation({
    required this.relation,
    required this.entry,
  });
}

class Theme {
  final List<String> openings;
  final List<String> endings;

  Theme({
    required this.openings,
    required this.endings,
  });
}

class Title {
  final String type;
  final String title;

  Title({
    required this.type,
    required this.title,
  });
}

class Trailer {
  final String youtubeId;
  final String url;
  final String embedUrl;

  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
  });
}
