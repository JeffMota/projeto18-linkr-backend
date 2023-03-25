import LikesRepository from "../repository/likes.repository.js";
const likesRepository = new LikesRepository();

//Dar Likes
export async function likesCreate(_, res) {
  const { userId, body } = res.locals;
  try {
    const response = await likesRepository.checkLikesRegistry(
      userId,
      body.postId
    );
    if (response.rows.length === 0) {
      await likesRepository.likesRegistry(userId, body.postId);
      await likesRepository.likesNotify();
    } else {
      await likesRepository.dislikesRegistry(userId, body.postId);
      await likesRepository.likesNotify();
    }
    res.sendStatus(200);
  } catch (error) {
    res.status(500).send(error.message);
  }
}
