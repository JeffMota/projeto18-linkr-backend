import { Router } from "express";
import { followUser, getWhoUFollows } from "../controller/Follow.controller.js";

const followRouter = Router()

followRouter.get("/followers/:userId", getWhoUFollows)
followRouter.post("/followers", followUser)

export default followRouter;