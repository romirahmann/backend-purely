const purley = require("./../database/purely.config");

const byLevel = async (level_code) =>
  await purley.raw(
    `SELECT
        q.question_id,
        q.question,
        q.level_code,
        s.score_id,
        s.score,
        GROUP_CONCAT(CONCAT(a.answer_id, ':', a.description, ':', a.status) SEPARATOR ';') AS answers
      FROM
        question q
      LEFT JOIN
        answer a ON q.question_id = a.question_id
      LEFT JOIN
        score s ON q.question_id = s.question_id
      WHERE
        q.level_code = ?
      GROUP BY
        q.question_id, q.question`,
    [level_code]
  );

// const byLevel = async (level_code) =>
//   await purley
//     .select("question", "level_code")
//     .from("question")
//     .where("level_code", level_code);

module.exports = {
  byLevel,
};
