import type { Request, Response } from "express";
import { createNota, deleteNota, getNotaById, listNotas, updateNota } from "../services/note.services.js";

export const createNotaController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const { titulo, corpo, categoria } = req.body;
        const nota = await createNota(id_campanha, titulo, corpo, categoria);
        res.status(201).json({ nota });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listNotasController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const notas = await listNotas(id_campanha);
        res.status(200).json({ notas });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const getNotaByIdController = async (req: Request, res: Response) => {
    try {
        const { id_nota } = req.params as { id_nota: string };
        const nota = await getNotaById(id_nota);
        res.status(200).json({ nota });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const updateNotaController = async (req: Request, res: Response) => {
    try {
        const { id_nota } = req.params as { id_nota: string };
        const { titulo, corpo, categoria } = req.body;
        const nota = await updateNota(id_nota, titulo, corpo, categoria);
        res.status(200).json({ nota });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const deleteNotaController = async (req: Request, res: Response) => {
    try {
        const { id_nota } = req.params as { id_nota: string };
        const nota = await deleteNota(id_nota);
        res.status(204).send();
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}