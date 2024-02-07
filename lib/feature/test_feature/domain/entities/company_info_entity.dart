class CompanyInfo {
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

  Map<int, String> getBusinessTypeList(int categoryId) {
    switch (categoryId) {
      case CATEGORY_TOURISM:
        return {
          BUSINESS_TYPE_HOTEL: 'Отель/Гостиница',
          BUSINESS_TYPE_GUEST_HOUSE: 'Гостевой дом',
          BUSINESS_TYPE_HOSTEL: 'Хостел',
        };
      case CATEGORY_COUSINE:
        return {
          BUSINESS_TYPE_RESTAURANT: 'Ресторан',
          BUSINESS_TYPE_CAFE: 'Кафе',
          BUSINESS_TYPE_KITCHEN: 'Столовая',
          BUSINESS_TYPE_COFFEE: 'Кофейня',
        };
      case CATEGORY_RESORT:
        return {
          BUSINESS_TYPE_HOTEL: 'Отель/Гостиница',
          BUSINESS_TYPE_GUEST_HOUSE: 'Гостевой дом',
          BUSINESS_TYPE_HOSTEL: 'Хостел',
          BUSINESS_TYPE_PANSIONAT: 'Пансионат',
          BUSINESS_TYPE_SANATORY: 'Санаторий',
        };
      case CATEGORY_COMBINED:
        return {
          BUSINESS_TYPE_HOTEL_RESTAURANT: 'Отель/Гостиница + Ресторан',
          BUSINESS_TYPE_GUEST_HOUSE_CAFE: 'Гостевой дом + Кафе',
          BUSINESS_TYPE_HOSTEL_CAFE: 'Хостел + Миникафе',
        };
      default:
        return {};
    }
  }

  Map<int, String> getStaffAmountList() {
    return {
      STAFF_AMOUNT_ZERO: 'Нет сотрудников',
      STAFF_AMOUNT_ONE_THREE: '1-3',
      STAFF_AMOUNT_FOUR_FIVE: '4-5',
      STAFF_AMOUNT_SIX_TEN: '6-10',
      STAFF_AMOUNT_TEN_ABOVE: 'Больше десяти',
      STAFF_AMOUNT_TWENTY_ABOVE: 'Больше двадцати',
    };
  }

  Map<int, String> getBusinessDurationList() {
    return {
      BUSINESS_DURATION_LESS_ONE: 'Меньше года',
      BUSINESS_DURATION_ONE_THREE: '1-3',
      BUSINESS_DURATION_FOUR_FIVE: '4-5',
      BUSINESS_DURATION_SIX_ABOVE: 'Больше шести',
    };
  }
}
