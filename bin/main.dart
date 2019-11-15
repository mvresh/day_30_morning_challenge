// Challenge
// Matryoshka dolls are traditionally wooden dolls that can be nested by fitting
// smaller dolls into larger ones. Suppose arrays can be nested similarly,
// placing smaller arrays into larger ones, in the following sense:
//
//// Array A can be nested inside Array B if:
//// 1. min(array A) > min(array B)
//// 2. max(array A) < max(array B)

//// For example, if A = [2, 3, 9, 5] and B = [10, 2, 1], then A can be nested inside B, since:
////  - min(A) = 2 > 1 = min(B) and
////   - max(A) = 9 < 10 = max(B)

/// Create a function that returns true if every single sub-array inside an array
/// can be nested Matroyshka style, and false otherwise.
///
import 'dart:math';
import 'package:collection/collection.dart';

bool areUnique(List<int> list) {
  return list.toSet().length == list.length;
}

bool areMatroyshkaStyled(List<List<int>> givenList) {
  List<List<int>> minMaxList = givenList
      .map((List<int> list) => [list.reduce(min), list.reduce(max)])
      .toList();

  if (areUnique(minMaxList.map((List<int> list) => list[0]).toList()) &&
      areUnique(minMaxList.map((List<int> list) => list[0]).toList())) {
    List<List<int>> minMaxListCopy = []..addAll(minMaxList);

    minMaxList.sort((a, b) => a[0].compareTo(b[0]));
    //print(minMaxList);

    minMaxListCopy.sort((a, b) => b[1].compareTo(a[1]));
    //print(minMaxListCopy);

    return ListEquality().equals(minMaxList, minMaxListCopy);
  }
  else{
    return false;
  }
}

main() {
  print(areMatroyshkaStyled([
    [2, 15, 16, 20],
    [2, 15],
    [3, 10],
    [4, 5]
  ]));
  print(areMatroyshkaStyled([
    [1, 5],
    [2, 6],
    [3, 7],
    [4, 8]
  ]));
}
