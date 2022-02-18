class WatchListSettings {
  String watchListLink;
  int pages;
  int limit;
  String mainQuery;
  String itemIdQuery;
  String imagePathQuery;
  String titleQuery;
  String subtitleQuery;
  String typeQuery;
  String descQuery;

  WatchListSettings(
      {required this.watchListLink,
      required this.pages,
      required this.limit,
      required this.mainQuery,
      required this.itemIdQuery,
      required this.imagePathQuery,
      required this.titleQuery,
      required this.subtitleQuery,
      required this.typeQuery,
      required this.descQuery});

  factory WatchListSettings.empty() => WatchListSettings(
        watchListLink: '',
        pages: 0,
        limit: 0,
        mainQuery: '',
        itemIdQuery: '',
        imagePathQuery: '',
        titleQuery: '',
        subtitleQuery: '',
        typeQuery: '',
        descQuery: '',
      );

  factory WatchListSettings.fromMap(Map<String, dynamic> map) =>
      WatchListSettings(
        watchListLink: map['watchListLink'],
        pages: map['pages'],
        limit: map['limit'],
        mainQuery: map['mainQuery'],
        itemIdQuery: map['itemIdQuery'],
        imagePathQuery: map['imagePathQuery'],
        titleQuery: map['titleQuery'],
        subtitleQuery: map['subtitleQuery'],
        typeQuery: map['typeQuery'],
        descQuery: map['descQuery'],
      );

  Map<String, dynamic> toMap() => {
        'watchListLink': watchListLink,
        'pages': pages,
        'limit': limit,
        'mainQuery': mainQuery,
        'itemIdQuery': itemIdQuery,
        'imagePathQuery': imagePathQuery,
        'titleQuery': titleQuery,
        'subtitleQuery': subtitleQuery,
        'typeQuery': typeQuery,
        'descQuery': descQuery,
      };

  @override
  String toString() {
    return 'WatchListSettings{watchListLink: $watchListLink, pages: $pages, limit: $limit, mainQuery: $mainQuery, itemIdQuery: $itemIdQuery, imagePathQuery: $imagePathQuery, titleQuery: $titleQuery, subtitleQuery: $subtitleQuery, typeQuery: $typeQuery, descQuery: $descQuery}';
  }
}
