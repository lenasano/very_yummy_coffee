import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_yummy_coffee_mobile_app/features/shared/fme/fme.dart';
import 'package:very_yummy_coffee_ui/very_yummy_coffee_ui.dart';

class DiscountCouponView extends StatelessWidget {
  const DiscountCouponView({
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
    final colors = context.colors;
    final spacing = context.spacing;

    return BlocBuilder<FmeFlagDiscountButtonColorBloc, FmeState>(
      builder: (context, state) {

        Color?  buttonColor;

        //TODO(me): Test dynamic flag updates.
        
        if (FmeStatus.success == state.status) {
          buttonColor = state.buttonColor;
        }
        //log('[discount_coupon] rebuilding,'
        //  ' button color is $buttonColorInt');

        return Column(
          children: [
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
                child: Row(
                  children: [
                    // Left Section: Promo Details
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(spacing.xl),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sweet!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold, 
                                color: Colors.black87
                              )
                              ,
                            ),
                            Text(
                              'Apply this coupon for $offer% off your '
                              'purchase',
                              style: TextStyle(
                                fontSize: 14, 
                                color: Colors.grey.shade700
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Right Section: Action Button
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          onPressed: onDiscountClicked,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor ?? colors.accentGold,
                            foregroundColor: colors.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                context.radius.small)
                            ),
                          ),
                          child: Text( 
                            appliedDiscount == 0 ? 'Apply' : 'Remove' ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.spacing.xl),
          ]
        );
      }
  );}
}
