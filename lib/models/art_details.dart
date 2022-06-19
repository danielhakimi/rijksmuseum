class ArtDetails {
  int? elapsedMilliseconds;
  ArtObject? artObject;
  ArtObjectPage? artObjectPage;

  ArtDetails({this.elapsedMilliseconds, this.artObject, this.artObjectPage});
}

class ArtObject {
  Links? links;
  String? id;
  String? priref;
  String? objectNumber;
  String? language;
  String? title;
  Null? copyrightHolder;
  WebImage? webImage;
  List<Colors>? colors;
  List<ColorsWithNormalization>? colorsWithNormalization;
  List<NormalizedColors>? normalizedColors;
  List<Normalized32Colors>? normalized32Colors;
  List<String>? titles;
  String? description;
  Null? labelText;
  List<String>? objectTypes;
  List<String>? objectCollection;
  List<Makers>? makers;
  List<PrincipalMakers>? principalMakers;
  String? plaqueDescriptionDutch;
  String? plaqueDescriptionEnglish;
  String? principalMaker;
  Null? artistRole;
  List<Null>? associations;
  Acquisition? acquisition;
  List<Null>? exhibitions;
  List<String>? materials;
  List<Null>? techniques;
  List<String>? productionPlaces;
  Dating? dating;
  Classification? classification;
  bool? hasImage;
  List<String>? historicalPersons;
  List<Null>? inscriptions;
  List<Null>? documentation;
  List<Null>? catRefRPK;
  String? principalOrFirstMaker;
  List<Dimensions>? dimensions;
  List<Null>? physicalProperties;
  String? physicalMedium;
  String? longTitle;
  String? subTitle;
  String? scLabelLine;
  Label? label;
  bool? showImage;
  String? location;

  ArtObject(
      {this.links,
      this.id,
      this.priref,
      this.objectNumber,
      this.language,
      this.title,
      this.copyrightHolder,
      this.webImage,
      this.colors,
      this.colorsWithNormalization,
      this.normalizedColors,
      this.normalized32Colors,
      this.titles,
      this.description,
      this.labelText,
      this.objectTypes,
      this.objectCollection,
      this.makers,
      this.principalMakers,
      this.plaqueDescriptionDutch,
      this.plaqueDescriptionEnglish,
      this.principalMaker,
      this.artistRole,
      this.associations,
      this.acquisition,
      this.exhibitions,
      this.materials,
      this.techniques,
      this.productionPlaces,
      this.dating,
      this.classification,
      this.hasImage,
      this.historicalPersons,
      this.inscriptions,
      this.documentation,
      this.catRefRPK,
      this.principalOrFirstMaker,
      this.dimensions,
      this.physicalProperties,
      this.physicalMedium,
      this.longTitle,
      this.subTitle,
      this.scLabelLine,
      this.label,
      this.showImage,
      this.location});
}

class WebImage {
  String? guid;
  int? offsetPercentageX;
  int? offsetPercentageY;
  int? width;
  int? height;
  String? url;

  WebImage(
      {this.guid,
      this.offsetPercentageX,
      this.offsetPercentageY,
      this.width,
      this.height,
      this.url});
}

class Makers {
  String? name;
  String? unFixedName;
  Null? placeOfBirth;
  Null? dateOfBirth;
  Null? dateOfBirthPrecision;
  Null? dateOfDeath;
  Null? dateOfDeathPrecision;
  Null? placeOfDeath;
  List<Null>? occupation;
  List<String>? roles;
  Null? nationality;
  Null? biography;
  List<String>? productionPlaces;
  Null? qualification;
  String? labelDesc;

  Makers(
      {this.name,
      this.unFixedName,
      this.placeOfBirth,
      this.dateOfBirth,
      this.dateOfBirthPrecision,
      this.dateOfDeath,
      this.dateOfDeathPrecision,
      this.placeOfDeath,
      this.occupation,
      this.roles,
      this.nationality,
      this.biography,
      this.productionPlaces,
      this.qualification,
      this.labelDesc});
}

class Dating {
  String? presentingDate;
  int? sortingDate;
  int? period;
  int? yearEarly;
  int? yearLate;

  Dating(
      {this.presentingDate,
      this.sortingDate,
      this.period,
      this.yearEarly,
      this.yearLate});
}

class Classification {
  List<String>? iconClassIdentifier;
  List<String>? iconClassDescription;
  List<Null>? motifs;
  List<Null>? events;
  List<String>? periods;
  List<String>? places;
  List<String>? people;
  List<String>? objectNumbers;

  Classification(
      {this.iconClassIdentifier,
      this.iconClassDescription,
      this.motifs,
      this.events,
      this.periods,
      this.places,
      this.people,
      this.objectNumbers});

  Classification.fromJson(Map<String, dynamic> json) {
    iconClassIdentifier = json['iconClassIdentifier'].cast<String>();
    iconClassDescription = json['iconClassDescription'].cast<String>();
    if (json['motifs'] != null) {
      motifs = <Null>[];
      json['motifs'].forEach((v) {
        motifs!.add(new Null.fromJson(v));
      });
    }
    if (json['events'] != null) {
      events = <Null>[];
      json['events'].forEach((v) {
        events!.add(new Null.fromJson(v));
      });
    }
    periods = json['periods'].cast<String>();
    places = json['places'].cast<String>();
    people = json['people'].cast<String>();
    objectNumbers = json['objectNumbers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconClassIdentifier'] = this.iconClassIdentifier;
    data['iconClassDescription'] = this.iconClassDescription;
    if (this.motifs != null) {
      data['motifs'] = this.motifs!.map((v) => v.toJson()).toList();
    }
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    data['periods'] = this.periods;
    data['places'] = this.places;
    data['people'] = this.people;
    data['objectNumbers'] = this.objectNumbers;
    return data;
  }
}

class Dimensions {
  String? unit;
  String? type;
  String? precision;
  String? part;
  String? value;

  Dimensions({this.unit, this.type, this.precision, this.part, this.value});

  Dimensions.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    type = json['type'];
    precision = json['precision'];
    part = json['part'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['type'] = this.type;
    data['precision'] = this.precision;
    data['part'] = this.part;
    data['value'] = this.value;
    return data;
  }
}

class Label {
  String? title;
  String? makerLine;
  String? description;
  String? notes;
  String? date;

  Label({this.title, this.makerLine, this.description, this.notes, this.date});

  Label.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    makerLine = json['makerLine'];
    description = json['description'];
    notes = json['notes'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['makerLine'] = this.makerLine;
    data['description'] = this.description;
    data['notes'] = this.notes;
    data['date'] = this.date;
    return data;
  }
}

class ArtObjectPage {
  String? id;
  List<Null>? similarPages;
  String? lang;
  String? objectNumber;
  List<Null>? tags;
  String? plaqueDescription;
  Null? audioFile1;
  Null? audioFileLabel1;
  Null? audioFileLabel2;
  String? createdOn;
  String? updatedOn;
  AdlibOverrides? adlibOverrides;

  ArtObjectPage(
      {this.id,
      this.similarPages,
      this.lang,
      this.objectNumber,
      this.tags,
      this.plaqueDescription,
      this.audioFile1,
      this.audioFileLabel1,
      this.audioFileLabel2,
      this.createdOn,
      this.updatedOn,
      this.adlibOverrides});

  ArtObjectPage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['similarPages'] != null) {
      similarPages = <Null>[];
      json['similarPages'].forEach((v) {
        similarPages!.add(new Null.fromJson(v));
      });
    }
    lang = json['lang'];
    objectNumber = json['objectNumber'];
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        tags!.add(new Null.fromJson(v));
      });
    }
    plaqueDescription = json['plaqueDescription'];
    audioFile1 = json['audioFile1'];
    audioFileLabel1 = json['audioFileLabel1'];
    audioFileLabel2 = json['audioFileLabel2'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    adlibOverrides = json['adlibOverrides'] != null
        ? new AdlibOverrides.fromJson(json['adlibOverrides'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.similarPages != null) {
      data['similarPages'] = this.similarPages!.map((v) => v.toJson()).toList();
    }
    data['lang'] = this.lang;
    data['objectNumber'] = this.objectNumber;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['plaqueDescription'] = this.plaqueDescription;
    data['audioFile1'] = this.audioFile1;
    data['audioFileLabel1'] = this.audioFileLabel1;
    data['audioFileLabel2'] = this.audioFileLabel2;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    if (this.adlibOverrides != null) {
      data['adlibOverrides'] = this.adlibOverrides!.toJson();
    }
    return data;
  }
}

class AdlibOverrides {
  Null? titel;
  Null? maker;
  Null? etiketText;

  AdlibOverrides({this.titel, this.maker, this.etiketText});

  AdlibOverrides.fromJson(Map<String, dynamic> json) {
    titel = json['titel'];
    maker = json['maker'];
    etiketText = json['etiketText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titel'] = this.titel;
    data['maker'] = this.maker;
    data['etiketText'] = this.etiketText;
    return data;
  }
}
