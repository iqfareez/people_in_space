class BingImageResponse {
  String? sType;
  Instrumentation? instrumentation;
  String? readLink;
  String? webSearchUrl;
  QueryContext? queryContext;
  int? totalEstimatedMatches;
  int? nextOffset;
  int? currentOffset;
  List<Value?>? value;
  List<PivotSuggestions?>? pivotSuggestions;
  List<RelatedSearches?>? relatedSearches;

  BingImageResponse(
      {this.sType,
      this.instrumentation,
      this.readLink,
      this.webSearchUrl,
      this.queryContext,
      this.totalEstimatedMatches,
      this.nextOffset,
      this.currentOffset,
      this.value,
      this.pivotSuggestions,
      this.relatedSearches});

  BingImageResponse.fromJson(Map<String, dynamic> json) {
    sType = json['_type'];
    instrumentation = json['instrumentation'] != null
        ? Instrumentation.fromJson(json['instrumentation'])
        : null;
    readLink = json['readLink'];
    webSearchUrl = json['webSearchUrl'];
    queryContext = json['queryContext'] != null
        ? QueryContext.fromJson(json['queryContext'])
        : null;
    totalEstimatedMatches = json['totalEstimatedMatches'];
    nextOffset = json['nextOffset'];
    currentOffset = json['currentOffset'];
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(Value.fromJson(v));
      });
    }
    if (json['pivotSuggestions'] != null) {
      pivotSuggestions = <PivotSuggestions>[];
      json['pivotSuggestions'].forEach((v) {
        pivotSuggestions!.add(PivotSuggestions.fromJson(v));
      });
    }
    if (json['relatedSearches'] != null) {
      relatedSearches = <RelatedSearches>[];
      json['relatedSearches'].forEach((v) {
        relatedSearches!.add(RelatedSearches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_type'] = this.sType;
    if (this.instrumentation != null) {
      data['instrumentation'] = this.instrumentation!.toJson();
    }
    data['readLink'] = this.readLink;
    data['webSearchUrl'] = this.webSearchUrl;
    if (this.queryContext != null) {
      data['queryContext'] = this.queryContext!.toJson();
    }
    data['totalEstimatedMatches'] = this.totalEstimatedMatches;
    data['nextOffset'] = this.nextOffset;
    data['currentOffset'] = this.currentOffset;
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v!.toJson()).toList();
    }
    if (this.pivotSuggestions != null) {
      data['pivotSuggestions'] =
          this.pivotSuggestions!.map((v) => v!.toJson()).toList();
    }
    if (this.relatedSearches != null) {
      data['relatedSearches'] =
          this.relatedSearches!.map((v) => v!.toJson()).toList();
    }
    return data;
  }
}

class Instrumentation {
  late String sType;

  Instrumentation({required this.sType});

  Instrumentation.fromJson(Map<String, dynamic> json) {
    sType = json['_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_type'] = this.sType;
    return data;
  }
}

class QueryContext {
  String? originalQuery;
  String? alterationDisplayQuery;
  String? alterationOverrideQuery;
  String? alterationMethod;
  String? alterationType;

  QueryContext(
      {this.originalQuery,
      this.alterationDisplayQuery,
      this.alterationOverrideQuery,
      this.alterationMethod,
      this.alterationType});

  QueryContext.fromJson(Map<String, dynamic> json) {
    originalQuery = json['originalQuery'];
    alterationDisplayQuery = json['alterationDisplayQuery'];
    alterationOverrideQuery = json['alterationOverrideQuery'];
    alterationMethod = json['alterationMethod'];
    alterationType = json['alterationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['originalQuery'] = this.originalQuery;
    data['alterationDisplayQuery'] = this.alterationDisplayQuery;
    data['alterationOverrideQuery'] = this.alterationOverrideQuery;
    data['alterationMethod'] = this.alterationMethod;
    data['alterationType'] = this.alterationType;
    return data;
  }
}

class Value {
  String? webSearchUrl;
  String? name;
  String? thumbnailUrl;
  String? datePublished;
  bool? isFamilyFriendly;
  String? creativeCommons;
  String? contentUrl;
  String? hostPageUrl;
  String? contentSize;
  String? encodingFormat;
  String? hostPageDisplayUrl;
  int? width;
  int? height;
  String? hostPageFavIconUrl;
  String? hostPageDomainFriendlyName;
  String? hostPageDiscoveredDate;
  Thumbnail? thumbnail;
  String? imageInsightsToken;
  InsightsMetadata? insightsMetadata;
  String? imageId;
  String? accentColor;

  Value(
      {this.webSearchUrl,
      this.name,
      this.thumbnailUrl,
      this.datePublished,
      this.isFamilyFriendly,
      this.creativeCommons,
      this.contentUrl,
      this.hostPageUrl,
      this.contentSize,
      this.encodingFormat,
      this.hostPageDisplayUrl,
      this.width,
      this.height,
      this.hostPageFavIconUrl,
      this.hostPageDomainFriendlyName,
      this.hostPageDiscoveredDate,
      this.thumbnail,
      this.imageInsightsToken,
      this.insightsMetadata,
      this.imageId,
      this.accentColor});

  Value.fromJson(Map<String, dynamic> json) {
    webSearchUrl = json['webSearchUrl'];
    name = json['name'];
    thumbnailUrl = json['thumbnailUrl'];
    datePublished = json['datePublished'];
    isFamilyFriendly = json['isFamilyFriendly'];
    creativeCommons = json['creativeCommons'];
    contentUrl = json['contentUrl'];
    hostPageUrl = json['hostPageUrl'];
    contentSize = json['contentSize'];
    encodingFormat = json['encodingFormat'];
    hostPageDisplayUrl = json['hostPageDisplayUrl'];
    width = json['width'];
    height = json['height'];
    hostPageFavIconUrl = json['hostPageFavIconUrl'];
    hostPageDomainFriendlyName = json['hostPageDomainFriendlyName'];
    hostPageDiscoveredDate = json['hostPageDiscoveredDate'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    imageInsightsToken = json['imageInsightsToken'];
    insightsMetadata = json['insightsMetadata'] != null
        ? InsightsMetadata.fromJson(json['insightsMetadata'])
        : null;
    imageId = json['imageId'];
    accentColor = json['accentColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['webSearchUrl'] = this.webSearchUrl;
    data['name'] = this.name;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['datePublished'] = this.datePublished;
    data['isFamilyFriendly'] = this.isFamilyFriendly;
    data['creativeCommons'] = this.creativeCommons;
    data['contentUrl'] = this.contentUrl;
    data['hostPageUrl'] = this.hostPageUrl;
    data['contentSize'] = this.contentSize;
    data['encodingFormat'] = this.encodingFormat;
    data['hostPageDisplayUrl'] = this.hostPageDisplayUrl;
    data['width'] = this.width;
    data['height'] = this.height;
    data['hostPageFavIconUrl'] = this.hostPageFavIconUrl;
    data['hostPageDomainFriendlyName'] = this.hostPageDomainFriendlyName;
    data['hostPageDiscoveredDate'] = this.hostPageDiscoveredDate;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    data['imageInsightsToken'] = this.imageInsightsToken;
    if (this.insightsMetadata != null) {
      data['insightsMetadata'] = this.insightsMetadata!.toJson();
    }
    data['imageId'] = this.imageId;
    data['accentColor'] = this.accentColor;
    return data;
  }
}

class Thumbnail {
  int? width;
  int? height;

  Thumbnail({this.width, this.height});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class InsightsMetadata {
  int? recipeSourcesCount;
  int? pagesIncludingCount;
  int? availableSizesCount;
  VideoObject? videoObject;

  InsightsMetadata(
      {this.recipeSourcesCount,
      this.pagesIncludingCount,
      this.availableSizesCount,
      this.videoObject});

  InsightsMetadata.fromJson(Map<String, dynamic> json) {
    recipeSourcesCount = json['recipeSourcesCount'];
    pagesIncludingCount = json['pagesIncludingCount'];
    availableSizesCount = json['availableSizesCount'];
    videoObject = json['videoObject'] != null
        ? VideoObject.fromJson(json['videoObject'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['recipeSourcesCount'] = this.recipeSourcesCount;
    data['pagesIncludingCount'] = this.pagesIncludingCount;
    data['availableSizesCount'] = this.availableSizesCount;
    if (this.videoObject != null) {
      data['videoObject'] = this.videoObject!.toJson();
    }
    return data;
  }
}

class VideoObject {
  Creator? creator;
  String? duration;
  String? embedHtml;
  bool? allowHttpsEmbed;
  String? videoId;
  bool? allowMobileEmbed;

  VideoObject(
      {this.creator,
      this.duration,
      this.embedHtml,
      this.allowHttpsEmbed,
      this.videoId,
      this.allowMobileEmbed});

  VideoObject.fromJson(Map<String, dynamic> json) {
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    duration = json['duration'];
    embedHtml = json['embedHtml'];
    allowHttpsEmbed = json['allowHttpsEmbed'];
    videoId = json['videoId'];
    allowMobileEmbed = json['allowMobileEmbed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    data['duration'] = this.duration;
    data['embedHtml'] = this.embedHtml;
    data['allowHttpsEmbed'] = this.allowHttpsEmbed;
    data['videoId'] = this.videoId;
    data['allowMobileEmbed'] = this.allowMobileEmbed;
    return data;
  }
}

class Creator {
  String? name;

  Creator({this.name});

  Creator.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class PivotSuggestions {
  String? pivot;
  List<RelatedSearches>? suggestions;

  PivotSuggestions({this.pivot, this.suggestions});

  PivotSuggestions.fromJson(Map<String, dynamic> json) {
    pivot = json['pivot'];
    if (json['suggestions'] != null) {
      suggestions = <RelatedSearches>[];
      json['suggestions'].forEach((v) {
        suggestions!.add(RelatedSearches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pivot'] = this.pivot;
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelatedSearches {
  String? text;
  String? displayText;
  String? webSearchUrl;
  String? searchLink;
  ThumbnailUrl? thumbnail;

  RelatedSearches(
      {this.text,
      this.displayText,
      this.webSearchUrl,
      this.searchLink,
      this.thumbnail});

  RelatedSearches.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    displayText = json['displayText'];
    webSearchUrl = json['webSearchUrl'];
    searchLink = json['searchLink'];
    thumbnail = json['thumbnail'] != null
        ? ThumbnailUrl.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text;
    data['displayText'] = this.displayText;
    data['webSearchUrl'] = this.webSearchUrl;
    data['searchLink'] = this.searchLink;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    return data;
  }
}

class ThumbnailUrl {
  String? thumbnailUrl;

  ThumbnailUrl({this.thumbnailUrl});

  ThumbnailUrl.fromJson(Map<String, dynamic> json) {
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
