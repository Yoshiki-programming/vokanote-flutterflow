// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<VocabsRecord>> queryVocabs(
  DocumentReference userRef,
  String? partOfSpeech,
  bool? isLearned,
) async {
  // Add your function code here!
  Query query = FirebaseFirestore.instance
      .collection('vocabs')
      .where('user_ref', isEqualTo: userRef);

  // 2. partOfSpeech：指定があり、かつ "all" ではない場合のみ絞り込み
  // ここで "all" を除外することで、全件取得（フィルタなし）になります
  if (partOfSpeech != null &&
      partOfSpeech.isNotEmpty &&
      partOfSpeech != 'all') {
    query = query.where('part_of_speech', isEqualTo: partOfSpeech);
  }

  // 3. isLearned：「true」の時だけ絞り込み
  // false（「すべて」を表示したい時）は if 文をスキップするため、
  // isLearned に関するフィルタが追加されず、全件取得になります。
  if (isLearned == true) {
    query =
        query.where('is_learned', isEqualTo: true); // DBのフィールド名も isLearned と想定
  }

  // 4. クエリ実行
  final snapshot = await query.get();

  // 5. VocabsRecordリストに変換
  return snapshot.docs.map((doc) => VocabsRecord.fromSnapshot(doc)).toList();
}
