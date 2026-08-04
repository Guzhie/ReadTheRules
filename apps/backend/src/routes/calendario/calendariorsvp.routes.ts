import { Router } from "express";
import { authenticate } from "../../middlewares/authenticate.js";
import { createRSVPController, listRSVPsController, recusarRSVPController } from "../../controllers/calendario/calendariorsvp.controller.js";

const router = Router({ mergeParams: true });

router.use(authenticate);

router.patch("/:id_evento/confirmar", createRSVPController);
router.get("/:id_evento", listRSVPsController);
router.patch("/:id_evento/recusar", recusarRSVPController);


export default router;