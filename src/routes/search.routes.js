import { Router } from "express"
import { searchUser } from "../controller/search.controller.js"
import {tokenValidation} from "../middleware/ValidateToken.js"


const searchRouter = Router()

searchRouter.post('/search',tokenValidation ,searchUser)
export default searchRouter