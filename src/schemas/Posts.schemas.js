import joi from "joi";

export const postsSchema = joi.object({
  url: joi.string().uri().required(),
  description: joi.string(),
  urlTitle: joi.string(),
});
