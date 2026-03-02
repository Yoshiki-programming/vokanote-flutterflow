import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VocabsRecord extends FirestoreRecord {
  VocabsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "word" field.
  String? _word;
  String get word => _word ?? '';
  bool hasWord() => _word != null;

  // "meaning" field.
  String? _meaning;
  String get meaning => _meaning ?? '';
  bool hasMeaning() => _meaning != null;

  // "pronunciation" field.
  String? _pronunciation;
  String get pronunciation => _pronunciation ?? '';
  bool hasPronunciation() => _pronunciation != null;

  // "example_kr" field.
  String? _exampleKr;
  String get exampleKr => _exampleKr ?? '';
  bool hasExampleKr() => _exampleKr != null;

  // "example_jp" field.
  String? _exampleJp;
  String get exampleJp => _exampleJp ?? '';
  bool hasExampleJp() => _exampleJp != null;

  // "is_learned" field.
  bool? _isLearned;
  bool get isLearned => _isLearned ?? false;
  bool hasIsLearned() => _isLearned != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "updated_by" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "part_of_speech" field.
  String? _partOfSpeech;
  String get partOfSpeech => _partOfSpeech ?? '';
  bool hasPartOfSpeech() => _partOfSpeech != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  void _initializeFields() {
    _word = snapshotData['word'] as String?;
    _meaning = snapshotData['meaning'] as String?;
    _pronunciation = snapshotData['pronunciation'] as String?;
    _exampleKr = snapshotData['example_kr'] as String?;
    _exampleJp = snapshotData['example_jp'] as String?;
    _isLearned = snapshotData['is_learned'] as bool?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _updatedBy = snapshotData['updated_by'] as DocumentReference?;
    _partOfSpeech = snapshotData['part_of_speech'] as String?;
    _tag = snapshotData['tag'] as String?;
    _audioUrl = snapshotData['audio_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vocabs');

  static Stream<VocabsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VocabsRecord.fromSnapshot(s));

  static Future<VocabsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VocabsRecord.fromSnapshot(s));

  static VocabsRecord fromSnapshot(DocumentSnapshot snapshot) => VocabsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VocabsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VocabsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VocabsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VocabsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVocabsRecordData({
  String? word,
  String? meaning,
  String? pronunciation,
  String? exampleKr,
  String? exampleJp,
  bool? isLearned,
  DocumentReference? userRef,
  DateTime? createdAt,
  DateTime? updatedAt,
  DocumentReference? createdBy,
  DocumentReference? updatedBy,
  String? partOfSpeech,
  String? tag,
  String? audioUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'word': word,
      'meaning': meaning,
      'pronunciation': pronunciation,
      'example_kr': exampleKr,
      'example_jp': exampleJp,
      'is_learned': isLearned,
      'user_ref': userRef,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'part_of_speech': partOfSpeech,
      'tag': tag,
      'audio_url': audioUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class VocabsRecordDocumentEquality implements Equality<VocabsRecord> {
  const VocabsRecordDocumentEquality();

  @override
  bool equals(VocabsRecord? e1, VocabsRecord? e2) {
    return e1?.word == e2?.word &&
        e1?.meaning == e2?.meaning &&
        e1?.pronunciation == e2?.pronunciation &&
        e1?.exampleKr == e2?.exampleKr &&
        e1?.exampleJp == e2?.exampleJp &&
        e1?.isLearned == e2?.isLearned &&
        e1?.userRef == e2?.userRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.partOfSpeech == e2?.partOfSpeech &&
        e1?.tag == e2?.tag &&
        e1?.audioUrl == e2?.audioUrl;
  }

  @override
  int hash(VocabsRecord? e) => const ListEquality().hash([
        e?.word,
        e?.meaning,
        e?.pronunciation,
        e?.exampleKr,
        e?.exampleJp,
        e?.isLearned,
        e?.userRef,
        e?.createdAt,
        e?.updatedAt,
        e?.createdBy,
        e?.updatedBy,
        e?.partOfSpeech,
        e?.tag,
        e?.audioUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is VocabsRecord;
}
