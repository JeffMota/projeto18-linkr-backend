import joi from "joi";

export const commentsSchema = joi.object({
  postId: joi.number().integer().required(),
  text: joi.string().max(144).required(),
});
