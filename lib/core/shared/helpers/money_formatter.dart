import 'package:money_formatter/money_formatter.dart';

class CustomMoneyFormatter {
  static String formattedMoney(num value) {
    final moneyFormatter = MoneyFormatter(
        amount: value.toDouble(),
        settings: MoneyFormatterSettings(
            symbol: 'R\$', decimalSeparator: ',', thousandSeparator: '.'));

    return moneyFormatter.output.symbolOnLeft;
  }
}
