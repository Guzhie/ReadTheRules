import { Router } from 'express';
import { authenticate } from '../../middlewares/authenticate.js';
import { createConceitoController, listConceitoController,getConceitoByIdController,getConceitoByNameController,updateConceitoController,deleteConceitoController } from '../../controllers/worldbuild/conceito.controller.js';

const router = Router({ mergeParams: true });
router.use(authenticate);

router.post('/', createConceitoController);
router.get('/', listConceitoController);
router.get('/:id_conceito', getConceitoByIdController);
router.get('/nome/:nome', getConceitoByNameController);
router.put('/:id_conceito', updateConceitoController);
router.delete('/:id_conceito', deleteConceitoController);

export default router;