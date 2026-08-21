import prisma from '../../utils/prisma.js';

export const createLocal = async (
  id_campanha: string,
  nome: string,
  descricao?: string,
  tipo?: string,
) => {
  const local = await prisma.local.create({
    data: {
      id_campanha,
      nome,
      ...(descricao && { descricao }),
      ...(tipo && { tipo }),
    },
  });
  return local;
};

export const listarLocais = async (id_campanha: string) => {
  const locais = await prisma.local.findMany({
    where: { id_campanha },
  });
  return locais;
};

export const getLocalById = async (id_local: string) => {
  const local = await prisma.local.findUnique({
    where: { id_local },
  });
  return local;
};

export const getLocalByName = async (nome: string) => {
  const local = await prisma.local.findFirst({
    where: { nome },
  });
  return local;
};

export const updateLocal = async (
  id_local: string,
  nome?: string,
  descricao?: string,
  tipo?: string,
) => {
  const local = await prisma.local.update({
    where: { id_local },
    data: {
      ...(nome && { nome }),
      ...(descricao && { descricao }),
      ...(tipo && { tipo }),
    },
  });
  return local;
};

export const deleteLocal = async (id_local: string) => {
  const local = await prisma.local.delete({
    where: { id_local },
  });
  return local;
};