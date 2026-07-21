import { Router } from "express";
import { authenticate } from "../middlewares/authenticate.js";
import { createCampanhaController, listCampanhaController, getCampanhaByIdController, updateCampanhaController, deleteCampanhaController } from "../controllers/campaign.controllers.js";

const router = Router();

router.use(authenticate);

router.post("/", createCampanhaController);
router.get("/", listCampanhaController);
router.get("/:id_campanha", getCampanhaByIdController);
router.put("/:id_campanha", updateCampanhaController);
router.delete("/:id_campanha", deleteCampanhaController);

export default router;