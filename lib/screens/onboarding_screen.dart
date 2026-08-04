import 'package:flutter/material.dart';
import 'package:kabelos/l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const OnboardingScreen({super.key, required this.onComplete});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _checking = false;
  bool _checkPassed = false;

  static const int _totalSteps = 4;

  void _nextPage() {
    if (_currentPage < _totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() async {
    setState(() => _checking = true);

    await Future.delayed(const Duration(milliseconds: 800));

    setState(() {
      _checking = false;
      _checkPassed = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    widget.onComplete();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: List.generate(_totalSteps, (index) {
                  final isActive = index == _currentPage;
                  final isPast = index < _currentPage;
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: EdgeInsets.only(
                        right: index < _totalSteps - 1 ? 8 : 0,
                      ),
                      decoration: BoxDecoration(
                        color: isPast
                            ? Theme.of(context).colorScheme.primary
                            : isActive
                            ? Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.5)
                            : Theme.of(context).colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                children: [
                  _buildStep1(context, l10n),
                  _buildStep2(context, l10n),
                  _buildStep3(context, l10n),
                  _buildStep4(context, l10n),
                ],
              ),
            ),
            if (_checking)
              Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(l10n.onboardingChecking),
                  ],
                ),
              )
            else if (_checkPassed)
              Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(l10n.onboardingCheckPassed),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    if (_currentPage > 0)
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(l10n.onboardingSkip),
                      ),
                    const Spacer(),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                        ),
                        child: Text(
                          _currentPage == _totalSteps - 1
                              ? l10n.onboardingFinish
                              : l10n.onboardingContinue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep1(BuildContext context, AppLocalizations l10n) {
    return _buildStep(
      context,
      icon: Icons.wifi,
      title: l10n.onboardingStep1Title,
      description: l10n.onboardingStep1Description,
    );
  }

  Widget _buildStep2(BuildContext context, AppLocalizations l10n) {
    return _buildStep(
      context,
      icon: Icons.location_pin,
      title: l10n.onboardingStep2Title,
      description: l10n.onboardingStep2Description,
    );
  }

  Widget _buildStep3(BuildContext context, AppLocalizations l10n) {
    return _buildStep(
      context,
      icon: Icons.notifications_active,
      title: l10n.onboardingStep3Title,
      description: l10n.onboardingStep3Description,
    );
  }

  Widget _buildStep4(BuildContext context, AppLocalizations l10n) {
    return _buildStep(
      context,
      icon: Icons.phone_android,
      title: l10n.onboardingStep4Title,
      description: l10n.onboardingStep4Description,
      isSamsung: true,
    );
  }

  Widget _buildStep(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    bool isSamsung = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Theme.of(context).colorScheme.primary),
          if (isSamsung)
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.secondaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.phone_android,
                    size: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Samsung One UI",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
