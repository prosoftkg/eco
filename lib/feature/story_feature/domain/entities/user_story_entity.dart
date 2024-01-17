import 'package:equatable/equatable.dart';

class UserHistoryEntity extends Equatable {
  UserHistoryEntity({
    required this.test,
    required this.consultation,
    required this.application,
  });

  final List<TestUser> test;
  final List<Consultation> consultation;
  final List<Application> application;

  factory UserHistoryEntity.fromJson(Map<String, dynamic> json){
    return UserHistoryEntity(
      test: json["test"] == null ? [] : List<TestUser>.from(json["test"]!.map((x) => TestUser.fromJson(x))),
      consultation: json["consultation"] == null ? [] : List<Consultation>.from(json["consultation"]!.map((x) => Consultation.fromJson(x))),
      application: json["application"] == null ? [] : List<Application>.from(json["application"]!.map((x) => Application.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
    test, consultation, application, ];
}

class Application extends Equatable {
  Application({
    required this.id,
    required this.userId,
    required this.score,
    required this.auditScore,
    required this.paymentStatus,
    required this.auditorId,
    required this.auditDate,
    required this.paymentDate,
    required this.categoryId,
    required this.userEmail,
    required this.userPhone,
    required this.userRegion,
    required this.userCompany,
  });

  final int? id;
  final int? userId;
  final int? score;
  final dynamic auditScore;
  final int? paymentStatus;
  final dynamic auditorId;
  final dynamic auditDate;
  final dynamic paymentDate;
  final int? categoryId;
  final String? userEmail;
  final String? userPhone;
  final String? userRegion;
  final String? userCompany;

  factory Application.fromJson(Map<String, dynamic> json){
    return Application(
      id: json["id"],
      userId: json["user_id"],
      score: json["score"],
      auditScore: json["audit_score"],
      paymentStatus: json["payment_status"],
      auditorId: json["auditor_id"],
      auditDate: json["audit_date"],
      paymentDate: json["payment_date"],
      categoryId: json["category_id"],
      userEmail: json["userEmail"],
      userPhone: json["userPhone"],
      userRegion: json["userRegion"],
      userCompany: json["userCompany"],
    );
  }

  @override
  List<Object?> get props => [
    id, userId, score, auditScore, paymentStatus, auditorId, auditDate, paymentDate, categoryId, userEmail, userPhone, userRegion, userCompany, ];
}

class TestUser extends Equatable {
  TestUser({
    required this.id,
    required this.userId,
    required this.score,
    required this.auditScore,
    required this.paymentStatus,
    required this.auditorId,
    required this.auditDate,
    required this.paymentDate,
    required this.categoryId,
    required this.userEmail,
    required this.userPhone,
    required this.userRegion,
    required this.userCompany,
  });

  final int? id;
  final int? userId;
  final int? score;
  final dynamic auditScore;
  final int? paymentStatus;
  final dynamic auditorId;
  final dynamic auditDate;
  final dynamic paymentDate;
  final int? categoryId;
  final String? userEmail;
  final String? userPhone;
  final String? userRegion;
  final String? userCompany;

  factory TestUser.fromJson(Map<String, dynamic> json){
    return TestUser(
      id: json["id"],
      userId: json["user_id"],
      score: json["score"],
      auditScore: json["audit_score"],
      paymentStatus: json["payment_status"],
      auditorId: json["auditor_id"],
      auditDate: json["audit_date"],
      paymentDate: json["payment_date"],
      categoryId: json["category_id"],
      userEmail: json["userEmail"],
      userPhone: json["userPhone"],
      userRegion: json["userRegion"],
      userCompany: json["userCompany"],
    );
  }

  @override
  List<Object?> get props => [
    id, userId, score, auditScore, paymentStatus, auditorId, auditDate, paymentDate, categoryId, userEmail, userPhone, userRegion, userCompany, ];
}

class Consultation extends Equatable {
  Consultation({
    required this.id,
    required this.userId,
    required this.testId,
    required this.auditorId,
    required this.paymentStatus,
    required this.auditDate,
    required this.userEmail,
    required this.userPhone,
    required this.userRegion,
    required this.userCompany,
    required this.userDirector,
  });

  final int? id;
  final int? userId;
  final dynamic testId;
  final dynamic auditorId;
  final int? paymentStatus;
  final dynamic auditDate;
  final String? userEmail;
  final String? userPhone;
  final String? userRegion;
  final String? userCompany;
  final String? userDirector;

  factory Consultation.fromJson(Map<String, dynamic> json){
    return Consultation(
      id: json["id"],
      userId: json["user_id"],
      testId: json["test_id"],
      auditorId: json["auditor_id"],
      paymentStatus: json["payment_status"],
      auditDate: json["audit_date"],
      userEmail: json["userEmail"],
      userPhone: json["userPhone"],
      userRegion: json["userRegion"],
      userCompany: json["userCompany"],
      userDirector: json["userDirector"],
    );
  }

  @override
  List<Object?> get props => [
    id, userId, testId, auditorId, paymentStatus, auditDate, userEmail, userPhone, userRegion, userCompany, userDirector, ];
}
