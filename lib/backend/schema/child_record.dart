import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildRecord extends FirestoreRecord {
  ChildRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "childID" field.
  int? _childID;
  int get childID => _childID ?? 0;
  bool hasChildID() => _childID != null;

  // "totalStars" field.
  int? _totalStars;
  int get totalStars => _totalStars ?? 0;
  bool hasTotalStars() => _totalStars != null;

  void _initializeFields() {
    _childID = castToType<int>(snapshotData['childID']);
    _totalStars = castToType<int>(snapshotData['totalStars']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('child');

  static Stream<ChildRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChildRecord.fromSnapshot(s));

  static Future<ChildRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChildRecord.fromSnapshot(s));

  static ChildRecord fromSnapshot(DocumentSnapshot snapshot) => ChildRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChildRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChildRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChildRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChildRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChildRecordData({
  int? childID,
  int? totalStars,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'childID': childID,
      'totalStars': totalStars,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChildRecordDocumentEquality implements Equality<ChildRecord> {
  const ChildRecordDocumentEquality();

  @override
  bool equals(ChildRecord? e1, ChildRecord? e2) {
    return e1?.childID == e2?.childID && e1?.totalStars == e2?.totalStars;
  }

  @override
  int hash(ChildRecord? e) =>
      const ListEquality().hash([e?.childID, e?.totalStars]);

  @override
  bool isValidKey(Object? o) => o is ChildRecord;
}
