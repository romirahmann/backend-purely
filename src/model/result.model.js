const purely = require("../database/purely.config");

getByUserCode = async (user_code) =>
  await purely.select("*").from("result").where("user_code", user_code);
addProgress = async (data) => await purely("result").insert(data);

updateProgress = async (user_code, data) =>
  await purely("result").where("user_code", user_code).update(data);

module.exports = {
  addProgress,
  updateProgress,
  getByUserCode,
};
