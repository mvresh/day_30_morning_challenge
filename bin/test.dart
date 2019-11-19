import "package:test/test.dart";
import 'main.dart';

void main() {
  test("test 1", () {
    expect(
        areMatroyshkaStyled([
          [1, 5],
          [2, 6],
          [3, 7],
          [4, 8]
        ]),
        equals(false));
  });

  test("test 2", () {
    expect(
        areMatroyshkaStyled([
          [1, 20],
          [3, 10],
          [2, 5],
          [4, 5]
        ]),
        equals(false));
  });

  test("test 3", () {
    expect(
        areMatroyshkaStyled([
          [1, 9, 20],
          [2, 7, 8, 9, 15],
          [3, 5, 10],
          [4, 5]
        ]),
        equals(true));
  });

  test("test 4", () {
    expect(
        areMatroyshkaStyled([
          [2, 15, 16, 20],
          [2, 15],
          [3, 10],
          [4, 5]
        ]),
        equals(false));
  });
}
