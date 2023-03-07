import jwt from "jsonwebtoken"

export default function validateToken() {

    return async (req, res, next) => {
        const { authorization } = req.headers
        if (!authorization) return res.sendStatus(401)
        const token = authorization.replace('Bearer ', '')


        jwt.verify(token, process.env.SECRET_JWT, (err, decoded) => {
            if (err) return res.sendStatus(401)

            res.locals.userId = decoded.userId

            next()
        })
    }
}