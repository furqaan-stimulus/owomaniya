class Expertdetails{
  Expertdetails({
    this.id,
    this.userExpertExp,
  });

  int id;
  int userExpertExp;

  factory Expertdetails.fromJson(Map<String, dynamic> json) => Expertdetails(
    id: json["id"],
    userExpertExp: json["user_expert_exp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_expert_exp": userExpertExp,
  };
}