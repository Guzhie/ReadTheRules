import prisma from "../../utils/prisma.js";

export const createCriatura = async (
    id_campanha: string,
    nome: string,
    descricao?: string,
    tipo?: string,
) => {
    const criatura = await prisma.criatura.create({
        data: {
            id_campanha,
            nome,
            ...(descricao && { descricao }),
            ...(tipo && { tipo }),
        },
    });
    return criatura;
};

export const listarCriaturas = async (id_campanha: string) => {
    const criaturas = await prisma.criatura.findMany({
        where: { id_campanha },
    });
    return criaturas;
};

export const getCriaturaById = async (id_criatura: string) => {
    const criatura = await prisma.criatura.findUnique({
        where: { id_criatura },
    });
    return criatura;
};

export const getCriaturaByName = async (nome: string) => {
    const criatura = await prisma.criatura.findFirst({
        where: { nome },
    });
    return criatura;
};

export const updateCriatura = async (
    id_criatura: string,
    nome?: string,
    descricao?: string,
    tipo?: string,
) => {
    const criatura = await prisma.criatura.update({
        where: { id_criatura },
        data: {
            ...(nome && { nome }),
            ...(descricao && { descricao }),
            ...(tipo && { tipo }),
        },
    });
    return criatura;
};

export const deleteCriatura = async (id_criatura: string) => {
    const criatura = await prisma.criatura.delete({
        where: { id_criatura },
    });
    return criatura;
};