const model = require("../../model/auth.model");
const { generateToken } = require("../../services/auth.service");
const bcrypt = require("bcrypt");

const login = async (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res
      .status(400)
      .json({ message: "Please provide both username and password." });
  }

  try {
    let user = await model.login(username);
    if (!user.length > 0) {
      return res.status(401).json({ message: "Account not found!" });
    }

    // Menggunakan bcrypt.compare untuk memverifikasi password
    const passwordMatch = await bcrypt.compare(password, user[0].password);

    if (!passwordMatch) {
      return res.status(401).json({ message: "Invalid password!" });
    }

    // Jika password cocok, generate JWT token dan kirim dalam respons
    const payload = {
      id: user[0].id,
      username: user[0].username,
      usercode: user[0].user_code,
    };

    const token = generateToken(payload);
    res.json({ token, userData: user[0] });
  } catch {
    console.error("Error during login:", error);
    return res.status(500).json({ message: "Error during login." });
  }
};

module.exports = {
  login,
};
