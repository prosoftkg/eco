import 'package:equatable/equatable.dart';

class LibraryEntity extends Equatable {
  LibraryEntity({
    required this.dataProvider,
  });

  final List<DataProvider> dataProvider;

  factory LibraryEntity.fromJson(Map<String, dynamic> json){
    return LibraryEntity(
      dataProvider: json["dataProvider"] == null ? [] : List<DataProvider>.from(json["dataProvider"]!.map((x) => DataProvider.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
    dataProvider, ];
}

class DataProvider extends Equatable {
  DataProvider({
    required this.id,
    required this.title,
    required this.description,
    required this.text,
    required this.titleEn,
    required this.descriptionEn,
    required this.textEn,
    required this.titleKy,
    required this.descriptionKy,
    required this.textKy,
    required this.picture,
    required this.tagList,
    required this.catList,
    required this.typeList,
    required this.themeList,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? text;
  final String? titleEn;
  final String? descriptionEn;
  final String? textEn;
  final String? titleKy;
  final String? descriptionKy;
  final String? textKy;
  final String? picture;
  final List<CatListElement> tagList;
  final List<CatListElement> catList;
  final List<CatListElement> typeList;
  final List<CatListElement> themeList;

  factory DataProvider.fromJson(Map<String, dynamic> json){
    return DataProvider(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      text: json["text"],
      titleEn: json["title_en"],
      descriptionEn: json["description_en"],
      textEn: json["text_en"],
      titleKy: json["title_ky"],
      descriptionKy: json["description_ky"],
      textKy: json["text_ky"],
      picture: json["picture"],
      tagList: json["tagList"] == null ? [] : List<CatListElement>.from(json["tagList"]!.map((x) => CatListElement.fromJson(x))),
      catList: json["catList"] == null ? [] : List<CatListElement>.from(json["catList"]!.map((x) => CatListElement.fromJson(x))),
      typeList: json["typeList"] == null ? [] : List<CatListElement>.from(json["typeList"]!.map((x) => CatListElement.fromJson(x))),
      themeList: json["themeList"] == null ? [] : List<CatListElement>.from(json["themeList"]!.map((x) => CatListElement.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
    id, title, description, text, titleEn, descriptionEn, textEn, titleKy, descriptionKy, textKy, picture, tagList, catList, typeList, themeList, ];
}

class CatListElement extends Equatable {
  CatListElement({
    required this.id,
    required this.title,
  });

  final String? id;
  final String? title;

  factory CatListElement.fromJson(Map<String, dynamic> json){
    return CatListElement(
      id: json["id"],
      title: json["title"],
    );
  }

  @override
  List<Object?> get props => [
    id, title, ];
}
