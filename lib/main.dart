import 'package:finance_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/controllers/financial_transaction_controller.dart';
import 'package:finance_app/views/accounts_list_screen.dart';
import 'package:finance_app/views/transactions_list_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  // await dotenv.load(fileName: ".env.${const String.fromEnvironment('ENV', defaultValue: 'development')}");

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData? theme = MyTheme.themeData;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccountController()),
        ChangeNotifierProvider(create: (_) => FinancialTransactionController()),
      ],
      child: MaterialApp(
        title: 'Finance App',
        theme: theme,
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AccountsListScreen(),
    const TransactionsListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Accounts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: 'Transactions'),
        ],
      ),
    );
  }
}
