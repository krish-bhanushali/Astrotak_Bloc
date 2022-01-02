class CustomResponse<T> {
  late T data;
  late Status status;
  late dynamic message;

  CustomResponse.loading(this.message) : status = Status.LOADING;
  CustomResponse.completed(this.data) : status = Status.COMPLETED;
  CustomResponse.error(this.message) : status = Status.ERROR;
}

enum Status { LOADING, COMPLETED, ERROR }
