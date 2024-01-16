const purely = require("../database/purely.config");

getAllResult = async () =>
  await purely
    .select("r.result_id", "r.user_code", "r.score", "r.update_at")
    .from("result as r")
    .orderBy("r.score", "desc");

getByUserCode = async (user_code) =>
  await purely
    .select(
      "r.result_id",
      "r.user_code",
      "r.score",
      "r.update_at",
      "u.username",
      "u.level_code"
    )
    .from("result as r")
    .join("user as u", "r.user_code", "=", "u.user_code")
    .where("r.user_code", user_code);
addProgress = async (data) => await purely("result").insert(data);

updateProgress = async (user_code, data) =>
  await purely("result").where("user_code", user_code).update(data);

module.exports = {
  addProgress,
  updateProgress,
  getByUserCode,
  getAllResult,
};
