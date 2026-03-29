import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/providers/auth_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/social_login_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePin = true;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final pin = _pinController.text.trim();

    if (name.isEmpty || phone.isEmpty || pin.isEmpty) {
      _showError('Please fill all fields.');
      return;
    }
    if (pin.length != 4 || !RegExp(r'^\d{4}$').hasMatch(pin)) {
      _showError('PIN must be exactly 4 digits.');
      return;
    }

    final auth = context.read<AuthProvider>();
    final success = await auth.register(phone: phone, fullName: name, pin: pin);

    if (!mounted) return;

    if (success) {
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      _showError(auth.error ?? 'Registration failed.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Aura Brew', style: AppTextStyles.appTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Your Account',
                          style: AppTextStyles.heading1,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Join the Aura Brew community and start\nearning rewards',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.textGrey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: -30,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.divider.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Full Name
              Text('FULL NAME', style: AppTextStyles.label),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: 'Enter your full name',
                prefixIcon: Icons.person_outline,
                controller: _nameController,
              ),
              const SizedBox(height: 20),

              // Phone
              Text('PHONE NUMBER', style: AppTextStyles.label),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: '01XXXXXXXXX',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                controller: _phoneController,
              ),
              const SizedBox(height: 20),

              // 4-Digit PIN
              Text('4-DIGIT PIN', style: AppTextStyles.label),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: '••••',
                prefixIcon: Icons.lock_outline,
                suffixIcon: _obscurePin
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                obscureText: _obscurePin,
                keyboardType: TextInputType.number,
                controller: _pinController,
                onSuffixTap: () => setState(() => _obscurePin = !_obscurePin),
              ),
              const SizedBox(height: 6),
              Text(
                'PIN must be exactly 4 digits.',
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: 24),

              // Sign Up Button
              auth.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryBrown,
                      ),
                    )
                  : CustomButton(text: 'Sign Up', onPressed: _signup),
              const SizedBox(height: 24),

              // OR Divider
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.divider)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR SIGN UP WITH',
                      style: AppTextStyles.labelSmall,
                    ),
                  ),
                  const Expanded(child: Divider(color: AppColors.divider)),
                ],
              ),
              const SizedBox(height: 20),

              // Social
              Row(
                children: [
                  SocialLoginButton(
                    label: 'Google',
                    icon: Icons.g_mobiledata,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 12),
                  SocialLoginButton(
                    label: 'Apple',
                    icon: Icons.apple,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Terms
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: AppTextStyles.bodySmall,
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primaryBrown,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: '\nand '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primaryBrown,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sign In Link
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textGrey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: AppTextStyles.bodySemiBold.copyWith(
                            color: AppColors.primaryBrown,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
