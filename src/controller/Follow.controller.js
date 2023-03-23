import FollowRepository from "../repository/follow.repository.js";

const followRepository = new FollowRepository();

//Seguir usuário
export async function followUser(req, res) {
    const { followerId, followedId } = req.body;

    if (followerId === followedId) return res.sendStatus(409)

    try {
        const { rows } = await followRepository.checkFollow(followerId, followedId)
        const alreadyFollow = rows.map((f) => {
            if (f.followedId == followedId) return f
        })

        if (alreadyFollow.length > 0) return res.sendStatus(409)

        await followRepository.follow(followerId, followedId)
        res.sendStatus(200)
    } catch (error) {
        res.status(500).send(error.message)
    }
}

//Deixar de seguir
export async function unfollowUser(req, res) {
    const { followerId, followedId } = req.params;

    try {
        await followRepository.unfollow(followerId, followedId)
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

export async function checkFollowing(req, res) {
    const { followerId, followedId } = req.params;

    try {
        const { rows } = await followRepository.checkFollow(followerId, followedId)
        if (rows.length > 0) {
            return res.send(true)
        } else { return res.send(false) }
    } catch (error) {
        res.status(500).send(error.message)
    }

}
