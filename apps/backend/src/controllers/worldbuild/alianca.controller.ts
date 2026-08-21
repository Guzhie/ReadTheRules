import type { Request, Response } from 'express';
import { createAlianca, deleteAlianca, getAliancaById, getAliancaByName, listarAlianca,  updateAlianca } from '../../services/worldbuild/alianca.service.js';

export const createAliancaController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const { nome, descricao, personagem } = req.body;
        const alianca = await createAlianca(id_campanha, nome, descricao, personagem);
        res.status(201).json({ alianca });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const listarAliancaController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const alianca = await listarAlianca(id_campanha);
        res.status(200).json({ alianca });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const getAliancaByIdController = async (req: Request, res: Response) => {
    try {
        const { id_alianca } = req.params as { id_alianca: string };
        const alianca = await getAliancaById(id_alianca);
        res.status(200).json({ alianca });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const getAliancaByNameController = async (req: Request, res: Response) => {
    try {
        const { nome } = req.params as { nome: string };
        const alianca = await getAliancaByName(nome);
        res.status(200).json({ alianca });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
}; 

export const updateAliancaController = async (req: Request, res: Response) => {
    try {
        const { id_alianca } = req.params as { id_alianca: string };
        const { nome, descricao, personagem } = req.body;
        const alianca = await updateAlianca(id_alianca, nome, descricao, personagem);
        res.status(200).json({ alianca });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const deleteAliancaController = async (req: Request, res: Response) => {
    try {
        const { id_alianca } = req.params as { id_alianca: string };
        const alianca = await deleteAlianca(id_alianca);
        res.status(204).send();
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};