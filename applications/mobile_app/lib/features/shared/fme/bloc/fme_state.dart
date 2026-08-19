part of 'fme_bloc.dart';

@MappableEnum()
enum FmeStatus { loading, success, failure }

@MappableClass()
class FmeState with FmeStateMappable {
  const FmeState({
    this.status = FmeStatus.loading,
    this.flagResponse,
  });

  final FmeStatus status;

  /// FlagResponses for the given flagName only; other
  /// FlagResponses are filtered out by [FmeBloc].
  final FlagResponse? flagResponse;

  // Convenience functions for specific flags:

  /// Usage: Convenience function, only to be used when evaluating the
  /// `offer_discount` flag (FmeFlagName.offerDiscount).
  int get discountOffer => flagResponse?.parseDiscountOffer() ?? 0;

  /// Usage: Convenience function, only to be used when evaluating the
  /// `coupon_button_color` flag (FmeFlagName.discountCouponButtonColor).
  Color? get buttonColor => flagResponse?.parseButtonColor();
}

extension FmeHelpers on FlagResponse {
  /// Parses the discount percentage (FME feature flag variation value),
  /// e.g. 15 (for a 15% discount offer).
  /// Usage: Convenience function, only to be used when evaluating the
  /// `offer_discount` flag (FmeFlagName.offerDiscount).
  int parseDiscountOffer() => int.tryParse(treatmentWhenOn ?? '0') ?? 0;

  /// Parses the color hex value (FME feature flag variation value).
  /// Usage: Convenience function, only to be used when evaluating the
  /// `coupon_button_color` flag (FmeFlagName.discountCouponButtonColor).
  Color? parseButtonColor() {
    final colorInt = int.tryParse(treatmentWhenOn ?? '', radix: 16);
    return (null != colorInt) ? Color(colorInt) : null;
  }
}
