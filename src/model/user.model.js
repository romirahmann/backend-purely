const purely = require("./../database/purely.config");

getAll = async () => await purely.select("*").from("user");
addUser = async (data) => await purely("user").insert(data);
update = async (data) => await purely("user").update(data);

module.exports = {
  getAll,
  addUser,
};
