import prisma from '../../utils/prisma.js';

export const createDeus = async (
  id_campanha: string,
  nome: string,
  descricao?: string,
  dominio?: string,
) => {
  const deus = await prisma.deus.create({
    data: {
      id_campanha,
      nome,
      ...(descricao && { descricao }),
      ...(dominio && { dominio }),
    },
  });
  return deus;
};

export const listarDeus = async (id_campanha: string) => {
  const deus = await prisma.deus.findMany({
    where: { id_campanha },
  });
  return deus;
};

export const getDeusById = async (id_deus: string) => {
  const deus = await prisma.deus.findUnique({
    where: { id_deus },
  });
  return deus;
};

export const getDeusByName = async (nome: string) => {
  const deus = await prisma.deus.findFirst({
    where: { nome },
  });
  return deus;
};

export const updateDeus = async (
  id_deus: string,
  nome?: string,
  descricao?: string,
  dominio?: string,
) => {
  const deus = await prisma.deus.update({
    where: { id_deus },
    data: {
      ...(nome && { nome }),
      ...(descricao && { descricao }),
      ...(dominio && { dominio }),
    },
  });
  return deus;
};

export const deleteDeus = async (id_deus: string) => {
  const deus = await prisma.deus.delete({
    where: { id_deus },
  });
  return deus;
};

