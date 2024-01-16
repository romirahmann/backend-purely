var express = require("express");
var router = express.Router();

const UserController = require("./../../controller/master_controller/UserController");
const ResultController = require("./../../controller/master_controller/ResultController");
const QuestionController = require("./../../controller/master_controller/QuestionController");
const AnswerController = require("./../../controller/master_controller/AnswerController");

// User API
router.get("/users", UserController.getAllUser);
router.post("/registrasi", UserController.registrasiUser);
router.put("/users/:user_code", UserController.updateUserData);

// Progres
router.get("/getAllResult", ResultController.getAllResult);
router.get("/result/:user_code", ResultController.getByUserCode);
router.post("/add-progress", ResultController.addProgresUser);
router.put("/update-progress/:user_code", ResultController.updateProgress);

// Question
router.get(
  "/getQuestion-by-levelCode/:levelCode",
  QuestionController.getAllQuestionByLevelCode
);

// Anser
router.get(
  "/getAnswer-by-questionId/:questionId",
  AnswerController.getAnswerByQuestionId
);

module.exports = router;
