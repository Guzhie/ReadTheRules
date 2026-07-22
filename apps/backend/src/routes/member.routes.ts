import { Router } from "express";
import { authenticate } from "../middlewares/authenticate.js";
import { aceitarConviteController, convidarPlayerController, listarConvitesMestreController, listarConvitesPlayerController, recusarConviteController } from "../controllers/member.controller.js";
const router = Router();

router.use(authenticate);

router.post("/:id_campanha/convidar", convidarPlayerController);
router.patch("/:id_campanha/aceitar", aceitarConviteController);
router.patch("/:id_campanha/recusar", recusarConviteController);
router.get("/:id_campanha/convites", listarConvitesMestreController);
router.get("/convites", listarConvitesPlayerController);

export default router;