import { Router } from "express";
import { getUserInfo, signIn, signUp } from "../controllers/users.controllers.js";
import { validateSchema } from "../middlewares/validate.schema.js";
import { signInSchema, signUpSchema } from "../schemas/users.schemas.js";

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(signUpSchema), signUp);
usersRouter.post("/signin", validateSchema(signInSchema), signIn);
usersRouter.get("/users/me", getUserInfo);

export default usersRouter;