import prisma from "../../utils/prisma.js";

export const criarPersonagem = async (
  id_campanha: string,
  nome: string,
  tipo: string,
  descricao?: string,
  id_alianca?: string,
) => {
  const personagem = await prisma.personagem.create({
    data: {
      id_campanha,
      nome,
      tipo,
      ...(descricao && { descricao }),
      ...(id_alianca && { id_alianca }),
    },
  });
  return personagem;
};

export const listarPersonagens = async (id_campanha: string) => {
  const personagens = await prisma.personagem.findMany({
    where: { id_campanha },
  });
  return personagens;
};

export const getPersonagemById = async (id_personagem: string) => {
  const personagem = await prisma.personagem.findUnique({
    where: { id_personagem },
  });
  return personagem;
};

export const getPersonagemByName = async (nome: string) => {
  const personagem = await prisma.personagem.findFirst({
    where: { nome },
  });
  return personagem;
};

export const updatePersonagem = async (
  id_personagem: string,
  nome?: string,
  tipo?: string,
  descricao?: string,
  id_alianca?: string,
) => {
  const personagem = await prisma.personagem.update({
    where: { id_personagem },
    data: {
      ...(nome && { nome }),
      ...(tipo && { tipo }),
      ...(descricao && { descricao }),
      ...(id_alianca && { id_alianca }),
    },
  });
  return personagem;
};

export const deletePersonagem = async (id_personagem: string) => {
  const personagem = await prisma.personagem.delete({
    where: { id_personagem },
  });
  return personagem;
};
