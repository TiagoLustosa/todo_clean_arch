class BusinessRuleException implements Exception {
  final String message;

  BusinessRuleException(this.message);

  @override
  String toString() => 'BusinessRuleException: $message';
}
