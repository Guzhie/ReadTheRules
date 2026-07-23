import express from "express";
import cors from "cors";
import authRouter from "./routes/auth.routes.js";
import campanhaRouter from "./routes/campaign.routes.js"
import memberRouter from "./routes/member.routes.js"
import sessionRouter from "./routes/session.routes.js"


const app = express();

app.use(cors());
app.use(express.json());

app.use("/auth", authRouter);
app.use("/campanhas", campanhaRouter);
app.use("/membros", memberRouter);
app.use("/campanhas/:id_campanha/sessoes", sessionRouter);

export default app;