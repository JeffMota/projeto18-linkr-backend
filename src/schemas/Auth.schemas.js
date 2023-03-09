import joi from "joi";

export const singUpSchema = joi.object({
  username: joi.string().max(50).required(),
  email: joi.string().email().required(),
  password: joi.string().required(),
  pictureUrl: joi.string().uri().required(),
});

export const signInSchema = joi.object({
  email: joi.string().email().required(),
  password: joi.string().required(),
});
