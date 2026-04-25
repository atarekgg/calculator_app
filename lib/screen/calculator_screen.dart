// lib/screen/calculator_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/calculator_bloc.dart';
import '../theme/app_colors.dart';
import '../theme/app_string.dart';
import '../theme/app_text_style.dart';
import '../theme/app_responsive.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        elevation: 0,
      ),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          String display = '0';
          String equation = '';
          
          if (state is CalculatorInitial) {
            display = state.display;
            equation = state.equation;
          }
          
          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 35,
                          child: SingleChildScrollView(
                            reverse: true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                              alignment: Alignment.bottomRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    reverse: true,
                                    child: Text(
                                      equation,
                                      style: AppTextStyles.displaySmall.copyWith(
                                        fontSize: AppResponsive.width(context) * 0.06,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    reverse: true,
                                    child: Text(
                                      display,
                                      style: AppTextStyles.displayLarge.copyWith(
                                        fontSize: AppResponsive.width(context) * 0.12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  _buildButton(context, AppStrings.clear, AppColors.buttonFunction, 
                                      () => context.read<CalculatorBloc>().add(ClearPressed())),
                                  _buildButton(context, AppStrings.delete, AppColors.buttonFunction, 
                                      () => context.read<CalculatorBloc>().add(DeletePressed())),
                                  _buildButton(context, AppStrings.percent, AppColors.buttonFunction, 
                                      () => context.read<CalculatorBloc>().add(OperatorPressed('%'))),
                                  _buildButton(context, AppStrings.divide, AppColors.buttonOperator, 
                                      () => context.read<CalculatorBloc>().add(OperatorPressed('÷'))),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _buildButton(context, '7', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('7'))),
                                  _buildButton(context, '8', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('8'))),
                                  _buildButton(context, '9', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('9'))),
                                  _buildButton(context, AppStrings.multiply, AppColors.buttonOperator, 
                                      () => context.read<CalculatorBloc>().add(OperatorPressed('×'))),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _buildButton(context, '4', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('4'))),
                                  _buildButton(context, '5', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('5'))),
                                  _buildButton(context, '6', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('6'))),
                                  _buildButton(context, AppStrings.subtract, AppColors.buttonOperator, 
                                      () => context.read<CalculatorBloc>().add(OperatorPressed('-'))),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _buildButton(context, '1', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('1'))),
                                  _buildButton(context, '2', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('2'))),
                                  _buildButton(context, '3', AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(NumberPressed('3'))),
                                  _buildButton(context, AppStrings.add, AppColors.buttonOperator, 
                                      () => context.read<CalculatorBloc>().add(OperatorPressed('+'))),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: _buildButton(context, '0', AppColors.buttonNumber, 
                                        () => context.read<CalculatorBloc>().add(NumberPressed('0'))),
                                  ),
                                  _buildButton(context, AppStrings.decimal, AppColors.buttonNumber, 
                                      () => context.read<CalculatorBloc>().add(DecimalPressed())),
                                  _buildButton(context, AppStrings.equals, AppColors.buttonOperator, 
                                      () => context.read<CalculatorBloc>().add(EqualsPressed())),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(AppResponsive.width(context) * 0.02),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            height: AppResponsive.height(context) * 0.07,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppResponsive.width(context) * 0.04),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: (color == AppColors.buttonFunction 
                    ? AppTextStyles.buttonFunction 
                    : AppTextStyles.buttonNumber).copyWith(
                  fontSize: color == AppColors.buttonFunction 
                      ? AppResponsive.width(context) * 0.05
                      : AppResponsive.width(context) * 0.07,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}