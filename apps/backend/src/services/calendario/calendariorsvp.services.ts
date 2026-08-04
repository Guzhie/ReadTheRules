import prisma from "../../utils/prisma.js";

export const confirmarPresenca = async (
  id_evento: string,
  id_usuario: string,
) => {
  const rsvp = await prisma.calendarioRsvp.upsert({
    where: {
      id_evento_id_usuario: {
        id_evento,
        id_usuario,
      },
    },
    update: { status: "confirmado", dt_resposta: new Date() },
    create: {
      id_evento,
      id_usuario,
      status: "confirmado",
      dt_resposta: new Date(),
    },
  });
  return rsvp;
};

export const recusarPresenca = async (
  id_evento: string,
  id_usuario: string,
) => {
  const rsvp = await prisma.calendarioRsvp.upsert({
    where: {
      id_evento_id_usuario: {
        id_evento,
        id_usuario,
      },
    },
    update: { status: "recusado", dt_resposta: new Date() },
    create: {
      id_evento,
      id_usuario,
      status: "recusado",
      dt_resposta: new Date(),
    },
  });
  return rsvp;
};

export const listarRsvps = async (id_evento: string) => {
  const rsvps = await prisma.calendarioRsvp.findMany({
    where: { id_evento },
  });
  return rsvps;
};
