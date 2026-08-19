import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fme_repository/fme_repository.dart';
import 'package:very_yummy_coffee_mobile_app/features/discount/discount_coupon/discount_coupon.dart';
import 'package:very_yummy_coffee_mobile_app/features/shared/fme/fme.dart';

class DiscountCouponFeature extends StatelessWidget {
  const DiscountCouponFeature({
    required this.offer,
    required this.appliedDiscount,
    required this.onDiscountClicked,
    super.key,
  });

  final int offer;
  final double appliedDiscount;
  final void Function() onDiscountClicked;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
         // Provide the block to the widget tree so that it can manage state for
         // FME flag evaluations and send tracking events.
        return FmeFlagDiscountButtonColorBloc(
          fmeRepository: context.watch<FmeRepository>(),
          // Use `watch` so that widget dynamically updates when a flag
          // treatment for the user key changes.
          // TODO(me): Implement feature flag propagation.
        );
      },
      child: DiscountCouponView(
        offer: offer,
        appliedDiscount: appliedDiscount,
        onDiscountClicked: onDiscountClicked,
      ),
    );
  }
}
