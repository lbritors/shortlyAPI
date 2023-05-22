import { getUserDB, signInUserDB, signUpUserDB, userExistsDB } from "../respository/users.repository.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { checkToken, getUrlByUserDB} from "../respository/urls.repository.js";

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
    const { password } = req.body;
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

export async function getUserInfo(req, res) {
    const { authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");

    try {
        const session = await checkToken(token);
        if (!session.rowCount) return res.sendStatus(401); 
        const userInf = await getUserDB(session.rows[0].user_id);
        const usersUrl = await getUrlByUserDB(session.rows[0].user_id);
      
        console.log(usersUrl.rows);
    
        const object = {
            id: userInf.rows[0].u_id,
            name: userInf.rows[0].name,
            visitCount: userInf.rows[0].sum,
            shortenedUrls: usersUrl.rows.map(u => {
                return ({
                    id: u.url_id,
                    shortUrl: u.short_url,
                    url: u.url,
                    visitCount: u.visit_count
                })
            })
        }
        console.log(object);

        res.send(object);
    } catch (err) {
        res.status(500).send(err.message);
    }
}