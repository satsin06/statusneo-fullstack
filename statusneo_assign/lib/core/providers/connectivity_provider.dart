import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/connectivity_service.dart';

final connectivityProvider = Provider((ref) => ConnectivityService());