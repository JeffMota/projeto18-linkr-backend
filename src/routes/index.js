import express from "express";
import authRouter from "./Auth.routes.js";
import postsRouter from "./Posts.routes.js";
import likesRouter from "./Likes.routes.js";

const router = express.Router();
router.use(authRouter);
router.use(postsRouter);
router.use(likesRouter);

export default router;
