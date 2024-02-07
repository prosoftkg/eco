class GetCertificateInfoEntity{
  final String categoryId;
  final String companyName;
  final String companyDirector;
  final String region;
  final String phone;
  final String area;
  final String testId;
  final String paymentType;
  final String businessType;
  final String staffAmount;
  final String businessDuration;
  final String textCompany;

  GetCertificateInfoEntity( {required this.businessType,required  this.staffAmount,required  this.businessDuration, required this.textCompany, required this.categoryId, required this.companyName, required this.companyDirector, required this.region, required this.phone, required this.area, required this.testId, required this.paymentType});
}