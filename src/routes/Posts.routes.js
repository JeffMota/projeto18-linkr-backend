import { Router } from "express";
import { postsCreate, postsRead } from "../controller/Posts.controller.js";
import validateSchema from "../middleware/ValidateSchemas.js";
import validateToken, { tokenValidation } from "../middleware/ValidateToken.js";
import { postsSchema } from "../schemas/Posts.schemas.js";

const postsRouter = Router();
postsRouter.post(
  "/posts",
  tokenValidation,
  validateSchema(postsSchema),
  postsCreate
);
postsRouter.get("/posts", tokenValidation, postsRead);

export default postsRouter;
