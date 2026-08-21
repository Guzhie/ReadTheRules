import { Router } from 'express';
import { authenticate } from '../../middlewares/authenticate.js';
import { createLocalController, deleteLocalController, getLocalByIdController, listLocaisController, updateLocalController } from '../../controllers/worldbuild/local.controller.js';

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post('/', createLocalController);
router.get('/', listLocaisController);
router.get('/:id_local', getLocalByIdController);
router.patch('/:id_local', updateLocalController);
router.delete('/:id_local', deleteLocalController);

export default router;