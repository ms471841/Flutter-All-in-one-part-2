void main() {
  List<int> numbers = [1, 2, 3, 2, 4, 5, 1, 6];
  List<int> uniqueNumbers = numbers.removeDuplicates();
  print(
      'Before Removing Duplicates: ${numbers}'); //prints[1, 2, 3, 2, 4, 5, 1, 6]
  print(
      'After Removing Duplicates : ${uniqueNumbers}'); // prints [1, 2, 3, 4, 5, 6]
}

extension ListExtensions<T> on List<T> {
  List<T> removeDuplicates() {
    return [
      ...{...this}.toList()
    ];
  }
}
