import prisma from "../utils/prisma.js";

export const criarSessao = async (
  id_campanha: string,
    status: string,
    titulo?: string,
    resumo?: string
) => {
  const sessao = await prisma.sessao.create({
    data: {
      id_campanha,
      ...(titulo && { titulo }),
      ...(resumo && { resumo }),
      status,
    },
  });
  return sessao;
};

export const listarSessoes = async (id_campanha: string) => {
    const sessoes = await prisma.sessao.findMany({  
        where: { id_campanha },
    });
    return sessoes;
}

export const getSessaoById = async (id_sessao: string) => {
    const sessao = await prisma.sessao.findUnique({
        where: { id_sessao },
    });
    return sessao;
}

export const updateSessao = async (
    id_sessao: string,
    status?: string,
    titulo?: string,
    resumo?: string
) => {
    const sessao = await prisma.sessao.update({
        where: { id_sessao },
        data: {
            ...(status && { status }),
            ...(titulo && { titulo }),
            ...(resumo && { resumo }),
        },
    });
    return sessao;
}

export const deleteSessao = async (id_sessao: string) => {
    const sessao = await prisma.sessao.delete({
        where: { id_sessao },
    });
    return sessao;
}

