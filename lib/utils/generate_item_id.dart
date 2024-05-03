import 'dart:math';

String generateItemId() {
  // Define the characters to use for generating the item ID
  const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  // Create a random number generator
  final Random random = Random();

  // Use StringBuffer for efficient concatenation of the ID
  final StringBuffer itemId = StringBuffer();

  // Generate the 8-character item ID
  for (int i = 0; i < 8; i++) {
    // Randomly select a character from the chars and append to itemId
    itemId.write(chars[random.nextInt(chars.length)]);
  }

  // Convert StringBuffer to String and return the generated item ID
  return itemId.toString();
}
