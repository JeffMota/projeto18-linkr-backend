import PostsRepository from "../repository/posts.repository.js";
import urlMetadata from "url-metadata";
const postsRepository = new PostsRepository();

//Criação de Posts
export async function postsCreate(_, res) {
  const { userId, body } = res.locals;
  try {
    const metadata = await getMetadata(body.url);
    await postsRepository.postsRegistry(
      userId,
      body.url,
      body.description,
      metadata
    );
    res.sendStatus(201);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

//Pegar as informações do link por metadata
async function getMetadata(url) {
  try {
    const metadata = await urlMetadata(url, { timeout: 5000 });
    return {
      title: metadata.title || "",
      description: metadata.description || "",
      image: metadata.image || "",
    };
  } catch (error) {
    console.error(error);
    return { title: "", description: "", image: "" };
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
