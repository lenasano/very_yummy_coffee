import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fme_repository/fme_repository.dart';
import 'package:very_yummy_coffee_mobile_app/features/discount/discount_teaser/discount_teaser.dart';

class DiscountTeaserFeature extends StatelessWidget {
  const DiscountTeaserFeature({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
         // Provide the block to the widget tree so that it can manage state for
         // FME flag evaluations and send tracking events.
        return FmeFlagOfferDiscountBloc(
          // Use `read` so that widget doesn't dynamically update when a flag
          // treatment for the user key changes.
          // TODO(me): Implement feature flag propagation).
          // Bloc will still initiate every time the widget is shown.
          fmeRepository: context.read<FmeRepository>(),
        );
      },
      child: const DiscountTeaserView(),
    );
  }
}
