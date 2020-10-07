import 'dart:convert';

JokesApi jokesFromJson(String str) => JokesApi.fromJson(json.decode(str));

String jokesToJson(JokesApi data) => json.encode(data.toJson());

class JokesApi {
  JokesApi({
    this.type,
    this.value,
  });

  String type;
  List<Joke> value;

  factory JokesApi.fromJson(Map<String, dynamic> json) => JokesApi(
        type: json["type"],
        value: json['value'] != null
            ? List<Joke>.from(json["value"].map((x) => Joke.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class Joke {
  Joke({
    this.id,
    this.joke,
    this.categories,
  });

  int id;
  String joke;
  List<String> categories;

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        id: json["id"] ?? 0,
        joke: json["joke"] ?? '',
        categories: List<String>.from(json["categories"].map((x) => x)) ?? [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "joke": joke,
        "categories": List<String>.from(categories.map((x) => x)),
      };
}
