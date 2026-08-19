import 'dart:developer';
import 'package:fme_repository/src/models/models.dart';

// Wrapper class to cache FlagResponse responses, for flags that should not
// update during a user session.
class FlagResponseCache {
  FlagResponseCache(){
    _cachedFlagResponses = 
      { for (final name in _flagNamesToCache) name: null };
  }
  
  late final Map<FmeFlagName, FlagResponse?> _cachedFlagResponses;

  /// List the feature flags that we want to cache for each user session. The
  /// feature flag treatment results will only refresh in the application (e.g. 
  /// mobile device) when the users closes/reopens the app (or on a hot reload).
  static const  List<FmeFlagName> _flagNamesToCache = [
      FmeFlagName.offerDiscount,
  ];

  FlagResponse filterIfCached(FlagResponse newFlagResponse) {

    final flagName = FmeFlagName.fromString(newFlagResponse.flagName);

    if( !_cachedFlagResponses.containsKey(flagName) )
    {
      // We didn't cache this the server response for this flag (this flag
      // should update dynamically during a user session).
      return newFlagResponse;
    }
    else {
      // Cache the first evaluation result for this flag if we haven't already.
      _cachedFlagResponses[flagName!] ??= newFlagResponse;
    }
    
    final cachedFlagResponse = _cachedFlagResponses[flagName];

    if( newFlagResponse != cachedFlagResponse) {
      log('[fme] throwing away $newFlagResponse, using cached'
            ' $cachedFlagResponse instead.');
    }
    
    return cachedFlagResponse!;
  }
}
