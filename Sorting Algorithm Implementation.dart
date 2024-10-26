import 'dart:math';

void main() {
  //this code Generate a random list of integers for testing
  List<int> randomList = List.generate(28, (_) => Random().nextInt(224));

  // Measure and display performance of Counting Sort
  measureSort('Counting Sort', countingSort, randomList);

  // Measures and display's performance of Bubble Sort
  measureSort('Bubble Sort', bubbleSort, List.from(randomList)); // Copy to avoid sorting already sorted list
}

// Function to measure sorting performance
void measureSort(String name, List<int> Function(List<int>) sortFunction, List<int> list) {
  var start = DateTime.now();
  List<int> sortedList = sortFunction(list);
  var end = DateTime.now();
  print('$name Execution Time: ${end.difference(start).inMilliseconds} ms');
  print('$name Sorted List: $sortedList'); // Display the sorted list
}

// Counting Sort Algorithm
List<int> countingSort(List<int> list) {
  if (list.isEmpty) return list;
  int maxValue = list.reduce(max);
  List<int> count = List.filled(maxValue + 1, 0), output = List.filled(list.length, 0);

  for (int number in list) count[number]++;
  for (int i = 1; i <= maxValue; i++) count[i] += count[i - 1];
  for (int i = list.length - 1; i >= 0; i--) output[count[list[i]]-- - 1] = list[i];

  return output;
}

// Bubble Sort Algorithm
List<int> bubbleSort(List<int> list) {
  for (int i = 0; i < list.length - 1; i++)
    for (int j = 0; j < list.length - 1 - i; j++)
      if (list[j] > list[j + 1]) {
        // Swap the elements
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
  return list;
}








//This Dart code generates a random list of integers and measures the performance of two sorting algorithms: Counting Sort and Bubble Sort.
//The performance of each sorting function is measured in terms of execution time, and both sorted lists are printed.
//The Counting Sort algorithm is efficient for certain cases, while Bubble Sort is a simpler but less efficient algorithm.
