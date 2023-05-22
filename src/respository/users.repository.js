import bcrypt from "bcrypt";
import { db } from "../database/database.connection.js";


export async function signUpUserDB(body) {
    const { name, email, password} = body;
    const pCrypt = bcrypt.hashSync(password, 10);
    return db.query('insert into users (name, email, password) values ($1, $2, $3)', [name, email, pCrypt])
}

export async function userExistsDB(body) {
    const { email } = body;
    return db.query('select * from users where email = $1',[email])
}

export async function signInUserDB(userSession) {
    return db.query('insert into sessions (user_id, u_token) values ($1, $2)', [userSession[0], userSession[1]]);
}

export async function getUserDB(id) {
    return db.query(`select users.u_id, users.name, sum(urls.visit_count)
     from users, urls  
     where users.u_id = $1
     and urls.user_id = users.u_id
     group by users.u_id`, [id]);
}

export async function getRankingDB(limit) {
    return db.query(`select users.u_id as "id", users.name, sum(urls.visit_count) as "visitCount", count(urls.short_url) as "linksCount" from users
    left join urls on users.u_id = urls.user_id
    group by users.u_id
    order by "visitCount" DESC
    limit $1;`, [limit]);
}