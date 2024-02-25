class Joke {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxCount;
  int? captions;

  Joke(
      {this.id,
      this.name,
      this.url,
      this.width,
      this.height,
      this.boxCount,
      this.captions});

  Joke.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    boxCount = json['box_count'];
    captions = json['captions'];
  }
}
