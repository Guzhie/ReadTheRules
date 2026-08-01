import express from "express";
import cors from "cors";
import authRouter from "./routes/auth.routes.js";
import campanhaRouter from "./routes/campaign.routes.js"
import memberRouter from "./routes/member.routes.js"
import sessionRouter from "./routes/session.routes.js"
import notaRouter from "./routes/note.routes.js"
import personagemRouter from "./routes/worldbuild/personagem.routes.js"
import itemRouter from "./routes/worldbuild/item.routes.js"


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

export default app;