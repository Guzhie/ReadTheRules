import { Router } from 'express';
import { authenticate } from '../../middlewares/authenticate.js';
import { createCriaturaController, deleteCriaturaController, getCriaturaByIdController, getCriaturaByNameController, listCriaturasController, updateCriaturaController } from '../../controllers/worldbuild/criatura.controller.js';

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post('/', createCriaturaController);
router.get('/', listCriaturasController);
router.get('/:id_criatura', getCriaturaByIdController);
router.get('/nome/:nome', getCriaturaByNameController);
router.patch('/:id_criatura', updateCriaturaController);
router.delete('/:id_criatura', deleteCriaturaController);

export default router;