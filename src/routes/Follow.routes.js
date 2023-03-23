import { Router } from "express";
import { checkFollowing, followUser, getWhoUFollows, unfollowUser } from "../controller/Follow.controller.js";

const followRouter = Router()

followRouter.get("/followers/:userId", getWhoUFollows)
followRouter.get("/followers/:followerId/:followedId", checkFollowing)
followRouter.post("/followers", followUser)
followRouter.delete("/followers/:followerId/:followedId", unfollowUser)

export default followRouter;