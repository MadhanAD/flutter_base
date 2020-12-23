class ApiResponse<T> {
  Status status;
  T data;
  String message;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  String toString() => "Status: $status ## Message: $message ## Data: $data";
}

enum Status { LOADING, COMPLETED, ERROR }
