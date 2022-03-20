import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(printEmojis: true),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printEmojis: false
  ),
);

