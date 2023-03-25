import { db } from "../config/database.connect.js";

export async function search(username,userId) {
        // return  db.query(`SELECT * FROM users WHERE username LIKE '${username}%'
        // LIMIT 5`)
        return db.query (`SELECT u.*, (f."followerId" IS NOT NULL) AS following
        FROM users u
        LEFT JOIN follows f ON f."followerId" = '${userId}' AND f."followingId" = u.id
        WHERE u.username LIKE '${username}%'
        ORDER BY following DESC`
   )
}
