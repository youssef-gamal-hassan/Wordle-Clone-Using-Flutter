import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wordle_clone/app/app_colors.dart';

enum LetterStatus{inital , notInWord, inWord, correct}

class Letter extends Equatable{

  final String val;
  final LetterStatus status;

  const Letter ({
    required this.val,
    this.status = LetterStatus.inital,
  });

  factory Letter.empty() => const Letter(val: '');

  Color get backgroundColor{
    switch(status){
      case LetterStatus.inital:
        return Colors.transparent;
      case LetterStatus.notInWord:
        return notInWordColor;
      case LetterStatus.inWord:
        return inWordColor;
      case LetterStatus.correct:
        return correctColor;
    }
  }

  Color get borderColor{
    switch(status){
      case LetterStatus.inital:
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }

  Letter copyWith({String? val, LetterStatus? status,}){
    return Letter(val: val ?? this.val, status: status ?? this.status,);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [val, status];

}