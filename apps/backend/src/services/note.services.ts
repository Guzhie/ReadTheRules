import prisma from "../utils/prisma.js";

export const createNota = async (
    id_campanha: string,
    titulo: string,
    corpo: string,
    categoria: string,
) => {
    const campanha = await prisma.campanha.findUnique({
        where: {
            id_campanha,
        },
    });

    if (!campanha) {
        throw new Error("Campanha não encontrada");
    }

    const nota = await prisma.nota.create({
        data: {
            id_campanha,
            titulo,
            corpo,
            categoria,
        },
    });

    return nota;
}

export const listNotas = async (
    id_campanha: string,
) => {
    const campanha = await prisma.campanha.findUnique({
        where: {
            id_campanha,
        },
    });

    if (!campanha) {
        throw new Error("Campanha não encontrada");
    }

    const notas = await prisma.nota.findMany({
        where: {
            id_campanha,
        },
    });

    return notas;
}

export const getNotaById = async (
    id_nota: string
) => {
    const nota = await prisma.nota.findUnique({
        where: {
            id_nota,
        },
    });

    if (!nota) {
        throw new Error("Nota não encontrada");
    }

    return nota;
}

export const updateNota = async (
    id_nota: string,
    titulo?: string,
    corpo?: string,
    categoria?: string,
) => {
    const nota = await prisma.nota.update({
        where: {
            id_nota,
        },
        data: {
            ...( titulo && { titulo }),
            ...(corpo && { corpo }),
            ...(categoria && { categoria }),
        },
    });

    return nota;
}

export const deleteNota = async (
    id_nota: string,
) => {
    const nota = await prisma.nota.delete({
        where: {
            id_nota,
        },
    });

    return nota;
}