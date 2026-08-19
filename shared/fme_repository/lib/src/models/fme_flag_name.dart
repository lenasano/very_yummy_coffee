/// Constants that exactly match feature flag names in Harness FME.
///
/// Use these instead of raw string literals to get compile-time safety
/// for flag names across client and server code.
/// 
/// Usage: To get the feature flag name as a string, call
///   FmeFlagName.offerDiscount.value); // Output: offer_discount
enum FmeFlagName {
  discountCouponButtonColor('coupon_button_color'),
  displaySuggestions('display_suggestions'),
  offerDiscount('offer_discount');

  const FmeFlagName(this.value);

  final String value;

  @override
  String toString() => value;  // e.g. print('Value is ${FmeFlagName.offerDiscount}.') // Output: Value is offer_discount.

  static bool exists(String givenFlagName) =>
    FmeFlagName.values.any((e) => e.value == givenFlagName);

  static FmeFlagName? fromString(String givenFlagName) =>
    !exists(givenFlagName) ? 
      null : 
      FmeFlagName.values.firstWhere(
        (f) => f.value == givenFlagName
      );

  bool equals(String? flagName) => value == flagName;
}
