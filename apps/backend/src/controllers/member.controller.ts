import type { Request, Response } from "express";
import { aceitarConvite, convidarPlayer, listarConvitesJogador, listarConvitesMestre, recusarConvite } from "../services/member.service.js";

export const convidarPlayerController = async(req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as {id_campanha:  string};
        const { id_usuario } = req.body;
        const membro = await convidarPlayer(id_campanha, id_usuario);
        res.status(201).json({ membro });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const aceitarConviteController = async(req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as {id_campanha:  string};
        const id_usuario = req.user.id
        const membro = await aceitarConvite(id_usuario, id_campanha);
        res.status(200).json({ membro });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const recusarConviteController = async(req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as {id_campanha:  string};
        const id_usuario = req.user.id
        const membro = await recusarConvite(id_usuario, id_campanha);
        res.status(200).json({ membro });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listarConvitesMestreController = async(req: Request, res: Response) => {
    try {
        const { id_campanha } = req.params as {id_campanha: string};
        const convites = await listarConvitesMestre(id_campanha);
        res.status(200).json({ convites });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

export const listarConvitesPlayerController = async(req: Request, res: Response) => {
    try {
        const id_usuario = req.user.id
        const convites = await listarConvitesJogador(id_usuario);
        res.status(200).json({ convites });
    } catch (error:any) {
        res.status(400).json({ message: error.message });
    }
}

