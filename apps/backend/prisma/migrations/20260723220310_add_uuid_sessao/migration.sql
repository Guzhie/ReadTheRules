/*
  Warnings:

  - A unique constraint covering the columns `[id_campanha,id_usuario]` on the table `MembroCampanha` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "MembroCampanha_id_campanha_id_usuario_key" ON "MembroCampanha"("id_campanha", "id_usuario");
