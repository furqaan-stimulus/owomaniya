class Links {
  Links({
    this.self,
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String self;
  String first;
  String last;
  dynamic prev;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"],
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}
