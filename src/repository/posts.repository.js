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
      `SELECT users.username, users.picture_url, posts.url, posts.description
       FROM posts
       LEFT JOIN users ON posts."userId" = users.id
       ORDER BY "createdAt" DESC
       LIMIT 20;`
    );
  }

  async getPostById(id) {
    const result = await db.query(
      `SELECT * FROM posts WHERE id = $1;`,
      [id]
    );
    if(result.length === 0) {
      return null;
    }
    return result.rows[0];
  }

  async deletePost(id) {
    const result = await db.query(
      `DELETE FROM posts WHERE id = $1;`,
      [id]
    );
    return result.affectedRows;
  }

  async updatePost(url, description, id) {
    const result = await db.query(
      `UPDATE posts SET url = $1, description = $2 WHERE id = $3;`,
      [url, description, id]
    );
    return result.affectedRows;
  }
}

export default PostsRepository;
