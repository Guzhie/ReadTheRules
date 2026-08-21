import prisma from "../../utils/prisma.js";

export const createAlianca = async (
    id_campanha: string,
    nome: string,
    descricao?: string,
    personagem?: string,
) => {
    const alianca = await prisma.alianca.create({
        data: {
            id_campanha,
            nome,
            ...(descricao && { descricao }),
            ...(personagem && { personagem }),
        },
    });
    return alianca;
};

export const listarAlianca = async (id_campanha: string) => {
    const alianca = await prisma.alianca.findMany({
        where: { id_campanha },
    });
    return alianca;
}

export const getAliancaById = async (id_alianca: string) => {
    const alianca = await prisma.alianca.findUnique({
        where: { id_alianca },
    });
    return alianca;
};

export const getAliancaByName = async (nome: string) => {
    const alianca = await prisma.alianca.findFirst({
        where: { nome },
    });
    return alianca;
};

export const updateAlianca = async (
    id_alianca: string,
    nome?: string,
    descricao?: string,
    personagem?: string,
) => {
    const alianca = await prisma.alianca.update({
        where: { id_alianca },
        data: {
            ...(nome && { nome }),
            ...(descricao && { descricao }),
            ...(personagem && { personagem }),
        },
    });
    return alianca;
};

export const deleteAlianca = async (id_alianca: string) => {
    const alianca = await prisma.alianca.delete({
        where: { id_alianca },
    });
    return alianca;
}