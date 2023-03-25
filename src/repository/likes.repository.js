import { db } from "../config/database.connect.js";

class LikesRepository {
  async likesNotify() {
    return await db.query(`NOTIFY likes;`);
  }

  async likesRegistry(userId, postId) {
    return await db.query(
      `INSERT INTO likes (
                "userId", 
                "postId"
            ) VALUES ($1, $2);`,
      [userId, postId]
    );
  }

  async dislikesRegistry(userId, postId) {
    return await db.query(
      `DELETE FROM likes WHERE "userId" = $1 AND "postId" = $2;`,
      [userId, postId]
    );
  }

  async checkLikesRegistry(userId, postId) {
    return await db.query(
      `SELECT * FROM likes WHERE "userId" = $1 AND "postId" = $2;`,
      [userId, postId]
    );
  }

  async getLikesRegistry(userId, postId) {
    return await db.query(
      `SELECT users.username
      FROM likes 
      LEFT JOIN likes."userId" = users.id
      WHERE "userId" = $1 AND "postId" = $2;`,
      [userId, postId]
    );
  }
}

export default LikesRepository;
