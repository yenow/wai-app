class WaiError {
  int? status;
  String? error;
  String? errorCode;
  String? message;
  DateTime? timestamp;
  String? path;

  WaiError({
    this.status,
    this.error,
    this.errorCode,
    this.message,
    this.timestamp,
    this.path
  });

  factory WaiError.fromJson(Map<String, dynamic> json) {

    return WaiError(
      status : json['status'],
      error : json['error'],
      errorCode : json['errorCode'],
      message : json['message'],
      timestamp :json['timestamp'] != null ? DateTime.parse(json['timestamp']) : null,
      path : json['path'],
    );
  }

  @override
  String toString() {
    return 'Error{status: $status, error: $error, errorCode: $errorCode, message: $message, timestamp: $timestamp, path: $path}';
  }
}