# Boilerplate for RPC service communication to relay FME flag evaluations

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Typed RPC protocol classes for the Very Yummy Coffee system.

## Overview

This package defines all data types shared between the backend and front-end applications, serialized with `dart_mappable`:

- **RPC protocol types:**
  - `FmeAction` — sealed class hierarchy for RPC actions with typed subtypes for each mutation (e.g., `GetTreatment`)
  - `RpcClientMessage` — sealed class for client-to-server wire messages (`RpcSubscribeMessage`, `RpcUnsubscribeMessage`, `RpcActionClientMessage`)
  - `FmeTopics` — constants for RPC topic names (`featureFlagEval(flagName)`)

## Code Generation

After modifying code, run the build runner:

```sh
dart run build_runner build --delete-conflicting-outputs
```
