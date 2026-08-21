import prisma from "../utils/prisma.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export const register = async (name: string, email: string, senha: string) => {
    const UserExists = await prisma.usuario.findUnique({
        where: {email_usuario: email}
    })
    if (UserExists) {
        throw new Error("Esse email já tem um conta")
    }
    const hashedPassword = await bcrypt.hash(senha, 10)
    const user = await prisma.usuario.create({
        data: {
            nome_usuario: name,
            email_usuario: email,
            senha_usuario: hashedPassword
        }
    })
    return user;
}

export const login = async (email: string, senha: string) => {
    const UserExists = await prisma.usuario.findUnique({
        where: {email_usuario: email}
    })
    if(!UserExists){
        throw new Error ("Não existe uma conta vinculado a esse email")
    }
    const PasswordCorrect = await bcrypt.compare(senha, UserExists.senha_usuario)
    if (!PasswordCorrect) {
        throw new Error ("Senha está incorreta")
    }
    const token = jwt.sign(
        {id: UserExists.id_usuario},
        process.env.JWT_SECRET as string,
        { expiresIn: "12h"}
    );
    return {token}
}   