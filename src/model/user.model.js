const purely = require("./../database/purely.config");

getAll = async () => await purely.select("*").from("user");
addUser = async (data) => await purely("user").insert(data);
update = async (userCode, data) =>
  await purely("user").where("user_code", userCode).update(data);

module.exports = {
  getAll,
  addUser,
  update,
};
