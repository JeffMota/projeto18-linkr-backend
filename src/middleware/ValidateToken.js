import jwt from "jsonwebtoken";

export default function validateToken() {
  return async (req, res, next) => {
    const { authorization } = req.headers;
    if (!authorization) return res.sendStatus(401);
    const token = authorization.replace("Bearer ", "");
    jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
      if (err) return res.sendStatus(401);

      res.locals.userId = decoded.userId;
      next();
    });
  };
}

export async function tokenValidation(req, res, next) {
  const { authorization } = req.headers;
  const secretKey = process.env.SECRET_KEY;
  const token = authorization?.replace("Bearer ", "");
  try {
    const data = jwt.verify(token, secretKey);
    res.locals.userId = data.userId;
    next();
  } catch {
    return res.status(401).send("Your session expired, sign-in again.");
  }
}
