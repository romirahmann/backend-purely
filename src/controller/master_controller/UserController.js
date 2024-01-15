const model = require("./../../model/user.model");
const modelResult = require("./../../model/result.model");
const api = require("./../../tools/common");
const bcrypt = require("bcrypt");

getAllUser = async (req, res) => {
  let data = await model.getAll();
  return api.ok(res, data);
};

registrasiUser = async (req, res) => {
  const newUser = req.body;

  if (newUser && newUser.password && typeof newUser.password === "string") {
    try {
      const hashedPassword = await bcrypt.hash(newUser.password, 10); // Enkripsi password sebelum disimpan
      newUser.password = hashedPassword;
      newUser.user_code =
        newUser.username + Math.floor(100 + Math.random() * 900);

      newDataProgres = {
        user_code: newUser.user_code,
      };

      let data = await model.addUser(newUser);
      await modelResult.addProgress(newDataProgres);
      return api.ok(res, data);
    } catch (err) {
      console.error("Error while hashing password:", err);
      return api.error(res, "Error while registering user");
    }
  } else {
    return api.error(res, "Invalid password provided");
  }
};

updateUserData = async (req, res) => {
  const newData = req.body;
  const user_code = req.params.user_code;
  console.log(user_code);

  if (newData) {
    let data = await model.update(user_code, newData);
    return api.ok(res, data);
  } else {
    return api.error(res, "Data not Found!");
  }
};

module.exports = {
  getAllUser,
  registrasiUser,
  updateUserData,
};
