import type { Request, Response } from "express";
import {
  createCampanha,
  deleteCampanha,
  getCampanhaById,
  listarMembros,
  listCampanha,
  updateCampanha,
} from "../services/campaign.service.js";
import { removerMembro } from "../services/member.service.js";

export const createCampanhaController = async (req: Request, res: Response) => {
  try {
    const { titulo, descricao } = req.body;
    const id_usuario = req.user.id;
    const campanha = await createCampanha(titulo, descricao, id_usuario);
    res.status(201).json({ campanha });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const listCampanhaController = async (req: Request, res: Response) => {
  try {
    const id_usuario = req.user.id;
    const membro = await listCampanha(id_usuario);
    res.status(200).json({ membro });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const getCampanhaByIdController = async (
  req: Request,
  res: Response,
) => {
  try {
    const { id_campanha } = req.params as { id_campanha: string };
    const campanha = await getCampanhaById(id_campanha);
    res.status(200).json({ campanha });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const updateCampanhaController = async (req: Request, res: Response) => {
  try {
    const { id_campanha } = req.params as { id_campanha: string };
    const { titulo, descricao } = req.body;
    const campanha = await updateCampanha(id_campanha, titulo, descricao);
    res.status(200).json({ campanha });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const deleteCampanhaController = async (req: Request, res: Response) => {
  try {
    const { id_campanha } = req.params as { id_campanha: string };
    const campanha = await deleteCampanha(id_campanha);
    res.status(204).send();
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const listarMembrosController = async (req: Request, res: Response) => {
  try {
    const { id_campanha } = req.params as { id_campanha: string };
    const membros = await listarMembros(id_campanha);
    res.status(200).json({ membros });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const removerMembroController = async (req: Request, res: Response) => {
  try {
    const { id_campanha, id_usuario } = req.params as {
      id_campanha: string;
      id_usuario: string;
    };
    const membro = await removerMembro(id_campanha, id_usuario, req.user.id);
    res.status(200).json({ membro });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};
