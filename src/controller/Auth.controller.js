import { db } from "../config/database.connect.js"
import bcrypt from "bcrypt"

//Cadastro de usuário
export async function signup(req, res) {
    const { name, email, password, picture_url } = req.body
    try {

        const alreadyExist = await db.query(`SELECT * FROM users WHERE email = '${email}';`)

        if (alreadyExist.rows.length > 0) return res.sendStatus(409)

        const hashedPassword = bcrypt.hashSync(password, 10)

        await db.query(`INSERT INTO users (name, email, password, picture_url) VALUES ($1, $2, $3, $4);`, [name, email, password, picture_url])

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

        const alreadyExist = await db.query(`SELECT * FROM sessions WHERE "userId" = ${user.rows[0].id};`)

        if (alreadyExist.rows.length > 0) {

            const token = uuid()

            await db.query(`UPDATE sessions SET token=$1 WHERE "userId" = $2;`, [token, user.rows[0].id])

            return res.status(200).send({ token: token })
        }

        const token = uuid()

        await db.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2);`, [user.rows[0].id, token])

        return res.status(200).send({ token: token })


    } catch (error) {
        res.status(500).send(error.message)
    }

}