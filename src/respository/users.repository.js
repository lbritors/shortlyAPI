import bcrypt from "bcrypt";
import { db } from "../database/database.connection.js";


export async function signUpUserDB(body) {
    const { name, email, password} = body;
    const pCrypt = bcrypt.hashSync(password, 10);


    return db.query('insert into users (name, email, password) values ($1, $2, $3)', [name, email, pCrypt])
}

export async function userExistsDB(body) {
    const { email } = body;
    return db.query('select users.email from users where email = $1',[email])
}