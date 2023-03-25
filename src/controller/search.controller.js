import dotenv from "dotenv"
import {search}  from "../repository/search.repository.js"
dotenv.config()

//buscar usuario 

export async function searchUser(req,res){
    const {username} = req.body
    const { userId } = res.locals;
    console.log(username)
    console.log(userId)
    try {
        const result = await search(username,userId)

        if(result.rowCount===0){
            return res.sendStatus(404)
        }
        console.log(result.rows)

        return res.send(result.rows)


    } catch (error) {
        res.send(error)
    }
}