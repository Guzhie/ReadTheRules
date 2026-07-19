import { Router } from "express";
import { loginCotroller, registerController } from "../controllers/auth.controller.js";

const router = Router();

router.post("/register", registerController)
router.post("/login", loginCotroller)

export default router;