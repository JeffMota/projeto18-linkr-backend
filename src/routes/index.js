import express from "express";
import authRouter from "./Auth.routes.js";
import postsRouter from "./Posts.routes.js";
import likesRouter from "./Likes.routes.js";
import searchRouter from "./search.routes.js";
import followRouter from "./Follow.routes.js";
import commentsRouter from "./Comments.routes.js";

const router = express.Router();
router.use(authRouter);
router.use(postsRouter);
router.use(likesRouter);
router.use(commentsRouter);
router.use(searchRouter);
router.use(followRouter);

export default router;
