import { signUpUserDB, userExistsDB } from "../respository/users.repository.js";


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