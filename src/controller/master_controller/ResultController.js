const model = require("../../model/result.model");
const api = require("../../tools/common");

getByUserCode = async (req, res) => {
  const user_code = req.params.user_code;
  if (user_code) {
    let data = await model.getByUserCode(user_code);
    return api.ok(res, data);
  } else {
    return api.error(res, "User Code Not Found");
  }
};

addProgresUser = async (req, res) => {
  const newProgress = req.body;
  if (newProgress) {
    let data = await model.addProgress(newProgress);
    return api.ok(res, data);
  } else {
    return api.error(res, "data not found");
  }
};

updateProgress = async (req, res) => {
  const newData = req.body;
  const user_code = req.params.user_code;

  if (newData) {
    let data = await model.updateProgress(user_code, newData);
    return api.ok(res, data);
  } else {
    return api.error(res, "data not found");
  }
};

module.exports = {
  addProgresUser,
  updateProgress,
  getByUserCode,
};
