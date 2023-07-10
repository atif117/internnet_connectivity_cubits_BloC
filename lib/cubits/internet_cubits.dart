import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { connected, disconnected, loading }

class InternetCubits extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetCubits() : super(InternetState.loading) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(InternetState.disconnected);
      } else {
        emit(InternetState.connected);
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
