import { Router } from "express";
import { authenticate } from "../middlewares/authenticate.js";
import { createNotaController, deleteNotaController, getNotaByIdController, listNotasController, updateNotaController } from "../controllers/note.controller.js";

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post("/", createNotaController);
router.get("/", listNotasController);
router.get("/:id_nota", getNotaByIdController);
router.patch("/:id_nota", updateNotaController);
router.delete("/:id_nota", deleteNotaController);

export default router;