import type { Request, Response } from 'express';
import { createConceito, deleteConceito, getConceitoById, getConceitoByName, listarConceitos, updateConceito } from '../../services/worldbuild/conceito.service.js';

export const createConceitoController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const { nome, descricao } = req.body;
        const conceito = await createConceito(id_campanha, nome, descricao);
        res.status(201).json({ conceito });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};  

export const listConceitoController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const conceitos = await listarConceitos(id_campanha);
        res.status(200).json({ conceitos });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
}

export const getConceitoByIdController = async (req: Request, res: Response) => {
    try {
        const { id_conceito } = req.params as { id_conceito: string };
        const conceito = await getConceitoById(id_conceito);
        res.status(200).json({ conceito });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
}

export const getConceitoByNameController = async (req: Request, res: Response) => {
    try {
        const { nome } = req.params as { nome: string };
        const conceito = await getConceitoByName(nome);
        res.status(200).json({ conceito });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const updateConceitoController = async (req: Request, res: Response) => {
    try {
        const { id_conceito } = req.params as { id_conceito: string };
        const { nome, descricao } = req.body;
        const conceito = await updateConceito(id_conceito, nome, descricao);
        res.status(200).json({ conceito });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const deleteConceitoController = async (req: Request, res: Response) => {
    try {
        const { id_conceito } = req.params as { id_conceito: string };
        const conceito = await deleteConceito(id_conceito);
        res.status(204).send();
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};