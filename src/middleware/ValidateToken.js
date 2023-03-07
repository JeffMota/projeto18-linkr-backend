import { db } from "../config/database.connect.js"

export default function validateToken() {

    return async (req, res, next) => {
        const { authorization } = req.headers
        if (!authorization) return res.sendStatus(401)
        const token = authorization.replace('Bearer ', '')

        const tokenExist = await db.query(`SELECT * FROM sessions WHERE token = '${token}';`)

        if (tokenExist.rows.length < 1) return res.sendStatus(401)

        res.locals.session = tokenExist.rows[0]

        next()
    }
}