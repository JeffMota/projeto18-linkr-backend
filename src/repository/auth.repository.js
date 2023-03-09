import { db } from "../config/database.connect.js";

class AuthRepository {
  async emailCheck(email) {
    return await db.query(`SELECT * FROM users WHERE email = $1;`, [email]);
  }

  async userRegistry(username, email, hashedPassword, pictureUrl) {
    return await db.query(
      `INSERT INTO users (
                username, 
                email, 
                password, 
                "pictureUrl"
            ) VALUES ($1, $2, $3, $4);`,
      [username, email, hashedPassword, pictureUrl]
    );
  }
}

export default AuthRepository;
