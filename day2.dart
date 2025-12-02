import 'dart:io';

bool isInvalidId(int id) {
  String idStr = id.toString();
  
  // Check if starts with 0
  if (idStr.startsWith('0')) return true;
  
  // Check for repeating patterns
  int len = idStr.length;
  for (int patternLen = 1; patternLen <= len ~/ 2; patternLen++) {
    if (len % patternLen == 0) {
      String pattern = idStr.substring(0, patternLen);
      bool isRepeating = true;
      for (int i = patternLen; i < len; i += patternLen) {
        if (idStr.substring(i, i + patternLen) != pattern) {
          isRepeating = false;
          break;
        }
      }
      if (isRepeating) return true;
    }
  }

  return false;
}

int solve() {
  String input = File('lib/day2Input.txt').readAsStringSync().trim();
  List<String> ranges = input.split(',');
  int totalSum = 0;

  for (String range in ranges) {
    List<String> parts = range.split('-');
    int start = int.parse(parts[0]);
    int end = int.parse(parts[1]);

    for (int id = start; id <= end; id++) {
      if (isInvalidId(id)) {
        totalSum += id;
        print('Invalid ID found: $id');
      }
    }
  }
  
  return totalSum;
}

void main() {
  int result = solve();
  print('Sum of all invalid IDs: $result');
}
