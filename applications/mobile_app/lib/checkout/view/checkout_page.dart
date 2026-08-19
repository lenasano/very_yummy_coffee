import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fme_repository/fme_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:order_repository/order_repository.dart';
import 'package:very_yummy_coffee_mobile_app/checkout/checkout.dart';
import 'package:very_yummy_coffee_mobile_app/features/shared/fme/fme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  factory CheckoutPage.pageBuilder(BuildContext _, GoRouterState _) =>
      const CheckoutPage(key: Key('checkout_page'));

  static const routeName = 'checkout';
  static const routePath = 'checkout';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CheckoutBloc(
            orderRepository: context.read<OrderRepository>(),
          )..add(const CheckoutSubscriptionRequested())
        ),
        // Manages state and events for FME feature flag evaluations
        BlocProvider(
          create: (_) => FmeFlagOfferDiscountBloc(
            fmeRepository: context.read<FmeRepository>(),
          ),
        ),
      ],
      child: const CheckoutView(),
    );
  }
}
