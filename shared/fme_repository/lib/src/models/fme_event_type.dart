/// Constants that exactly match event types in Harness FME.
///
/// Use these instead of raw string literals to get compile-time safety
/// for event types across client and server code.
/// 
/// Usage: To get the event type as a string, call
///   FmeEventType.profitInCents.value); // Output: profit_in_cents
enum FmeEventType {
  profitInCents('profit_in_cents'),
  numberOfItemsPurchased('number_of_items_purchased');

  const FmeEventType(this.value);

  final String value;

  @override
  String toString() => value;  // e.g. print('Value is ${FmeEventType.profitInCents}.') // Output: Value is profit_in_cents.

  static bool exists(String givenEventType) =>
    FmeEventType.values.any((e) => e.value == givenEventType);

  static FmeEventType? fromString(String givenEventType) =>
    !exists(givenEventType) ? 
      null : 
      FmeEventType.values.firstWhere(
        (e) => e.value == givenEventType
      );

  bool equals(String? eventType) => value == eventType;
}
