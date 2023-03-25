import dotenv from "dotenv";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import AuthRepository from "../repository/auth.repository.js";
dotenv.config();

const authRepository = new AuthRepository();

//Cadastro de usuário
export async function signup(req, res) {
  const { username, email, password, pictureUrl } = req.body;
  try {
    const alreadyExist = await authRepository.emailCheck(email);

    if (alreadyExist.rows.length > 0) return res.sendStatus(409);

    const hashedPassword = bcrypt.hashSync(password, 10);

    await authRepository.userRegistry(
      username,
      email,
      hashedPassword,
      pictureUrl
    );
    res.sendStatus(201);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

//Login
export async function signin(req, res) {
  const { email, password } = req.body;

  try {
    const user = await authRepository.emailCheck(email);
    if (user.rows.length < 1) return res.sendStatus(401);
    const passwordIsCorrect = bcrypt.compareSync(
      password,
      user.rows[0].password
    );
    if (!passwordIsCorrect) return res.sendStatus(401);

    const token = jwt.sign(
      { userId: user.rows[0].id },
      process.env.SECRET_KEY,
      { expiresIn: 86400 }
    );

    return res.send({
      token: token,
      userImgUrl: user.rows[0].pictureUrl,
      userId: user.rows[0].id,
    });
  } catch (error) {
    res.status(500).send(error.message);
  }
}
