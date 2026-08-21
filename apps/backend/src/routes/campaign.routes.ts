import { Router } from "express";
import { authenticate } from "../middlewares/authenticate.js";
import { createCampanhaController, listCampanhaController, getCampanhaByIdController, updateCampanhaController, deleteCampanhaController, listarMembrosController, removerMembroController} from "../controllers/campaign.controller.js";

const router = Router();

router.use(authenticate);

router.post("/", createCampanhaController);
router.get("/", listCampanhaController);
router.get("/:id_campanha", getCampanhaByIdController);
router.put("/:id_campanha", updateCampanhaController);
router.get("/:id_campanha/membros", listarMembrosController);
router.delete("/:id_campanha/remover/:id_usuario", removerMembroController);
router.delete("/:id_campanha", deleteCampanhaController);

export default router;