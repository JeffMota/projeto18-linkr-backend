import PostsRepository from "../repository/posts.repository.js";
const postsRepository = new PostsRepository();

//Criação de Posts
export async function postsCreate(_, res) {
  const { userId, body } = res.locals;
  try {
    const response = await postsRepository.postsRegistry(
      userId,
      body.url,
      body.description
    );
    res.sendStatus(201);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

//Pegar os Posts
export async function postsRead(_, res) {
  try {
    const response = await postsRepository.postsGetAll();
    res.status(200).send(response.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
}
