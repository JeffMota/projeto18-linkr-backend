import { Router } from "express";
import { commentsCreate } from "../controller/Comments.controller.js";
import validateSchema from "../middleware/ValidateSchemas.js";
import { tokenValidation } from "../middleware/ValidateToken.js";
import { commentsSchema } from "../schemas/Comments.schemas.js";

const commentsRouter = Router();
commentsRouter.post(
  "/comments",
  tokenValidation,
  validateSchema(commentsSchema),
  commentsCreate
);

export default commentsRouter;
