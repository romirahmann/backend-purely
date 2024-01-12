const model = require("./../../model/user.model");
const api = require("./../../tools/common");
const bcrypt = require("bcrypt");

getAllUser = async (req, res) => {
  let data = await model.getAll();
  return api.ok(res, data);
};

registrasiUser = async (req, res) => {
  const newUser = req.body;
  console.log(newUser);
  if (newUser && newUser.password && typeof newUser.password === "string") {
    try {
      const hashedPassword = await bcrypt.hash(newUser.password, 10); // Enkripsi password sebelum disimpan
      newUser.password = hashedPassword;
      newUser.user_code =
        newUser.username + Math.floor(100 + Math.random() * 900);

      let data = await model.addUser(newUser);
      return api.ok(res, data);
    } catch (err) {
      console.error("Error while hashing password:", err);
      return api.error(res, "Error while registering user");
    }
  } else {
    return api.error(res, "Invalid password provided");
  }
};

module.exports = {
  getAllUser,
  registrasiUser,
};
