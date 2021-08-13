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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_type'] = sType;
    if (instrumentation != null) {
      data['instrumentation'] = instrumentation!.toJson();
    }
    data['readLink'] = readLink;
    data['webSearchUrl'] = webSearchUrl;
    if (queryContext != null) {
      data['queryContext'] = queryContext!.toJson();
    }
    data['totalEstimatedMatches'] = totalEstimatedMatches;
    data['nextOffset'] = nextOffset;
    data['currentOffset'] = currentOffset;
    if (value != null) {
      data['value'] = value!.map((v) => v!.toJson()).toList();
    }
    if (pivotSuggestions != null) {
      data['pivotSuggestions'] =
          pivotSuggestions!.map((v) => v!.toJson()).toList();
    }
    if (relatedSearches != null) {
      data['relatedSearches'] =
          relatedSearches!.map((v) => v!.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_type'] = sType;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['originalQuery'] = originalQuery;
    data['alterationDisplayQuery'] = alterationDisplayQuery;
    data['alterationOverrideQuery'] = alterationOverrideQuery;
    data['alterationMethod'] = alterationMethod;
    data['alterationType'] = alterationType;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['webSearchUrl'] = webSearchUrl;
    data['name'] = name;
    data['thumbnailUrl'] = thumbnailUrl;
    data['datePublished'] = datePublished;
    data['isFamilyFriendly'] = isFamilyFriendly;
    data['creativeCommons'] = creativeCommons;
    data['contentUrl'] = contentUrl;
    data['hostPageUrl'] = hostPageUrl;
    data['contentSize'] = contentSize;
    data['encodingFormat'] = encodingFormat;
    data['hostPageDisplayUrl'] = hostPageDisplayUrl;
    data['width'] = width;
    data['height'] = height;
    data['hostPageFavIconUrl'] = hostPageFavIconUrl;
    data['hostPageDomainFriendlyName'] = hostPageDomainFriendlyName;
    data['hostPageDiscoveredDate'] = hostPageDiscoveredDate;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['imageInsightsToken'] = imageInsightsToken;
    if (insightsMetadata != null) {
      data['insightsMetadata'] = insightsMetadata!.toJson();
    }
    data['imageId'] = imageId;
    data['accentColor'] = accentColor;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipeSourcesCount'] = recipeSourcesCount;
    data['pagesIncludingCount'] = pagesIncludingCount;
    data['availableSizesCount'] = availableSizesCount;
    if (videoObject != null) {
      data['videoObject'] = videoObject!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    data['duration'] = duration;
    data['embedHtml'] = embedHtml;
    data['allowHttpsEmbed'] = allowHttpsEmbed;
    data['videoId'] = videoId;
    data['allowMobileEmbed'] = allowMobileEmbed;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pivot'] = pivot;
    if (suggestions != null) {
      data['suggestions'] = suggestions!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['displayText'] = displayText;
    data['webSearchUrl'] = webSearchUrl;
    data['searchLink'] = searchLink;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
