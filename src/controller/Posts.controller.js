import PostsRepository from "../repository/posts.repository.js";
import urlMetadata from "url-metadata";
const postsRepository = new PostsRepository();

//Criação de Posts
export async function postsCreate(_, res) {
  const { userId, body } = res.locals;
  try {
    const metadata = await getMetadata(body.url);
    console.log(metadata);
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


export async function postsDelete(req, res) {
  const { id } = req.params;
  const { userId } = res.locals;
  const post = await postsRepository.getPostById(id);

  if (!post) {
    return res.sendStatus(404);
  }

  if (post.userId !== userId) {
    return res.status(404).send("Você não tem permissão para deletar esse post");
  }

  try {
    await postsRepository.deletePost(id);
    res.status(200).send("Post deletado com sucesso");
  }
  catch (error) {
    res.status(500).send(error.message);
  }
}

export async function postsUpdate(req, res) {
  const { id } = req.params;
  const { userId } = res.locals;
  const post = await postsRepository.getPostById(id);

  if (!post) {
    return res.sendStatus(404);
  }

  if (post.userId !== userId) {
    return res.status(404).send("Você não tem permissão para editar esse post");
  }

  try {
    await postsRepository.updatePost(req.body.url, req.body.description, id);
    res.status(200).send("Post atualizado com sucesso");
  }
  catch (error) {
    res.status(500).send(error.message);
  }
}
