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
    required this.region,
    required this.companyDirector,
    required this.companyName,
    required this.companyArea,
    required this.phone,
    required this.companyEmail,
    required this.createDate,
    required this.auditStatus,
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
  final String? region;
  final String? companyDirector;
  final String? companyName;
  final int? companyArea;
  final String? phone;
  final String? companyEmail;
  final DateTime? createDate;
  final int? auditStatus;
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
      region: json["region"],
      companyDirector: json["company_director"],
      companyName: json["company_name"],
      companyArea: json["company_area"],
      phone: json["phone"],
      companyEmail: json["company_email"],
      createDate: DateTime.tryParse(json["create_date"] ?? ""),
      auditStatus: json["audit_status"],
      userEmail: json["userEmail"],
      userPhone: json["userPhone"],
      userRegion: json["userRegion"],
      userCompany: json["userCompany"],
    );
  }

  @override
  List<Object?> get props => [
    id, userId, score, auditScore, paymentStatus, auditorId, auditDate, paymentDate, categoryId, region, companyDirector, companyName, companyArea, phone, companyEmail, createDate, auditStatus, userEmail, userPhone, userRegion, userCompany, ];
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
    required this.region,
    required this.companyDirector,
    required this.companyName,
    required this.companyArea,
    required this.phone,
    required this.companyEmail,
    required this.createDate,
    required this.auditStatus,
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
  final String? region;
  final String? companyDirector;
  final String? companyName;
  final int? companyArea;
  final String? phone;
  final String? companyEmail;
  final DateTime? createDate;
  final int? auditStatus;
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
      region: json["region"],
      companyDirector: json["company_director"],
      companyName: json["company_name"],
      companyArea: json["company_area"],
      phone: json["phone"],
      companyEmail: json["company_email"],
      createDate: DateTime.tryParse(json["create_date"] ?? ""),
      auditStatus: json["audit_status"],
      userEmail: json["userEmail"],
      userPhone: json["userPhone"],
      userRegion: json["userRegion"],
      userCompany: json["userCompany"],
    );
  }

  @override
  List<Object?> get props => [
    id, userId, score, auditScore, paymentStatus, auditorId, auditDate, paymentDate, categoryId, region, companyDirector, companyName, companyArea, phone, companyEmail, createDate, auditStatus, userEmail, userPhone, userRegion, userCompany, ];
}

class Consultation extends Equatable {
  Consultation({
    required this.id,
    required this.userId,
    required this.testId,
    required this.auditorId,
    required this.paymentStatus,
    required this.auditDate,
    required this.companyDirector,
    required this.companyArea,
    required this.email,
    required this.region,
    required this.phone,
    required this.companyName,
    required this.createDate,
  });

  final int? id;
  final int? userId;
  final dynamic testId;
  final dynamic auditorId;
  final int? paymentStatus;
  final dynamic auditDate;
  final String? companyDirector;
  final int? companyArea;
  final String? email;
  final String? region;
  final String? phone;
  final String? companyName;
  final DateTime? createDate;

  factory Consultation.fromJson(Map<String, dynamic> json){
    return Consultation(
      id: json["id"],
      userId: json["user_id"],
      testId: json["test_id"],
      auditorId: json["auditor_id"],
      paymentStatus: json["payment_status"],
      auditDate: json["audit_date"],
      companyDirector: json["company_director"],
      companyArea: json["company_area"],
      email: json["email"],
      region: json["region"],
      phone: json["phone"],
      companyName: json["company_name"],
      createDate: DateTime.tryParse(json["create_date"] ?? ""),
    );
  }

  @override
  List<Object?> get props => [
    id, userId, testId, auditorId, paymentStatus, auditDate, companyDirector, companyArea, email, region, phone, companyName, createDate, ];
}
