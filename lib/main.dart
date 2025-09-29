import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'core/providers/database_provider.dart';
import 'core/router/app_router.dart';
import 'core/services/onboarding_service.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isOnboardingCompleted = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final isCompleted = await OnboardingService.isOnboardingCompleted();
    if (mounted) {
      setState(() {
        _isOnboardingCompleted = isCompleted;
        _isLoading = false;
      });
    }
  }

  void _onOnboardingCompleted() {
    setState(() {
      _isOnboardingCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DatabaseProvider()..initialize()),
      ],
      child: Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) {
          final appRouter = AppRouter();
          
          return CupertinoApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Travel Outfit Planner',
            theme: const CupertinoThemeData(
              brightness: Brightness.light,
              primaryColor: CupertinoColors.activeBlue,
            ),
            routerConfig: appRouter.config(),
            builder: (context, child) {
              if (!databaseProvider.isInitialized || _isLoading) {
                return const CupertinoPageScaffold(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              }
              
              // Если onboarding не завершен, показываем onboarding
              if (!_isOnboardingCompleted) {
                return OnboardingScreen(onCompleted: _onOnboardingCompleted);
              }
              
              // Иначе показываем основное приложение
              return child ?? const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}