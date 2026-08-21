import { Router } from 'express';
import { authenticate } from '../../middlewares/authenticate.js';
import { createAliancaController, deleteAliancaController, getAliancaByIdController, listarAliancaController, updateAliancaController } from '../../controllers/worldbuild/alianca.controller.js';

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post('/', createAliancaController);
router.get('/', listarAliancaController);
router.get('/:id_alianca', getAliancaByIdController);
router.patch('/:id_alianca', updateAliancaController);
router.delete('/:id_alianca', deleteAliancaController);

export default router;