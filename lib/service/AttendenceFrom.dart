class FeedbackForm {
  String _name;
  String _rollnumber;

  FeedbackForm(this._name, this._rollnumber);

  String toParams() => "?name=$_name&rollnumber=$_rollnumber";
}
