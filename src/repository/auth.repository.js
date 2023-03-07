import { db } from "../config/database.connect.js";

export async function emailCheck(email) {
    return await db.query(`SELECT * FROM users WHERE email = $1;`, [email])
}

export async function userRegistry(username, email, hashedPassword, picture_url) {
    await db.query(`INSERT INTO users (username, email, password, picture_url) VALUES ($1, $2, $3, $4);`, [username, email, hashedPassword, picture_url])
}