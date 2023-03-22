import FollowRepository from "../repository/follow.repository.js";

const followRepository = new FollowRepository();

export async function followUser(req, res) {
    const { followerId, followedId } = req.body;

    try {
        await followRepository.follow(followerId, followedId)
        res.sendStatus(200)
    } catch (error) {
        res.status(500).send(error.message)
    }
}
export async function getWhoUFollows(req, res) {
    const { userId } = req.params;

    try {
        const { rows } = await followRepository.getFollowing(userId)

        res.send(rows)
    } catch (error) {
        res.status(500).send(error.message)
    }
}
