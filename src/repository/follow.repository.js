import { db } from "../config/database.connect.js";

class FollowRepository {
    async follow(followerId, followedId) {
        return await db.query(`INSERT INTO follows ("followerId", "followedId") VALUES ($1, $2);`, [followerId, followedId]);
    }

    async unfollow(followerId, followedId) {
        return await db.query(`DELETE FROM follows WHERE "followerId" = $1 AND "followedId" = $2;`, [followerId, followedId]);
    }

    async getFollowing(userId) {
        return await db.query(`SELECT * FROM follows WHERE "followerId" = $1;`, [userId])
    }

    async checkFollow(followerId, followedId) {
        return await db.query(`SELECT * FROM follows WHERE "followerId" = $1 AND "followedId" = $2;`, [followerId, followedId])
    }
}

export default FollowRepository;
