import prisma from "../../utils/prisma.js";

export const criarEvento = async (
  id_campanha: string,
  titulo: string,
  dt_evento: string,
) => {
    const evento = await prisma.calendarioEvento.create({
        data: {
            id_campanha,
            titulo,
            dt_evento: new Date(dt_evento),
        },
    });
    return evento;
}

export const listarEventos = async (id_campanha: string) => {
    const eventos = await prisma.calendarioEvento.findMany({
        where: { id_campanha },
    });
    return eventos;
}

export const listarEventosPorUsuario = async (id_usuario: string) => {
  const membros = await prisma.membroCampanha.findMany({
    where: { id_usuario, status: "ativo" },
    include: {
      Campanha: {
        include: { CalendarioEvento: true }
      }
    }
  });
  
  return membros.flatMap(m => m.Campanha.CalendarioEvento);
}

export const atualizarEvento = async (
    id_evento: string,
    titulo?: string,
    dt_evento?: string,
) => {
    const evento = await prisma.calendarioEvento.update({
        where: { id_evento },
        data: {
            ...(titulo && { titulo }),
            ...(dt_evento && { dt_evento: new Date(dt_evento) }),
        },
    });
    return evento;
}

export const deletarEvento = async (id_evento: string) => {
    const evento = await prisma.calendarioEvento.delete({
        where: { id_evento },
    });
    return evento;
}