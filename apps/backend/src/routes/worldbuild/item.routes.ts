import { Router } from "express";
import { authenticate } from "../../middlewares/authenticate.js";
import { createItemController, deleteItemController, getItemByIdController, getItemByNameController, listItemController, updateItemController } from "../../controllers/worldbuild/item.controller.js";

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post("/", createItemController);
router.get("/", listItemController);
router.get("/:id_item", getItemByIdController);
router.get("/nome/:nome", getItemByNameController);
router.patch("/:id_item", updateItemController);
router.delete("/:id_item", deleteItemController);

export default router;