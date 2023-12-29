import 'package:equatable/equatable.dart';

class AuditTest extends Equatable {
  AuditTest({
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
  final dynamic score;
  final dynamic auditScore;
  final int? paymentStatus;
  final int? auditorId;
  final dynamic auditDate;
  final dynamic paymentDate;
  final int? categoryId;
  final String? userEmail;
  final String? userPhone;
  final String? userRegion;
  final String? userCompany;

  factory AuditTest.fromJson(Map<String, dynamic> json){
    return AuditTest(
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
