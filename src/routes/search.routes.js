import { Router } from "express"
import { searchUser } from "../controller/search.controller.js"
import { getUserName } from "../controller/Posts.controller.js"
import {tokenValidation} from "../middleware/ValidateToken.js"


const searchRouter = Router()

searchRouter.post('/search',tokenValidation ,searchUser)
searchRouter.get('/search/:id',tokenValidation ,getUserName)


export default searchRouter