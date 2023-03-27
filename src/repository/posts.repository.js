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
      `SELECT 
        posts.id, 
        posts."userId", 
        users.username, 
        users."pictureUrl", 
        posts.url, 
        posts.description, 
        posts."urlTitle", 
        posts."urlDescription", 
        posts."urlImage", 
        (SELECT 
            CASE 
                WHEN (SELECT COUNT(*) FROM likes WHERE "postId" = posts.id) = 0 
                THEN '[]'::json 
                ELSE json_agg(
                  CASE 
                      WHEN likes."userId" = $1 THEN 'Você' 
                      ELSE users.username
                  END
                ) 
            END
        FROM likes
        LEFT JOIN users ON likes."userId" = users.id
        WHERE likes."postId" = posts.id
        ) AS "likesUsernames",
        (SELECT 
            CASE 
                WHEN (SELECT COUNT(*) FROM likes WHERE "postId" = posts.id) = 0 
                THEN '[]'::json 
                ELSE json_agg(DISTINCT likes."userId") 
            END
        FROM likes
        WHERE likes."postId" = posts.id
        ) AS "likesUserId",
        (
          SELECT 
            json_agg(json_build_object(
              'id', id,
              'username', username,
              'pictureUrl', "pictureUrl",
              'comment', comment, 
              'followStatus', followStatus
            ))
          FROM (
            SELECT 
              comments.id,
              users.username, 
              users."pictureUrl",
              comments.text AS comment, 
              (
                SELECT CASE 
                  WHEN users.id = posts."userId" THEN ' • post’s author' 
                  WHEN EXISTS (SELECT 1 FROM follows WHERE "followerId" = $1 AND "followingId" = users.id) THEN ' • following'
                  ELSE '' 
                END
                FROM users 
                LEFT JOIN follows ON users.id = follows."followingId" AND follows."followerId" = $1
                WHERE users.id = comments."userId"
              ) AS followStatus
            FROM comments
            LEFT JOIN users ON comments."userId" = users.id
            WHERE comments."postId" = posts.id
            ORDER BY comments."createdAt" ASC
          ) AS "comments"
        ) AS "comments"
    FROM 
        posts
        LEFT JOIN users ON posts."userId" = users.id
    GROUP BY 
        posts.id, 
        users.username, 
        users."pictureUrl", 
        posts.url, 
        posts.description, 
        posts."urlTitle", 
        posts."urlDescription", 
        posts."urlImage"
    ORDER BY posts."createdAt" DESC
    LIMIT 20;`,
      [userId]
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
    return await db.query(`SELECT * FROM posts WHERE "userId" = $1`, [id]);
  }
  async postGetUsername(id) {
    return await db.query(
      `SELECT users.username ,posts.url, posts.description FROM posts 
    LEFT JOIN users 
    ON posts."userId" = users.id
    WHERE users.id = $1`,
      [id]
    );
  }
}

export default PostsRepository;
