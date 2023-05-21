import { Router } from "express";
import { validateSchema } from "../middlewares/validate.schema.js";
import { urlsSchema } from "../schemas/urls.schemas.js";
import { createURL, getIdUrl, urlRedirect } from "../controllers/urls.controllers.js";

const urlsRouter = Router();


urlsRouter.post("/urls/shorten", validateSchema(urlsSchema), createURL);
urlsRouter.get("/urls/:id", getIdUrl);
urlsRouter.get("/urls/open/:shortUrl", urlRedirect);


export default urlsRouter;