part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();
  
  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {
  final String display;
  final String equation;
  
  const CalculatorInitial({
    this.display = '0',
    this.equation = '',
  });
  
  @override
  List<Object> get props => [display, equation];
  
  CalculatorInitial copyWith({
    String? display,
    String? equation,
  }) {
    return CalculatorInitial(
      display: display ?? this.display,
      equation: equation ?? this.equation,
    );
  }
}