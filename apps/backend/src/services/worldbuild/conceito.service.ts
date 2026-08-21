import prisma from "../../utils/prisma.js";

export const createConceito = async (
    id_campanha: string,
    nome: string,
    descricao?: string,
    tipo?: string,
) => {
    const conceito = await prisma.conceito.create({
        data: {
            id_campanha,
            nome,
            ...(descricao && { descricao }),
            ...(tipo && { tipo }),
        },
    });
    return conceito;
};

export const listarConceitos = async (id_campanha: string) => {
    const conceitos = await prisma.conceito.findMany({
        where: { id_campanha },
    });
    return conceitos;
};

export const getConceitoById = async (id_conceito: string) => {
    const conceito = await prisma.conceito.findUnique({
        where: { id_conceito },
    });
    return conceito;
}; 

export const getConceitoByName = async (nome: string) => {
    const conceito = await prisma.conceito.findFirst({
        where: { nome },
    });
    return conceito;
};

export const updateConceito = async (
    id_conceito: string,
    nome?: string,
    descricao?: string,
    tipo?: string,
) => {
    const conceito = await prisma.conceito.update({
        where: { id_conceito },
        data: {
            ...(nome && { nome }),
            ...(descricao && { descricao }),
            ...(tipo && { tipo }),
        },
    });
    return conceito;
};

export const deleteConceito = async (id_conceito: string) => {
    const conceito = await prisma.conceito.delete({
        where: { id_conceito },
    });
    return conceito;
};