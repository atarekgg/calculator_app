import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorInitial()) {
    on<NumberPressed>(_onNumberPressed);
    on<OperatorPressed>(_onOperatorPressed);
    on<ClearPressed>(_onClearPressed);
    on<EqualsPressed>(_onEqualsPressed);
    on<DecimalPressed>(_onDecimalPressed);
    on<DeletePressed>(_onDeletePressed);
  }

  void _onNumberPressed(NumberPressed event, Emitter<CalculatorState> emit) {
    if (state is CalculatorInitial) {
      final currentState = state as CalculatorInitial;
      final currentDisplay = currentState.display;
      
      if (currentDisplay == '0') {
        emit(currentState.copyWith(display: event.number));
      } else {
        emit(currentState.copyWith(display: currentDisplay + event.number));
      }
    }
  }

  void _onOperatorPressed(OperatorPressed event, Emitter<CalculatorState> emit) {
    if (state is CalculatorInitial) {
      final currentState = state as CalculatorInitial;
      
      if (currentState.equation.isEmpty) {
        emit(currentState.copyWith(
          equation: '${currentState.display} ${event.operator} ',
          display: '0',
        ));
      }
    }
  }

  void _onClearPressed(ClearPressed event, Emitter<CalculatorState> emit) {
    emit(const CalculatorInitial());
  }

  void _onEqualsPressed(EqualsPressed event, Emitter<CalculatorState> emit) {
    if (state is CalculatorInitial) {
      final currentState = state as CalculatorInitial;
      
      if (currentState.equation.isNotEmpty) {
        final parts = currentState.equation.split(' ');
        final num1 = double.parse(parts[0]);
        final num2 = double.parse(currentState.display);
        final operator = parts[1];
        
        double result;
        switch (operator) {
          case '+': result = num1 + num2; break;
          case '-': result = num1 - num2; break;
          case '×': result = num1 * num2; break;
          case '÷': 
            if (num2 == 0) {
              emit(const CalculatorInitial(display: 'Error'));
              return;
            }
            result = num1 / num2; 
            break;
          default: result = 0;
        }
        
        String displayResult;
        if (result == result.toInt()) {
          displayResult = result.toInt().toString();
        } else {
          displayResult = result.toString();
        }
        
        emit(CalculatorInitial(
          display: displayResult,
          equation: '',
        ));
      }
    }
  }

  void _onDecimalPressed(DecimalPressed event, Emitter<CalculatorState> emit) {
    if (state is CalculatorInitial) {
      final currentState = state as CalculatorInitial;
      
      if (!currentState.display.contains('.')) {
        emit(currentState.copyWith(display: '${currentState.display}.'));
      }
    }
  }

  void _onDeletePressed(DeletePressed event, Emitter<CalculatorState> emit) {
  
    if (state is CalculatorInitial) {
      final currentState = state as CalculatorInitial;
      
      if (currentState.display.length > 1) {
        emit(currentState.copyWith(
          display: currentState.display.substring(0, currentState.display.length - 1)
        ));
      } else {
        emit(currentState.copyWith(display: '0'));
      }
    }
  }
}