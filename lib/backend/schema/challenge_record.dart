import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengeRecord extends FirestoreRecord {
  ChallengeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "challengeID" field.
  int? _challengeID;
  int get challengeID => _challengeID ?? 0;
  bool hasChallengeID() => _challengeID != null;

  // "chanllengeName" field.
  String? _chanllengeName;
  String get chanllengeName => _chanllengeName ?? '';
  bool hasChanllengeName() => _chanllengeName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "stars" field.
  int? _stars;
  int get stars => _stars ?? 0;
  bool hasStars() => _stars != null;

  // "difficulty" field.
  String? _difficulty;
  String get difficulty => _difficulty ?? '';
  bool hasDifficulty() => _difficulty != null;

  // "days" field.
  int? _days;
  int get days => _days ?? 0;
  bool hasDays() => _days != null;

  void _initializeFields() {
    _challengeID = castToType<int>(snapshotData['challengeID']);
    _chanllengeName = snapshotData['chanllengeName'] as String?;
    _description = snapshotData['description'] as String?;
    _stars = castToType<int>(snapshotData['stars']);
    _difficulty = snapshotData['difficulty'] as String?;
    _days = castToType<int>(snapshotData['days']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('challenge');

  static Stream<ChallengeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengeRecord.fromSnapshot(s));

  static Future<ChallengeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChallengeRecord.fromSnapshot(s));

  static ChallengeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengeRecordData({
  int? challengeID,
  String? chanllengeName,
  String? description,
  int? stars,
  String? difficulty,
  int? days,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'challengeID': challengeID,
      'chanllengeName': chanllengeName,
      'description': description,
      'stars': stars,
      'difficulty': difficulty,
      'days': days,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengeRecordDocumentEquality implements Equality<ChallengeRecord> {
  const ChallengeRecordDocumentEquality();

  @override
  bool equals(ChallengeRecord? e1, ChallengeRecord? e2) {
    return e1?.challengeID == e2?.challengeID &&
        e1?.chanllengeName == e2?.chanllengeName &&
        e1?.description == e2?.description &&
        e1?.stars == e2?.stars &&
        e1?.difficulty == e2?.difficulty &&
        e1?.days == e2?.days;
  }

  @override
  int hash(ChallengeRecord? e) => const ListEquality().hash([
        e?.challengeID,
        e?.chanllengeName,
        e?.description,
        e?.stars,
        e?.difficulty,
        e?.days
      ]);

  @override
  bool isValidKey(Object? o) => o is ChallengeRecord;
}
