import type { Request, Response } from 'express';
import { createCriatura, deleteCriatura, getCriaturaById, getCriaturaByName, listarCriaturas, updateCriatura, } from '../../services/worldbuild/criatura.service.js';

export const createCriaturaController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const { nome, descricao, tipo } = req.body;
        const criatura = await createCriatura(id_campanha, nome, descricao, tipo);
        res.status(201).json({ criatura });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const listCriaturasController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const criaturas = await listarCriaturas(id_campanha);
        res.status(200).json({ criaturas });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const getCriaturaByIdController = async (req: Request, res: Response) => {
    try {
        const { id_criatura } = req.params as { id_criatura: string };
        const criatura = await getCriaturaById(id_criatura);
        res.status(200).json({ criatura });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const getCriaturaByNameController = async (req: Request, res: Response) => {
    try {
        const { nome } = req.params as { nome: string };
        const criatura = await getCriaturaByName(nome);
        res.status(200).json({ criatura });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const updateCriaturaController = async (req: Request, res: Response) => {
    try {
        const { id_criatura } = req.params as { id_criatura: string };
        const { nome, descricao, tipo } = req.body;
        const criatura = await updateCriatura(id_criatura, nome, descricao, tipo);
        res.status(200).json({ criatura });
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};

export const deleteCriaturaController = async (req: Request, res: Response) => {
    try {
        const { id_criatura } = req.params as { id_criatura: string };
        const criatura = await deleteCriatura(id_criatura);
        res.status(204).send();
    } catch (error: any) {
        res.status(400).json({ message: error.message });
    }
};