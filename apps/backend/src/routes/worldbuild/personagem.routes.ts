import { Router } from "express";
import { authenticate } from "../../middlewares/authenticate.js";
import { createPersonagemController, deletePersonagemController, getPersonagemByIdController, getPersonagemByNameController, listPersonagensController, updatePersonagemController } from "../../controllers/worldbuild/personagem.controller.js";

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post("/", createPersonagemController);
router.get("/", listPersonagensController);
router.get("/:id_personagem", getPersonagemByIdController);
router.get("/:id_personagem", getPersonagemByNameController);
router.patch("/:id_personagem", updatePersonagemController);
router.delete("/:id_personagem", deletePersonagemController);

export default router;