import { db } from "../config/database.connect.js";

class AuthRepository {

    async emailCheck(email) {
        return await db.query(`SELECT * FROM users WHERE email = $1;`, [email])
    }

    async userRegistry(username, email, hashedPassword, picture_url) {
        return await db.query(
            `INSERT INTO users (
                username, 
                email, 
                password, 
                picture_url
            ) VALUES ($1, $2, $3, $4);`,
            [username, email, hashedPassword, picture_url])
    }
}

export default AuthRepository