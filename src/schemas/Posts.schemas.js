import joi from "joi";

export const postsSchema = joi.object({
  url: joi.string().uri().required(),
  description: joi.string().max(144),
  urlTitle: joi.string(),
});
