const model = require("../../model/question.model");
const api = require("../../tools/common");

const getAllQuestionByLevelCode = async (req, res) => {
  const level_code = req.params.levelCode;
  try {
    let [questions] = await model.byLevel(level_code); // Destructuring to get only the first element (questions)
    return api.ok(res, questions);
  } catch (error) {
    console.error("Error fetching questions:", error);
    return api.error(res, "Internal server error");
  }
};

module.exports = {
  getAllQuestionByLevelCode,
};
