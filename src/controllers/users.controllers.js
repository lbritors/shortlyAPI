import { signInUserDB, signUpUserDB, userExistsDB } from "../respository/users.repository.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

export async function signUp(req, res) {

    try {
        const check = await userExistsDB(req.body);
        if (check.rowCount) return res.status(409).send("Email já existente!");
        const result = await signUpUserDB(req.body);
        res.status(200).send("User created");
        
    } catch (err) {
        res.status(500).send(err.message);
        
    }
}

export async function signIn(req, res) {
    const { email, password } = req.body;
    try {
        const usersRes = await userExistsDB(req.body);
        if (!usersRes.rowCount || !bcrypt.compareSync(password, usersRes.rows[0].password)) return res.sendStatus(401);
        const token = uuid();
        const session = [usersRes.rows[0].u_id, token]
        const sessionRes = await signInUserDB(session);
        res.status(200).send({token : token});
        
    } catch (err) {
        res.status(500).send(err.message);
    }
}