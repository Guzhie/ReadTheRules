import type { Request, Response } from "express";
import { atualizarEvento, criarEvento, deletarEvento, listarEventos, listarEventosPorUsuario } from "../../services/calendario/calendarioevento.service.js";


export const createEventoController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const { titulo, dt_evento } = req.body;
        const evento = await criarEvento(id_campanha, titulo, dt_evento);
        res.status(201).json({ evento });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listEventosController = async (req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as { id_campanha: string };
        const eventos = await listarEventos(id_campanha);
        res.status(200).json({ eventos });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listarEventosPorUsuarioController = async (req: Request, res: Response) => {
    try {
        const { id_usuario } = req.user.id
        const eventos = await listarEventosPorUsuario(id_usuario);
        res.status(200).json({ eventos });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const updateEventoController = async (req: Request, res: Response) => {
    try {
        const { id_evento } = req.params as { id_evento: string };
        const { titulo, dt_evento } = req.body;
        const evento = await atualizarEvento(id_evento, titulo, dt_evento);
        res.status(200).json({ evento });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const deleteEventoController = async (req: Request, res: Response) => {
    try {
        const { id_evento } = req.params as { id_evento: string };
        const evento = await deletarEvento(id_evento);
        res.status(204).send();
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}