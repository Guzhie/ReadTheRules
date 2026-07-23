/*
  Warnings:

  - You are about to drop the `NoteEmbedding` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "NoteEmbedding" DROP CONSTRAINT "NoteEmbedding_id_nota_fkey";

-- DropTable
DROP TABLE "NoteEmbedding";

-- CreateTable
CREATE TABLE "Embedding" (
    "id_embedding" UUID NOT NULL,
    "entidade_tipo" VARCHAR(20) NOT NULL,
    "entidade_id" UUID NOT NULL,
    "vector" TEXT NOT NULL,
    "dt_criacao" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Embedding_pkey" PRIMARY KEY ("id_embedding")
);

-- CreateIndex
CREATE INDEX "Embedding_entidade_tipo_entidade_id_idx" ON "Embedding"("entidade_tipo", "entidade_id");
