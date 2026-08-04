/*
  Warnings:

  - A unique constraint covering the columns `[id_evento,id_usuario]` on the table `CalendarioRsvp` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "CalendarioRsvp_id_evento_id_usuario_key" ON "CalendarioRsvp"("id_evento", "id_usuario");
