import { Router } from "express"
import { searchUser } from "../controller/search.controller.js"


const searchRouter = Router()

searchRouter.post('/search', searchUser)
export default searchRouter