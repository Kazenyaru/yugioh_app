// To parse this JSON data, do
//
//     final yuGiOhCardInfo = yuGiOhCardInfoFromMap(jsonString);

import 'dart:convert';

class YuGiOhCardInfo {
    YuGiOhCardInfo({
        this.data,
        this.meta,
    });

    List<Datum> data;
    Meta meta;

    factory YuGiOhCardInfo.fromJson(String str) => YuGiOhCardInfo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory YuGiOhCardInfo.fromMap(Map<String, dynamic> json) => YuGiOhCardInfo(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
        "meta": meta == null ? null : meta.toMap(),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.type,
        this.desc,
        this.race,
        this.archetype,
        this.cardImages,
        this.cardPrices,
        this.cardSets,
        this.atk,
        this.def,
        this.level,
        this.attribute,
    });

    int id;
    String name;
    String type;
    String desc;
    String race;
    String archetype;
    List<CardImage> cardImages;
    List<CardPrice> cardPrices;
    List<CardSet> cardSets;
    int atk;
    int def;
    int level;
    String attribute;

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        desc: json["desc"] == null ? null : json["desc"],
        race: json["race"] == null ? null : json["race"],
        archetype: json["archetype"] == null ? null : json["archetype"],
        cardImages: json["card_images"] == null ? null : List<CardImage>.from(json["card_images"].map((x) => CardImage.fromMap(x))),
        cardPrices: json["card_prices"] == null ? null : List<CardPrice>.from(json["card_prices"].map((x) => CardPrice.fromMap(x))),
        cardSets: json["card_sets"] == null ? null : List<CardSet>.from(json["card_sets"].map((x) => CardSet.fromMap(x))),
        atk: json["atk"] == null ? null : json["atk"],
        def: json["def"] == null ? null : json["def"],
        level: json["level"] == null ? null : json["level"],
        attribute: json["attribute"] == null ? null : json["attribute"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "desc": desc == null ? null : desc,
        "race": race == null ? null : race,
        "archetype": archetype == null ? null : archetype,
        "card_images": cardImages == null ? null : List<dynamic>.from(cardImages.map((x) => x.toMap())),
        "card_prices": cardPrices == null ? null : List<dynamic>.from(cardPrices.map((x) => x.toMap())),
        "card_sets": cardSets == null ? null : List<dynamic>.from(cardSets.map((x) => x.toMap())),
        "atk": atk == null ? null : atk,
        "def": def == null ? null : def,
        "level": level == null ? null : level,
        "attribute": attribute == null ? null : attribute,
    };
}

class CardImage {
    CardImage({
        this.id,
        this.imageUrl,
        this.imageUrlSmall,
    });

    int id;
    String imageUrl;
    String imageUrlSmall;

    factory CardImage.fromJson(String str) => CardImage.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CardImage.fromMap(Map<String, dynamic> json) => CardImage(
        id: json["id"] == null ? null : json["id"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        imageUrlSmall: json["image_url_small"] == null ? null : json["image_url_small"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "image_url": imageUrl == null ? null : imageUrl,
        "image_url_small": imageUrlSmall == null ? null : imageUrlSmall,
    };
}

class CardPrice {
    CardPrice({
        this.cardmarketPrice,
        this.tcgplayerPrice,
        this.ebayPrice,
        this.amazonPrice,
        this.coolstuffincPrice,
    });

    String cardmarketPrice;
    String tcgplayerPrice;
    String ebayPrice;
    String amazonPrice;
    String coolstuffincPrice;

    factory CardPrice.fromJson(String str) => CardPrice.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CardPrice.fromMap(Map<String, dynamic> json) => CardPrice(
        cardmarketPrice: json["cardmarket_price"] == null ? null : json["cardmarket_price"],
        tcgplayerPrice: json["tcgplayer_price"] == null ? null : json["tcgplayer_price"],
        ebayPrice: json["ebay_price"] == null ? null : json["ebay_price"],
        amazonPrice: json["amazon_price"] == null ? null : json["amazon_price"],
        coolstuffincPrice: json["coolstuffinc_price"] == null ? null : json["coolstuffinc_price"],
    );

    Map<String, dynamic> toMap() => {
        "cardmarket_price": cardmarketPrice == null ? null : cardmarketPrice,
        "tcgplayer_price": tcgplayerPrice == null ? null : tcgplayerPrice,
        "ebay_price": ebayPrice == null ? null : ebayPrice,
        "amazon_price": amazonPrice == null ? null : amazonPrice,
        "coolstuffinc_price": coolstuffincPrice == null ? null : coolstuffincPrice,
    };
}

class CardSet {
    CardSet({
        this.setName,
        this.setCode,
        this.setRarity,
        this.setRarityCode,
        this.setPrice,
    });

    String setName;
    String setCode;
    String setRarity;
    String setRarityCode;
    String setPrice;

    factory CardSet.fromJson(String str) => CardSet.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CardSet.fromMap(Map<String, dynamic> json) => CardSet(
        setName: json["set_name"] == null ? null : json["set_name"],
        setCode: json["set_code"] == null ? null : json["set_code"],
        setRarity: json["set_rarity"] == null ? null : json["set_rarity"],
        setRarityCode: json["set_rarity_code"] == null ? null : json["set_rarity_code"],
        setPrice: json["set_price"] == null ? null : json["set_price"],
    );

    Map<String, dynamic> toMap() => {
        "set_name": setName == null ? null : setName,
        "set_code": setCode == null ? null : setCode,
        "set_rarity": setRarity == null ? null : setRarity,
        "set_rarity_code": setRarityCode == null ? null : setRarityCode,
        "set_price": setPrice == null ? null : setPrice,
    };
}

class Meta {
    Meta({
        this.currentRows,
        this.totalRows,
        this.rowsRemaining,
        this.totalPages,
        this.pagesRemaining,
        this.previousPage,
        this.previousPageOffset,
        this.nextPage,
        this.nextPageOffset,
    });

    int currentRows;
    int totalRows;
    int rowsRemaining;
    int totalPages;
    int pagesRemaining;
    String previousPage;
    int previousPageOffset;
    String nextPage;
    int nextPageOffset;

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        currentRows: json["current_rows"] == null ? null : json["current_rows"],
        totalRows: json["total_rows"] == null ? null : json["total_rows"],
        rowsRemaining: json["rows_remaining"] == null ? null : json["rows_remaining"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        pagesRemaining: json["pages_remaining"] == null ? null : json["pages_remaining"],
        previousPage: json["previous_page"] == null ? null : json["previous_page"],
        previousPageOffset: json["previous_page_offset"] == null ? null : json["previous_page_offset"],
        nextPage: json["next_page"] == null ? null : json["next_page"],
        nextPageOffset: json["next_page_offset"] == null ? null : json["next_page_offset"],
    );

    Map<String, dynamic> toMap() => {
        "current_rows": currentRows == null ? null : currentRows,
        "total_rows": totalRows == null ? null : totalRows,
        "rows_remaining": rowsRemaining == null ? null : rowsRemaining,
        "total_pages": totalPages == null ? null : totalPages,
        "pages_remaining": pagesRemaining == null ? null : pagesRemaining,
        "previous_page": previousPage == null ? null : previousPage,
        "previous_page_offset": previousPageOffset == null ? null : previousPageOffset,
        "next_page": nextPage == null ? null : nextPage,
        "next_page_offset": nextPageOffset == null ? null : nextPageOffset,
    };
}
