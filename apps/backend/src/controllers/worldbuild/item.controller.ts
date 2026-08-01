import type { Request, Response } from "express";
import { createItem, deleteItem, getItemById, getItemByName, listarItem, updateItem } from "../../services/worldbuild/item.service.js";

export const createItemController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const { nome, descricao, raride } = req.body;
        const item = await createItem(id_campanha, nome, descricao, raride);
        res.status(201).json({ item });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listItemController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const item = await listarItem(id_campanha);
        res.status(200).json({ item });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const getItemByIdController = async (req: Request, res: Response) => {
    try {
        const { id_item } = req.params as { id_item: string };
        const item = await getItemById(id_item);
        res.status(200).json({ item });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const getItemByNameController = async (req: Request, res: Response) => {
    try {
        const { nome } = req.params as { nome: string };
        const item = await getItemByName(nome);
        res.status(200).json({ item });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const updateItemController = async (req: Request, res: Response) => {
    try {
        const { id_item } = req.params as { id_item: string };
        const { nome, descricao, raridade } = req.body;
        const item = await updateItem(id_item, nome, descricao, raridade    );
        res.status(200).json({ item });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const deleteItemController = async (req: Request, res: Response) => {
    try {
        const { id_item } = req.params as { id_item: string };
        const item = await deleteItem(id_item);
        res.status(204).json({ });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}