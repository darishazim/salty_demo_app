abstract class FormSubmissionStatus{
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus{
  const InitialFormStatus();
}

class LoadingFormStatus extends FormSubmissionStatus{
  const LoadingFormStatus();
}

class FormSubmitting extends FormSubmissionStatus{}

class SubmissionSuccess extends FormSubmissionStatus{
  final String response;

  SubmissionSuccess(this.response);
}

class SubmissionFailed extends FormSubmissionStatus{
  final Object exception;

  SubmissionFailed(this.exception);
}