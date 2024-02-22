import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CompanyInfo {
  final BuildContext context;
  CompanyInfo({required this.context});
  static const int BUSINESS_TYPE_HOTEL = 1;
  static const int BUSINESS_TYPE_GUEST_HOUSE = 2;
  static const int BUSINESS_TYPE_HOSTEL = 3;
  static const int BUSINESS_TYPE_RESTAURANT = 4;
  static const int BUSINESS_TYPE_CAFE = 5;
  static const int BUSINESS_TYPE_KITCHEN = 6;
  static const int BUSINESS_TYPE_COFFEE = 7;
  static const int BUSINESS_TYPE_PANSIONAT = 8;
  static const int BUSINESS_TYPE_SANATORY = 9;
  static const int BUSINESS_TYPE_HOTEL_RESTAURANT = 10;
  static const int BUSINESS_TYPE_GUEST_HOUSE_CAFE = 11;
  static const int BUSINESS_TYPE_HOSTEL_CAFE = 12;

  static const int CATEGORY_COUSINE = 3;
  static const int CATEGORY_TOURISM = 2;
  static const int CATEGORY_RESORT = 1;
  static const int CATEGORY_COMBINED = 4;

  static const int STAFF_AMOUNT_ZERO = 0;
  static const int STAFF_AMOUNT_ONE_THREE = 1;
  static const int STAFF_AMOUNT_FOUR_FIVE = 2;
  static const int STAFF_AMOUNT_SIX_TEN = 3;
  static const int STAFF_AMOUNT_TEN_ABOVE = 4;
  static const int STAFF_AMOUNT_TWENTY_ABOVE = 5;

  static const int BUSINESS_DURATION_LESS_ONE = 1;
  static const int BUSINESS_DURATION_ONE_THREE = 2;
  static const int BUSINESS_DURATION_FOUR_FIVE = 3;
  static const int BUSINESS_DURATION_SIX_ABOVE = 4;

   List<String> areaCompanyFirst(){
     return [
       context.text.upTo200SqMeters,
       context.text.area200To400SqMeters,
       context.text.area400AndAboveSqMeters
     ];
   }
   List<String> areaCompanySecond()=>[
    context.text.upTo400SqMeters,
    context.text.area400To800SqMeters,
    context.text.area800AndAboveSqMeters
  ];

  Map<int, String> getBusinessTypeList(int categoryId) {
    switch (categoryId) {
      case CATEGORY_TOURISM:
        return {
          BUSINESS_TYPE_HOTEL: context.text.hotel,
          BUSINESS_TYPE_GUEST_HOUSE: context.text.guestHouse,
          BUSINESS_TYPE_HOSTEL: context.text.hostel,
        };
      case CATEGORY_COUSINE:
        return {
          BUSINESS_TYPE_RESTAURANT: context.text.restaurant,
          BUSINESS_TYPE_CAFE: context.text.cafe,
          BUSINESS_TYPE_KITCHEN: context.text.cafeteria,
          BUSINESS_TYPE_COFFEE: context.text.coffeeShop,
        };
      case CATEGORY_RESORT:
        return {
          BUSINESS_TYPE_HOTEL: context.text.hotel,
          BUSINESS_TYPE_GUEST_HOUSE: context.text.guestHouse,
          BUSINESS_TYPE_HOSTEL: context.text.hostel,
          BUSINESS_TYPE_PANSIONAT: context.text.boardingHouse,
          BUSINESS_TYPE_SANATORY: context.text.sanatorium,
        };
      case CATEGORY_COMBINED:
        return {
          BUSINESS_TYPE_HOTEL_RESTAURANT: context.text.hotelRestaurant,
          BUSINESS_TYPE_GUEST_HOUSE_CAFE: context.text.guestHouseCafe,
          BUSINESS_TYPE_HOSTEL_CAFE: context.text.hostelMiniCafe,
        };
      default:
        return {};
    }
  }

  Map<int, String> getStaffAmountList() {
    return {
      STAFF_AMOUNT_ZERO: context.text.noEmployees,
      STAFF_AMOUNT_ONE_THREE: '1-3',
      STAFF_AMOUNT_FOUR_FIVE: '4-5',
      STAFF_AMOUNT_SIX_TEN: '6-10',
      STAFF_AMOUNT_TEN_ABOVE: context.text.moreThanTen,
      STAFF_AMOUNT_TWENTY_ABOVE: context.text.moreThanTwenty,
    };
  }

  Map<int, String> getBusinessDurationList() {
    return {
      BUSINESS_DURATION_LESS_ONE: context.text.lessThanYear,
      BUSINESS_DURATION_ONE_THREE: '1-3',
      BUSINESS_DURATION_FOUR_FIVE: '4-5',
      BUSINESS_DURATION_SIX_ABOVE: context.text.moreThanSix,
    };
  }
}
