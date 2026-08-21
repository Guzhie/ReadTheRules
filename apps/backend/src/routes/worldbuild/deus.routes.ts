import { Router } from 'express';
import { authenticate } from '../../middlewares/authenticate.js';
import { createDeusController, deleteDeusController, getDeusByIdController, listDeusController, updateDeusController } from '../../controllers/worldbuild/deus.controller.js';

const router = Router();
router.use(authenticate);

router.post('/', createDeusController);
router.get('/', listDeusController);
router.get('/:id_deus', getDeusByIdController);
router.put('/:id_deus', updateDeusController);
router.delete('/:id_deus', deleteDeusController);

export default router;