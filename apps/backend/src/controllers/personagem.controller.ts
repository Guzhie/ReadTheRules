import type { Request, Response } from "express";
import { criarPersonagem, deletePersonagem, getPersonagemByName, listarPersonagens, updatePersonagem } from "../services/personagem.services.js";

export const createPersonagemController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const { nome, tipo, descricao, id_alianca } = req.body;
        const personagem = await criarPersonagem(id_campanha, nome, tipo, descricao, id_alianca);
        res.status(201).json({ personagem });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listPersonagensController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const personagens = await listarPersonagens(id_campanha);
        res.status(200).json({ personagens });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const getPersonagemByNameController = async (req: Request, res: Response) => {
    try {
        const { id_personagem } = req.params as { id_personagem: string };
        const personagem = await getPersonagemByName(id_personagem);
        res.status(200).json({ personagem });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const updatePersonagemController = async (req: Request, res: Response) => {
    try {
        const { id_personagem } = req.params as { id_personagem: string };
        const { nome, tipo, descricao, id_alianca } = req.body;
        const personagem = await updatePersonagem(id_personagem, nome, tipo, descricao, id_alianca);
        res.status(200).json({ personagem });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const deletePersonagemController = async (req: Request, res: Response) => {
    try {
        const { id_personagem } = req.params as { id_personagem: string };
        const personagem = await deletePersonagem(id_personagem);
        res.status(204).json({ });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}