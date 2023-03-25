import { db } from "../config/database.connect.js";

class PostsRepository {
  async postsNotify() {
    return await db.query(`NOTIFY posts;`);
  }

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

  async postsGetAll(userId) {
    return await db.query(
      `SELECT posts.id,posts."userId", users.username, users."pictureUrl", 
              posts.url, posts.description, posts."urlTitle", 
              posts."urlDescription", posts."urlImage", COUNT(likes."postId") AS likes,
              (SELECT CASE 
                WHEN (SELECT COUNT(*) FROM likes WHERE "postId" = posts.id) = 0 
                THEN '[]'::json 
                ELSE json_agg(DISTINCT users.username) 
              END
              FROM likes
              LEFT JOIN users ON likes."userId" = users.id
              WHERE likes."postId" = posts.id
              ) AS "likesUsernames",
              (SELECT CASE 
                WHEN (SELECT COUNT(*) FROM likes WHERE "postId" = posts.id) = 0 
                THEN '[]'::json 
                ELSE json_agg(DISTINCT likes."userId") 
              END
              FROM likes
              WHERE likes."postId" = posts.id
              ) AS "likesUserId"   
      FROM posts
      LEFT JOIN users ON posts."userId" = users.id
      LEFT JOIN likes ON posts.id = likes."postId"
      LEFT JOIN follows f ON f."followerId" = $1
      where  f."followingId" = posts."userId"
      GROUP BY posts.id, posts.id, users.username, users."pictureUrl", posts.url, posts.description, posts."urlTitle", posts."urlDescription", posts."urlImage"
      ORDER BY posts."createdAt" DESC
      LIMIT 20;`,[userId]
    );
  }

  async getPostById(id) {
    const result = await db.query(`SELECT * FROM posts WHERE id = $1;`, [id]);
    if (result.length === 0) {
      return null;
    }
    return result.rows[0];
  }

  async deletePost(id) {
    const result = await db.query(`DELETE FROM posts WHERE id = $1;`, [id]);
    return result.affectedRows;
  }

  async updatePost(url, description, id) {
    const result = await db.query(
      `UPDATE posts SET url = $1, description = $2 WHERE id = $3;`,
      [url, description, id]
    );
    return result.affectedRows;
  }

  async postsUser(id) {
    console.log(id, "id");
    return await db.query(
      `
    SELECT * FROM posts WHERE "userId" = $1`,
      [id]
    );
  }
  async postsGetByUser(id) {
    return await db.query(`SELECT username FROM users WHERE id = $1`, [id]);
  }
  async postGetUsername(id) {
    return await db.query(
      `SELECT posts.id,posts."userId", users.username, users."pictureUrl", 
      posts.url, posts.description, posts."urlTitle", 
      posts."urlDescription", posts."urlImage",COUNT(likes."postId") AS likes,
   (SELECT CASE 
        WHEN (SELECT COUNT(*) FROM likes WHERE "postId" = posts.id) = 0 
        THEN '[]'::json 
        ELSE json_agg(DISTINCT users.username) 
      END
      FROM likes
      LEFT JOIN users ON likes."userId" = users.id
      WHERE likes."postId" = posts.id
      ) AS "likesUsernames",
      (SELECT CASE 
        WHEN (SELECT COUNT(*) FROM likes WHERE "postId" = posts.id) = 0 
        THEN '[]'::json 
        ELSE json_agg(DISTINCT likes."userId") 
      END
      FROM likes
      WHERE likes."postId" = posts.id
      ) AS "likesUserId"   
FROM posts
LEFT JOIN users ON posts."userId" = users.id
LEFT JOIN likes ON posts.id = likes."postId"
where posts."userId"= $1
GROUP BY posts.id, posts.id, users.username, users."pictureUrl", posts.url, posts.description, posts."urlTitle", posts."urlDescription", posts."urlImage"
ORDER BY posts."createdAt" DESC
LIMIT 20;`,
      [id]
    );
  }
}

export default PostsRepository;
