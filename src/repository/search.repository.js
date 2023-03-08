import { db } from "../config/database.connect.js";

export async function search(username) {
        return  db.query(`SELECT * FROM users WHERE username LIKE '${username}%'
        LIMIT 5`)
   
}


