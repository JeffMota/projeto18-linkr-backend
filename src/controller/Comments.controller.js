import CommentsRepository from "../repository/comments.repository.js";
const commentsRepository = new CommentsRepository();

//Dar Likes
export async function commentsCreate(_, res) {
  const { userId, body } = res.locals;
  try {
    await commentsRepository.commentsRegistry(userId, body.postId, body.text);
    await commentsRepository.commentsNotify();
    res.sendStatus(200);
  } catch (error) {
    res.status(500).send(error.message);
  }
}
