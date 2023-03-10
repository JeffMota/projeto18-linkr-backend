import { Router } from "express";
import { likesCreate } from "../controller/Likes.controller.js";
import validateSchema from "../middleware/ValidateSchemas.js";
import { tokenValidation } from "../middleware/ValidateToken.js";
import { likesSchema } from "../schemas/Likes.schemas.js";

const likesRouter = Router();
likesRouter.post(
  "/likes",
  tokenValidation,
  validateSchema(likesSchema),
  likesCreate
);

export default likesRouter;
