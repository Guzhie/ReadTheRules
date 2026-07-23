import type { Request, Response } from "express";
import { criarSessao, deleteSessao, getSessaoById, listarSessoes, updateSessao } from "../services/session.services.js";

export const createSessaoController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const { status, titulo, resumo } = req.body;
        const sessao = await criarSessao(id_campanha, status, titulo, resumo);
        res.status(201).json({ sessao });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listSessoesController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const sessoes = await listarSessoes(id_campanha);
        res.status(200).json({ sessoes });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}   

export const getSessaoByIdController = async (req: Request, res: Response) => {
    try {
        const { id_sessao } = req.params as { id_sessao: string };
        const sessao = await getSessaoById(id_sessao);
        res.status(200).json({ sessao });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const updateSessaoController = async (req: Request, res: Response) => {
    try {
        const { id_sessao } = req.params as { id_sessao: string };
        const { status, titulo, resumo } = req.body;
        const sessao = await updateSessao(id_sessao, status, titulo, resumo);
        res.status(200).json({ sessao });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const deleteSessaoController = async (req: Request, res: Response) => {
    try {
        const { id_sessao } = req.params as { id_sessao: string };
        const sessao = await deleteSessao(id_sessao);
        res.status(204).json({ sessao });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}