class ShazamSongModel {
  String? id;
  bool? readable;
  String? title;
  String? titleShort;
  String? titleVersion;
  String? isrc;
  String? link;
  String? share;
  String? duration;
  int? trackPosition;
  int? diskNumber;
  String? rank;
  DateTime? releaseDate;
  bool? explicitLyrics;
  int? explicitContentLyrics;
  int? explicitContentCover;
  String? preview;
  double? bpm;
  double? gain;
  List<String>? availableCountries;
  List<Contributor>? contributors;
  String? md5Image;
  String? trackToken;
  Artist? artist;
  Album? album;
  String? type;

  ShazamSongModel({
    this.id,
    this.readable,
    this.title,
    this.titleShort,
    this.titleVersion,
    this.isrc,
    this.link,
    this.share,
    this.duration,
    this.trackPosition,
    this.diskNumber,
    this.rank,
    this.releaseDate,
    this.explicitLyrics,
    this.explicitContentLyrics,
    this.explicitContentCover,
    this.preview,
    this.bpm,
    this.gain,
    this.availableCountries,
    this.contributors,
    this.md5Image,
    this.trackToken,
    this.artist,
    this.album,
    this.type,
  });

  factory ShazamSongModel.fromJson(Map<String, dynamic> json) =>
      ShazamSongModel(
        id: json['id']?.toString(),
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: json["title_version"],
        isrc: json["isrc"],
        link: json["link"],
        share: json["share"],
        duration: json["duration"]?.toString(),
        trackPosition: json["track_position"],
        diskNumber: json["disk_number"],
        rank: json["rank"]?.toString(),
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : null,
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        bpm: json["bpm"]?.toDouble(),
        gain: json["gain"]?.toDouble(),
        availableCountries: json["available_countries"] != null
            ? List<String>.from(json["available_countries"].map((x) => x))
            : null,
        contributors: json["contributors"] != null
            ? List<Contributor>.from(
                json["contributors"].map((x) => Contributor.fromJson(x)))
            : null,
        md5Image: json["md5_image"],
        trackToken: json["track_token"],
        artist: json["artist"] != null ? Artist.fromJson(json["artist"]) : null,
        album: json["album"] != null ? Album.fromJson(json["album"]) : null,
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersion,
        "isrc": isrc,
        "link": link,
        "share": share,
        "duration": duration,
        "track_position": trackPosition,
        "disk_number": diskNumber,
        "rank": rank,
        "release_date": releaseDate != null
            ? "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}"
            : null,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "bpm": bpm,
        "gain": gain,
        "available_countries": availableCountries != null
            ? List<dynamic>.from(availableCountries!.map((x) => x))
            : null,
        "contributors": contributors != null
            ? List<dynamic>.from(contributors!.map((x) => x.toJson()))
            : null,
        "md5_image": md5Image,
        "track_token": trackToken,
        "artist": artist?.toJson(),
        "album": album?.toJson(),
        "type": type,
      };
}

class Album {
  String? id;
  String? title;
  String? link;
  String? cover;
  String? coverSmall;
  String? coverMedium;
  String? coverBig;
  String? coverXl;
  String? md5Image;
  DateTime? releaseDate;
  String? tracklist;
  String? type;

  Album({
    this.id,
    this.title,
    this.link,
    this.cover,
    this.coverSmall,
    this.coverMedium,
    this.coverBig,
    this.coverXl,
    this.md5Image,
    this.releaseDate,
    this.tracklist,
    this.type,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"]?.toString(),
        title: json["title"],
        link: json["link"],
        cover: json["cover"],
        coverSmall: json["cover_small"],
        coverMedium: json["cover_medium"],
        coverBig: json["cover_big"],
        coverXl: json["cover_xl"],
        md5Image: json["md5_image"],
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : null,
        tracklist: json["tracklist"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "md5_image": md5Image,
        "release_date": releaseDate != null
            ? "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}"
            : null,
        "tracklist": tracklist,
        "type": type,
      };
}

class Artist {
  String? id;
  String? name;
  String? link;
  String? share;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;
  bool? radio;
  String? tracklist;
  String? type;

  Artist({
    this.id,
    this.name,
    this.link,
    this.share,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    this.radio,
    this.tracklist,
    this.type,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"]?.toString(),
        name: json["name"],
        link: json["link"],
        share: json["share"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        radio: json["radio"],
        tracklist: json["tracklist"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "share": share,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "radio": radio,
        "tracklist": tracklist,
        "type": type,
      };
}

class Contributor {
  int? id;
  String? name;
  String? link;
  String? share;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;
  bool? radio;
  String? tracklist;
  String? type;
  String? role;

  Contributor({
    this.id,
    this.name,
    this.link,
    this.share,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    this.radio,
    this.tracklist,
    this.type,
    this.role,
  });

  factory Contributor.fromJson(Map<String, dynamic> json) => Contributor(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        share: json["share"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        radio: json["radio"],
        tracklist: json["tracklist"],
        type: json["type"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "share": share,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "radio": radio,
        "tracklist": tracklist,
        "type": type,
        "role": role,
      };
}
