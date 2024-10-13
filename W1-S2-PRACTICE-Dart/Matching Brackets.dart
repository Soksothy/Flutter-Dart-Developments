bool isBalanced(String input) {
  final stack = <String>[];
  final matchingBrackets = {
    ')': '(',
    '}': '{',
    ']': '[',
  };

  for (var char in input.split('')) {
    if (matchingBrackets.containsValue(char)) {
      stack.add(char);
    } else if (matchingBrackets.containsKey(char)) {
      if (stack.isEmpty || stack.removeLast() != matchingBrackets[char]) {
        return false;
      }
    }
  }

  return stack.isEmpty;
}

void main() {
  final examples = [
    '{what is (42)}?',
    '[text}',
    '{[[(a)b]c]d}',
  ];

  for (var example in examples) {
    print('$example: ${isBalanced(example) ? "Balanced" : "Not balanced"}');
  }
}