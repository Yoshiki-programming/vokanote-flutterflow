import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<VocabsRecord> filterVocabs(
  List<VocabsRecord> allVocabs,
  String? selectedPOS,
  bool showLearnedOnly,
) {
// where（絞り込み）を開始
  return allVocabs.where((vocab) {
    // --- 条件分岐 1: 品詞 ---
    // 「未選択」「all」「中身が空」のいずれかなら、全てのデータをパスさせる
    bool matchesPOS = (selectedPOS == null ||
        selectedPOS == 'all' ||
        selectedPOS == '' ||
        vocab.partOfSpeech == selectedPOS);

    // --- 条件分岐 2: 学習ステータス ---
    // 「習得済みのみ表示」がOFF（false）なら全員通過。
    // ON（true）なら、データの is_learned が true のものだけ通過。
    bool matchesLearned = (!showLearnedOnly || vocab.isLearned == true);

    // 両方の条件を満たしたものだけをリストに残す
    return matchesPOS && matchesLearned;
  }).toList();
}
