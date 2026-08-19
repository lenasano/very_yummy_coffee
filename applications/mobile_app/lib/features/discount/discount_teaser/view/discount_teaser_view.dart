import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_yummy_coffee_mobile_app/features/shared/fme/fme.dart';
import 'package:very_yummy_coffee_ui/very_yummy_coffee_ui.dart';

class DiscountTeaserView extends StatelessWidget {
  const DiscountTeaserView({super.key});

@override
  Widget build(BuildContext context) {

    final colors = context.colors;
    final spacing = context.spacing;

    return BlocBuilder<FmeFlagOfferDiscountBloc, FmeState>(
      builder: (context, state) {
        var offerInt = 0;

        if (FmeStatus.loading == state.status)
        {
          return const Center(
            child: CircularProgressIndicator(
              padding: EdgeInsets.all(16)
            )
          );
        }
        if (FmeStatus.failure == state.status) 
        {
          // Show no 'teaser' if there is no discount offered.
          return const _EmptyState();
        }
        if (FmeStatus.success == state.status) {
          offerInt = state.discountOffer;
          if (offerInt <= 0) return const _EmptyState();
        }
        //log('[discount_teaser_view] rebuilding, offer is $offerInt');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.spacing.lg),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.xl),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/discount_coupon.png'),
                    fit: BoxFit.cover,
                  ),
                  color: colors.secondary,
                  borderRadius:  BorderRadius.circular(context.radius.large),
                  border: Border.all(color: colors.accentGold, width: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.all(spacing.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sweet!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold, 
                          color: Colors.black87
                        )
                        ,
                      ),
                      Text(
                        'Get $offerInt% off your purchase.',
                        style: const TextStyle(
                          fontSize: 14, 
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        'Apply this coupon at checkout.',
                        style: TextStyle(
                          fontSize: 12, 
                          color: Colors.grey.shade600
                        ),
                      ),
                    ]
                  ),
                )
              )
            ),
          ]
        );
      }
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
