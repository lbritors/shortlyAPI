import { Router } from "express";
import { signUp } from "../controllers/users.controllers.js";
import { validateSchema } from "../middlewares/validate.schema.js";
import { signUpSchema } from "../schemas/users.schemas.js";

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(signUpSchema), signUp);


export default usersRouter;