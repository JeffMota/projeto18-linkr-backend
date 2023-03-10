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
      `SELECT posts.id, users.username, users."pictureUrl", posts.url, posts.description, posts."userId", posts."urlTitle", posts."urlDescription", posts."urlImage" 
       FROM posts
       LEFT JOIN users ON posts."userId" = users.id
       ORDER BY posts."createdAt" DESC
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

  async postsUser (id){
    console.log(id,"id")
    return await db.query(`
    SELECT * FROM posts WHERE "userId" = $1`,[id]);
  }
  async postsGetByUser(id) {
    return await db.query(
      `SELECT * FROM posts WHERE "userId" = $1`,[id]
    );
  }
  async postGetUsername(id){
    return await db.query(
    `SELECT users.username ,posts.url, posts.description FROM posts 
    LEFT JOIN users 
    ON posts."userId" = users.id
    WHERE users.id = $1`,[id])
  }

}


export default PostsRepository;
