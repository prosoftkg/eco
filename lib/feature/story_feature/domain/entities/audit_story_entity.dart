import 'package:equatable/equatable.dart';

class AuditStoryEntity extends Equatable {
  AuditStoryEntity({
    required this.test,
    required this.consultation,
  });

  final List<Test> test;
  final List<Consultation> consultation;

  factory AuditStoryEntity.fromJson(Map<String, dynamic> json){
    return AuditStoryEntity(
      test: json["test"] == null ? [] : List<Test>.from(json["test"]!.map((x) => Test.fromJson(x))),
      consultation: json["consultation"] == null ? [] : List<Consultation>.from(json["consultation"]!.map((x) => Consultation.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
    test, consultation, ];
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
  final int? auditorId;
  final int? paymentStatus;
  final DateTime? auditDate;
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
      auditDate: DateTime.tryParse(json["audit_date"] ?? ""),
      userEmail: json["email"],
      userPhone: json["phone"],
      userRegion: json["region"],
      userCompany: json["company_name"],
      userDirector: json["company_director"],
    );
  }

  @override
  List<Object?> get props => [
    id, userId, testId, auditorId, paymentStatus, auditDate, userEmail, userPhone, userRegion, userCompany, userDirector, ];
}

class Test extends Equatable {
  Test({
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
  final int? auditScore;
  final int? paymentStatus;
  final int? auditorId;
  final DateTime? auditDate;
  final dynamic paymentDate;
  final int? categoryId;
  final String? userEmail;
  final String? userPhone;
  final String? userRegion;
  final String? userCompany;

  factory Test.fromJson(Map<String, dynamic> json){
    return Test(
      id: json["id"],
      userId: json["user_id"],
      score: json["score"],
      auditScore: json["audit_score"],
      paymentStatus: json["payment_status"],
      auditorId: json["auditor_id"],
      auditDate: DateTime.tryParse(json["audit_date"] ?? ""),
      paymentDate: json["payment_date"],
      categoryId: json["category_id"],
      userEmail: json["email"],
      userPhone: json["phone"],
      userRegion: json["region"],
      userCompany: json["company_name"],
    );
  }

  @override
  List<Object?> get props => [
    id, userId, score, auditScore, paymentStatus, auditorId, auditDate, paymentDate, categoryId, userEmail, userPhone, userRegion, userCompany, ];
}
