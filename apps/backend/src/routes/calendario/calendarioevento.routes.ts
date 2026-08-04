import { Router } from "express";
import { authenticate } from "../../middlewares/authenticate.js";
import { createEventoController, deleteEventoController, listarEventosPorUsuarioController, listEventosController, updateEventoController } from "../../controllers/calendario/calendarioevento.controller.js";

const router = Router({mergeParams: true});

router.use(authenticate);

router.post("/", createEventoController);
router.get("/meus", listarEventosPorUsuarioController);
router.get("/", listEventosController);
router.patch("/:id_evento", updateEventoController);
router.delete("/:id_evento", deleteEventoController);

export default router;