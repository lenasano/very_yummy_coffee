# Fme Relay

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

A relay for the Feature Management Experimentation (FME) domain for Very Yummy Coffee.

## Overview

Provides reactive order streams and mutation methods, all synced via WebSocket:

- **`flagEvalStream`** — stream of a feature flag (subscribes to the `flag:[flagName]` WebSocket topic on first access)
- **Mutations** — `getTreatment()`

All mutations send typed `RpcAction` messages over WebSocket. There is no local state mutation; the server is the source of truth and pushes updates back to all subscribers.

## Testing

```sh
dart test
```

## Code Generation

After modifying code, run the build runner:

```sh
dart run build_runner build --delete-conflicting-outputs
