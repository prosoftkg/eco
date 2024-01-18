import 'package:equatable/equatable.dart';

class AuditConsult extends Equatable {
  AuditConsult({
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
  final DateTime? auditDate;
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

  factory AuditConsult.fromJson(Map<String, dynamic> json){
    return AuditConsult(
      id: json["id"],
      userId: json["user_id"],
      score: json["score"],
      auditScore: json["audit_score"],
      paymentStatus: json["payment_status"],
      auditorId: json["auditor_id"],
      auditDate: DateTime.tryParse(json["audit_date"] ?? ""),
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
      userEmail: json["email"],
      userPhone: json["phone"],
      userRegion: json["region"],
      userCompany: json["company_name"],
    );
  }

  @override
  List<Object?> get props => [
    id, userId, score, auditScore, paymentStatus, auditorId, auditDate, paymentDate, categoryId, region, companyDirector, companyName, companyArea, phone, companyEmail, createDate, auditStatus, userEmail, userPhone, userRegion, userCompany, ];
}
