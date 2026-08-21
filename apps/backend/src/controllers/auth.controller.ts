import type { Request, Response } from "express";
import { register, login } from "../services/auth.service.js";

export const registerController = async (req: Request, res: Response) => {
    try {
        const { name, email, senha } = req.body;
        const user = await register(name, email, senha);
        const { senha_usuario, ...userSemSenha } = user;
    res.status(201).json({ user: userSemSenha });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
}

export const loginCotroller = async(req: Request, res: Response) => {
    try {
        const { email, senha } = req.body;
        const user = await login(email, senha);
        res.status(200).json( user )
    } catch (error:any) {
        res.status(400).json({message: error.message})
    }
}