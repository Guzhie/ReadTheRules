import prisma from "../../utils/prisma.js";

export const createItem = async (
  id_campanha: string,
  nome: string,
  descricao?: string,
  raride?: string,
) => {
  const item = await prisma.item.create({
    data: {
      id_campanha,
      nome,
      ...(descricao && { descricao }),
      ...(raride && { raride }),
    },
  });
  return item;
};

export const listarItem = async (id_campanha: string) => {
  const item = await prisma.item.findMany({
    where: { id_campanha },
  });
  return item;
};

export const getItemById = async (id_item: string) => {
  const item = await prisma.item.findUnique({
    where: { id_item },
  });
  return item;
};

export const getItemByName = async (nome: string) => {
  const item = await prisma.item.findFirst({
    where: { nome },
  });
  return item;
};

export const updateItem = async (
  id_item: string,
  nome?: string,
  descricao?: string,
  raridade?: string,
) => {
  const item = await prisma.item.update({
    where: { id_item },
    data: {
      ...(nome && { nome }),
      ...(descricao && { descricao }),
      ...(raridade && { raridade }),
    },
  });
  return item;
};

export const deleteItem = async (id_item: string) => {
  const item = await prisma.item.delete({
    where: { id_item },
  });
  return item;
}