import type { Request, Response } from "express";
import {
  createLocal,
  listarLocais,
  getLocalById,
  getLocalByName,
  updateLocal,
  deleteLocal,
} from "../../services/worldbuild/local.service.js";

export const createLocalController = async (req: Request, res: Response) => {
  try {
    const { id_campanha } = req.params as { id_campanha: string };
    const { nome, descricao, tipo } = req.body;
    const local = await createLocal(id_campanha, nome, descricao, tipo);
    res.status(201).json({ local });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const listLocaisController = async (req: Request, res: Response) => {
  try {
    const { id_campanha } = req.params as { id_campanha: string };
    const locais = await listarLocais(id_campanha);
    res.status(200).json({ locais });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const getLocalByIdController = async (req: Request, res: Response) => {
  try {
    const { id_local } = req.params as { id_local: string };
    const local = await getLocalById(id_local);
    res.status(200).json({ local });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const getLocalByNameController = async (req: Request, res: Response) => {
  try {
    const { nome } = req.params as { nome: string };
    const local = await getLocalByName(nome);
    res.status(200).json({ local });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const updateLocalController = async (req: Request, res: Response) => {
  try {
    const { id_local } = req.params as { id_local: string };
    const { nome, descricao, tipo } = req.body;
    const local = await updateLocal(id_local, nome, descricao, tipo);
    res.status(200).json({ local });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};

export const deleteLocalController = async (req: Request, res: Response) => {
  try {
    const { id_local } = req.params as { id_local: string };
    await deleteLocal(id_local);
    res.status(204).send();
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};
