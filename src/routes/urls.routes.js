import { Router } from "express";
import { validateSchema } from "../middlewares/validate.schema.js";
import { urlsSchema } from "../schemas/urls.schemas.js";
import { createURL } from "../controllers/urls.controllers.js";

const urlsRouter = Router();


urlsRouter.post("/urls/shorten", validateSchema(urlsSchema), createURL);


export default urlsRouter;