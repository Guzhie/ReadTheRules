import { Router } from "express";
import { authenticate } from "../middlewares/authenticate.js";
import { createPersonagemController, deletePersonagemController, getPersonagemByNameController, listPersonagensController, updatePersonagemController } from "../controllers/personagem.controller.js";

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post("/", createPersonagemController);
router.get("/", listPersonagensController);
router.get("/:id_personagem", getPersonagemByNameController);
router.patch("/:id_personagem", updatePersonagemController);
router.delete("/:id_personagem", deletePersonagemController);

export default router;