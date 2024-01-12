const model = require("../../model/answer.model");
const api = require("../../tools/common");

const getAllAnswer = async (req, res) => {
  let data = await model.getAll();
  return api.ok(res, data);
};
const getAnswerByQuestionId = async (req, res) => {
  const questionId = req.params.questionId;
  console.log(questionId);
  try {
    let data = await model.byQuestionId(questionId);
    return api.ok(res, data);
  } catch {
    return api.error(res, "Internal Server Error");
  }
};

module.exports = {
  getAll,
  getAnswerByQuestionId,
};
