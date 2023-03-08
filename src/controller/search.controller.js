import dotenv from "dotenv"
import {search}  from "../repository/search.repository.js"
dotenv.config()

//buscar usuario 

export async function searchUser(req,res){
    const {username} = req.body
    try {
        const result = await search(username)

        if(result.rowCount===0){
            return res.sendStatus(404)
        }
        return res.send(result.rows)


    } catch (error) {
        res.send(error)
    }
}