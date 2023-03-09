import { db } from "../config/database.connect.js";

class PostsRepository {
  async postsRegistry(userId, url, description) {
    return await db.query(
      `INSERT INTO posts (
                "userId", 
                url, 
                description 
            ) VALUES ($1, $2, $3);`,
      [userId, url, description]
    );
  }

  async postsGetAll() {
    return await db.query(
      `SELECT users.username, users."pictureUrl", posts.url, posts.description
       FROM posts
       LEFT JOIN users ON posts."userId" = users.id
       ORDER BY posts."createdAt" DESC
       LIMIT 20;`
    );
  }
}

export default PostsRepository;
