import joi from "joi";

export const likesSchema = joi.object({
  postId: joi.number().integer().required(),
});
