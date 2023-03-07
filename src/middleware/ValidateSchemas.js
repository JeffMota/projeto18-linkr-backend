export default function validateSchema(schema) {
    return (req, res, next) => {
        const { error } = schema.validate(req.body, { abortEarly: false })

        if (error) {
            const err = error.details.map(detail => detail.message)
            return res.status(422).send(err)
        }
        next()
    }
}