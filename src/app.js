import express from "express"
import cors from "cors"
import dotenv from "dotenv"
import authRouter from "./routes/Auth.routes.js"
dotenv.config()

const server = express()
server.use(cors())
server.use(express.json())

server.use(authRouter)

const PORT = process.env.PORT || 5000
server.listen(PORT, () => console.log(`Rodando na porta ${PORT}`))
