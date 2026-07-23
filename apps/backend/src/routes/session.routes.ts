import { Router } from "express";
import { authenticate } from "../middlewares/authenticate.js";
import { createSessaoController, deleteSessaoController, getSessaoByIdController, listSessoesController, updateSessaoController } from "../controllers/session.controller.js";

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post("/",createSessaoController);
router.get("/",listSessoesController);
router.get("/:id_sessao",getSessaoByIdController);
router.patch("/:id_sessao",updateSessaoController);
router.delete("/:id_sessao",deleteSessaoController);

export default router;