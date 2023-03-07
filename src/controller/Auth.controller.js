import { db } from "../config/database.connect.js"
import dotenv from "dotenv"
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"
dotenv.config()

//Cadastro de usuário
export async function signup(req, res) {
    const { username, email, password, picture_url } = req.body
    try {

        const alreadyExist = await db.query(`SELECT * FROM users WHERE email = $1;`, [email])

        if (alreadyExist.rows.length > 0) return res.sendStatus(409)

        const hashedPassword = bcrypt.hashSync(password, 10)

        await db.query(`INSERT INTO users (username, email, password, picture_url) VALUES ($1, $2, $3, $4);`, [username, email, hashedPassword, picture_url])

        res.sendStatus(201)
    } catch (error) {
        res.status(500).send(error.message)
    }

}

//Login
export async function signin(req, res) {
    const { email, password } = req.body

    try {
        const user = await db.query(`SELECT * FROM users WHERE email = '${email}';`)
        if (user.rows.length < 1) return res.sendStatus(401)
        const passwordIsCorrect = bcrypt.compareSync(password, user.rows[0].password)
        if (!passwordIsCorrect) return res.sendStatus(401)

        const token = jwt.sign({ userId: user.rows[0].id }, process.env.SECRET_JWT, { expiresIn: 86400 })

        return res.send({ token: token })


    } catch (error) {
        res.status(500).send(error.message)
    }

}