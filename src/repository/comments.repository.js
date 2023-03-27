import { db } from "../config/database.connect.js";

class CommentsRepository {
  async commentsNotify() {
    return await db.query(`NOTIFY comments;`);
  }

  async commentsRegistry(userId, postId, text) {
    return await db.query(
      `INSERT INTO comments (
                "userId", 
                "postId",
                "text"
            ) VALUES ($1, $2, $3);`,
      [userId, postId, text]
    );
  }
}

export default CommentsRepository;
