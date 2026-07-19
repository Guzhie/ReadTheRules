-- CreateTable
CREATE TABLE "Alianca" (
    "id_alianca" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "descricao" TEXT,

    CONSTRAINT "Alianca_pkey" PRIMARY KEY ("id_alianca")
);

-- CreateTable
CREATE TABLE "CalendarioEvento" (
    "id_evento" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "titulo" VARCHAR(100) NOT NULL,
    "dt_evento" TIMESTAMP(6) NOT NULL,
    "dt_criacao" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CalendarioEvento_pkey" PRIMARY KEY ("id_evento")
);

-- CreateTable
CREATE TABLE "CalendarioRsvp" (
    "id_rsvp" UUID NOT NULL,
    "id_evento" UUID NOT NULL,
    "id_usuario" UUID NOT NULL,
    "status" VARCHAR(15) NOT NULL DEFAULT 'pendente',
    "dt_resposta" TIMESTAMP(6),

    CONSTRAINT "CalendarioRsvp_pkey" PRIMARY KEY ("id_rsvp")
);

-- CreateTable
CREATE TABLE "Campanha" (
    "id_campanha" UUID NOT NULL,
    "titulo" VARCHAR(100) NOT NULL,
    "descricao" TEXT,
    "dt_criacao" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Campanha_pkey" PRIMARY KEY ("id_campanha")
);

-- CreateTable
CREATE TABLE "Conceito" (
    "id_conceito" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "categoria" VARCHAR(60),
    "descricao" TEXT,

    CONSTRAINT "Conceito_pkey" PRIMARY KEY ("id_conceito")
);

-- CreateTable
CREATE TABLE "Criatura" (
    "id_criatura" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "tipo" VARCHAR(60),
    "descricao" TEXT,

    CONSTRAINT "Criatura_pkey" PRIMARY KEY ("id_criatura")
);

-- CreateTable
CREATE TABLE "Deus" (
    "id_deus" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "dominio" VARCHAR(100),
    "descricao" TEXT,

    CONSTRAINT "Deus_pkey" PRIMARY KEY ("id_deus")
);

-- CreateTable
CREATE TABLE "DocumentoExterno" (
    "id_documento" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "nome" VARCHAR(150) NOT NULL,
    "tipo" VARCHAR(10) NOT NULL,
    "conteudo" TEXT NOT NULL,
    "vector" TEXT,
    "dt_upload" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DocumentoExterno_pkey" PRIMARY KEY ("id_documento")
);

-- CreateTable
CREATE TABLE "HistoricoIA" (
    "id_consulta" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "id_usuario" UUID NOT NULL,
    "pergunta" TEXT NOT NULL,
    "resposta" TEXT NOT NULL,
    "tipo" VARCHAR(15) NOT NULL,
    "dt_consulta" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "HistoricoIA_pkey" PRIMARY KEY ("id_consulta")
);

-- CreateTable
CREATE TABLE "Item" (
    "id_item" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "descricao" TEXT,
    "raridade" VARCHAR(20) DEFAULT 'comum',

    CONSTRAINT "Item_pkey" PRIMARY KEY ("id_item")
);

-- CreateTable
CREATE TABLE "ItemPosse" (
    "id_item_posse" UUID NOT NULL,
    "id_item" UUID NOT NULL,
    "dono_tipo" VARCHAR(20) NOT NULL,
    "dono_id" UUID NOT NULL,
    "dt_posse" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ItemPosse_pkey" PRIMARY KEY ("id_item_posse")
);

-- CreateTable
CREATE TABLE "Local" (
    "id_local" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "tipo" VARCHAR(50),
    "descricao" TEXT,

    CONSTRAINT "Local_pkey" PRIMARY KEY ("id_local")
);

-- CreateTable
CREATE TABLE "MembroCampanha" (
    "id_membro" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "id_usuario" UUID NOT NULL,
    "role" VARCHAR(10) NOT NULL DEFAULT 'jogador',
    "status" VARCHAR(15) NOT NULL DEFAULT 'pendente',
    "dt_entrada" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MembroCampanha_pkey" PRIMARY KEY ("id_membro")
);

-- CreateTable
CREATE TABLE "Nota" (
    "id_nota" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "titulo" VARCHAR(100) NOT NULL,
    "corpo" TEXT NOT NULL,
    "categoria" VARCHAR(20) NOT NULL,
    "visibilidade" VARCHAR(10) NOT NULL DEFAULT 'mestre',
    "dt_criacao" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dt_atualizacao" TIMESTAMP(6),

    CONSTRAINT "Nota_pkey" PRIMARY KEY ("id_nota")
);

-- CreateTable
CREATE TABLE "NoteEmbedding" (
    "id_embedding" UUID NOT NULL,
    "id_nota" UUID NOT NULL,
    "vector" TEXT NOT NULL,
    "dt_criacao" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "NoteEmbedding_pkey" PRIMARY KEY ("id_embedding")
);

-- CreateTable
CREATE TABLE "Personagem" (
    "id_personagem" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "id_alianca" UUID,
    "nome" VARCHAR(100) NOT NULL,
    "tipo" VARCHAR(10) NOT NULL DEFAULT 'npc',
    "descricao" TEXT,

    CONSTRAINT "Personagem_pkey" PRIMARY KEY ("id_personagem")
);

-- CreateTable
CREATE TABLE "Sessao" (
    "id_sessao" UUID NOT NULL,
    "id_campanha" UUID NOT NULL,
    "titulo" VARCHAR(100),
    "resumo" TEXT,
    "status" VARCHAR(20) NOT NULL DEFAULT 'planejada',
    "dt_sessao" TIMESTAMP(6),

    CONSTRAINT "Sessao_pkey" PRIMARY KEY ("id_sessao")
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id_usuario" UUID NOT NULL,
    "nome_usuario" VARCHAR(80) NOT NULL,
    "email_usuario" VARCHAR(120) NOT NULL,
    "senha_usuario" VARCHAR(255) NOT NULL,
    "foto_perfil" VARCHAR(255),
    "dt_criacao" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_usuario")
);

-- CreateIndex
CREATE UNIQUE INDEX "NoteEmbedding_id_nota_key" ON "NoteEmbedding"("id_nota");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_usuario_key" ON "Usuario"("email_usuario");

-- AddForeignKey
ALTER TABLE "Alianca" ADD CONSTRAINT "Alianca_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "CalendarioEvento" ADD CONSTRAINT "CalendarioEvento_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "CalendarioRsvp" ADD CONSTRAINT "CalendarioRsvp_id_evento_fkey" FOREIGN KEY ("id_evento") REFERENCES "CalendarioEvento"("id_evento") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "CalendarioRsvp" ADD CONSTRAINT "CalendarioRsvp_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Conceito" ADD CONSTRAINT "Conceito_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Criatura" ADD CONSTRAINT "Criatura_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Deus" ADD CONSTRAINT "Deus_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "DocumentoExterno" ADD CONSTRAINT "DocumentoExterno_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "HistoricoIA" ADD CONSTRAINT "HistoricoIA_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "HistoricoIA" ADD CONSTRAINT "HistoricoIA_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Item" ADD CONSTRAINT "Item_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ItemPosse" ADD CONSTRAINT "ItemPosse_id_item_fkey" FOREIGN KEY ("id_item") REFERENCES "Item"("id_item") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Local" ADD CONSTRAINT "Local_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "MembroCampanha" ADD CONSTRAINT "MembroCampanha_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "MembroCampanha" ADD CONSTRAINT "MembroCampanha_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Nota" ADD CONSTRAINT "Nota_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "NoteEmbedding" ADD CONSTRAINT "NoteEmbedding_id_nota_fkey" FOREIGN KEY ("id_nota") REFERENCES "Nota"("id_nota") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Personagem" ADD CONSTRAINT "Personagem_id_alianca_fkey" FOREIGN KEY ("id_alianca") REFERENCES "Alianca"("id_alianca") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Personagem" ADD CONSTRAINT "Personagem_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Sessao" ADD CONSTRAINT "Sessao_id_campanha_fkey" FOREIGN KEY ("id_campanha") REFERENCES "Campanha"("id_campanha") ON DELETE CASCADE ON UPDATE NO ACTION;
