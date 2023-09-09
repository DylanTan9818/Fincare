import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengeMappingRecord extends FirestoreRecord {
  ChallengeMappingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "childID" field.
  int? _childID;
  int get childID => _childID ?? 0;
  bool hasChildID() => _childID != null;

  // "challengeID" field.
  int? _challengeID;
  int get challengeID => _challengeID ?? 0;
  bool hasChallengeID() => _challengeID != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _childID = castToType<int>(snapshotData['childID']);
    _challengeID = castToType<int>(snapshotData['challengeID']);
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('challenge_mapping');

  static Stream<ChallengeMappingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengeMappingRecord.fromSnapshot(s));

  static Future<ChallengeMappingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChallengeMappingRecord.fromSnapshot(s));

  static ChallengeMappingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengeMappingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengeMappingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengeMappingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengeMappingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengeMappingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengeMappingRecordData({
  int? childID,
  int? challengeID,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'childID': childID,
      'challengeID': challengeID,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengeMappingRecordDocumentEquality
    implements Equality<ChallengeMappingRecord> {
  const ChallengeMappingRecordDocumentEquality();

  @override
  bool equals(ChallengeMappingRecord? e1, ChallengeMappingRecord? e2) {
    return e1?.childID == e2?.childID &&
        e1?.challengeID == e2?.challengeID &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ChallengeMappingRecord? e) =>
      const ListEquality().hash([e?.childID, e?.challengeID, e?.status]);

  @override
  bool isValidKey(Object? o) => o is ChallengeMappingRecord;
}
