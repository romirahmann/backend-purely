const purley = require("./../database/purely.config");

const getAll = async () => await purley.select("*").from("answer");

const byQuestionId = async (questionId) =>
  await purley
    .select(
      "a.answer_id",
      "a.question_id",
      "a.description",
      "a.status",
      "q.question_id"
    )
    .from("answer as a")
    .join("question as q", "q.question_id", "a.question_id")
    .where("a.question_id", "=", questionId);

module.exports = {
  getAll,
  byQuestionId,
};
