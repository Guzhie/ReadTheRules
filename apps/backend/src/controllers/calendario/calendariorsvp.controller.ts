import type { Request, Response } from "express";
import { confirmarPresenca, listarRsvps, recusarPresenca } from "../../services/calendario/calendariorsvp.service.js";

export const createRSVPController = async (req: Request, res: Response) => {
    try {
        const { id_evento } = req.params as { id_evento: string };
        const id_usuario  = req.user.id;
        const rsvp = await confirmarPresenca(id_evento, id_usuario);
        res.status(201).json({ rsvp });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listRSVPsController = async (req: Request, res: Response) => {
    try {
        const { id_evento } = req.params as { id_evento: string };
        const rsvps = await listarRsvps(id_evento);
        res.status(200).json({ rsvps });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const recusarRSVPController = async (req: Request, res: Response) => {
    try {
        const { id_evento } = req.params as { id_evento: string };
        const  id_usuario  = req.user.id;
        const rsvp = await recusarPresenca(id_evento, id_usuario);
        res.status(200).json({ rsvp });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}