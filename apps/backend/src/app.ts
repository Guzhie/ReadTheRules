import express from "express";
import cors from "cors";
import authRouter from "./routes/auth.routes.js";
import campanhaRouter from "./routes/campaign.routes.js"
import memberRouter from "./routes/member.routes.js"
import sessionRouter from "./routes/session.routes.js"
import notaRouter from "./routes/note.routes.js"
import personagemRouter from "./routes/worldbuild/personagem.routes.js"
import itemRouter from "./routes/worldbuild/item.routes.js"
import aliancaRouter from "./routes/worldbuild/alianca.routes.js"
import deusRouter from "./routes/worldbuild/deus.routes.js"
import criaturaRouter from "./routes/worldbuild/criatura.routes.js"
import localRouter from "./routes/worldbuild/local.routes.js"
import conceitoRouter from "./routes/worldbuild/conceito.routes.js"
import calendarioEventoRouter from "./routes/calendario/calendarioevento.routes.js"
import calendarioRsvpRouter from "./routes/calendario/calendariorsvp.routes.js";



const app = express();

app.use(cors());
app.use(express.json());

app.use("/auth", authRouter);
app.use("/campanhas", campanhaRouter);
app.use("/membros", memberRouter);
app.use("/campanhas/:id_campanha/sessoes", sessionRouter);
app.use("/campanhas/:id_campanha/notas", notaRouter);
app.use("/campanhas/:id_campanha/personagens", personagemRouter);
app.use("/campanhas/:id_campanha/itens", itemRouter);
app.use("/campanhas/:id_campanha/eventos", calendarioEventoRouter);
app.use("/campanhas/:id_campanha/aliancas", aliancaRouter);
app.use("/campanhas/:id_campanha/deuses", deusRouter);
app.use("/campanhas/:id_campanha/criaturas", criaturaRouter);
app.use("/campanhas/:id_campanha/locais", localRouter);
app.use("/campanhas/:id_campanha/conceitos", conceitoRouter);

app.use("/calendario", calendarioEventoRouter);
app.use("/eventos", calendarioRsvpRouter);

export default app;