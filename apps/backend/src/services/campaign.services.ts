import prisma from "../utils/prisma.js"

export const createCampanha = async(titulo: string, descricao: string, id_usuario: string ) => {
    const campanha = await prisma.campanha.create({
        data: {
            titulo,
            descricao
        }
    });

    await prisma.membroCampanha.create({
        data: {
            id_campanha: campanha.id_campanha,
            id_usuario,
            role: "mestre",
            status: "ativo"
        }
    });
    return campanha;
}

export const listCampanha = async(id_usuario: string) =>{
    const membro = await prisma.membroCampanha.findMany({
        where: { id_usuario },
        include: { Campanha: true}
    });

    return membro.map(m => ({ ...m.Campanha, role: m.role, status: m.status }));    
}

export const getCampanhaById = async(id_campanha: string) => {
    const campanha = await prisma.campanha.findUnique({
        where: {id_campanha}
    })
    
    return campanha;
}
    

export const updateCampanha = async(id_campanha: string, titulo?: string, descricao?: string) => {
    const campanha = await prisma.campanha.update({
        where: {id_campanha},
        data: {
  ...(titulo && { titulo }),
  ...(descricao && { descricao })
}
    });
    return campanha;
}

export const deleteCampanha = async(id_campanha: string) => {
    const campanha = await prisma.campanha.delete({
        where: { id_campanha }
    });
    
    return campanha;
}