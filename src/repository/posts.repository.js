import { db } from "../config/database.connect.js";

class PostsRepository {
  async postsRegistry(userId, url, description, metadata) {
    return await db.query(
      `INSERT INTO posts (
                "userId", 
                url, 
                description,
                "urlTitle",
                "urlDescription",
                "urlImage" 
            ) VALUES ($1, $2, $3, $4, $5, $6);`,
      [
        userId,
        url,
        description,
        metadata.title,
        metadata.description,
        metadata.image,
      ]
    );
  }

  async postsGetAll() {
    return await db.query(
      `SELECT users.username, users."pictureUrl", posts.url, posts.description, posts."urlTitle", posts."urlDescription", posts."urlImage" 
       FROM posts
       LEFT JOIN users ON posts."userId" = users.id
       ORDER BY posts."createdAt" DESC
       LIMIT 20;`
    );
  }
}

export default PostsRepository;
