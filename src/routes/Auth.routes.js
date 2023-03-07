import { Router } from "express"
import { signin, signup } from "../controller/Auth.controller.js"
import validateSchema from "../middleware/ValidateSchemas.js"
import { signInSchema, singUpSchema } from "../schemas/Auth.schemas.js"

const authRouter = Router()

authRouter.post('/signup', validateSchema(singUpSchema), signup)
authRouter.post('/signin', validateSchema(signInSchema), signin)

export default authRouter