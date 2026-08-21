import type { Request, Response } from "express";
import {
  createDeus,
  deleteDeus,
  getDeusById,
  getDeusByName,
  listarDeus,
  updateDeus,
} from "../../services/worldbuild/deus.service.js";

export const createDeusController = async (req: Request, res: Response) => {
  try {
    const { id_campanha } = req.params as { id_campanha: string };
    const { nome, dominio, descricao } = req.body;
    const deus = await createDeus(id_campanha, nome, dominio, descricao);
    res.status(201).json({ deus });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const listDeusController = async (req: Request, res: Response) => {
  try {
    const { id_campanha } = req.params as { id_campanha: string };
    const deus = await listarDeus(id_campanha);
    res.status(200).json({ deus });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const getDeusByIdController = async (req: Request, res: Response) => {
  try {
    const { id_deus } = req.params as { id_deus: string };
    const deus = await getDeusById(id_deus);
    res.status(200).json({ deus });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const getDeusByNameController = async (req: Request, res: Response) => {
  try {
    const { nome } = req.params as { nome: string };
    const deus = await getDeusByName(nome);
    res.status(200).json({ deus });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const updateDeusController = async (req: Request, res: Response) => {
  try {
    const { id_deus } = req.params as { id_deus: string };
    const { nome, dominio, descricao } = req.body;
    const deus = await updateDeus(id_deus, nome, dominio, descricao);
    res.status(200).json({ deus });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const deleteDeusController = async (req: Request, res: Response) => {
  try {
    const { id_deus } = req.params as { id_deus: string };
    const deus = await deleteDeus(id_deus);
    res.status(204).send();
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};
