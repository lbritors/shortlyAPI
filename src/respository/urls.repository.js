import { db } from "../database/database.connection.js";

export async function insertUrlDB(url, user_id, urlShortened) {
    
    return db.query(`insert into urls (user_id, url, short_url) values ($1, $2, $3) returning url_id, short_url`, [user_id, url, urlShortened]);
}

export async function checkToken(authorization) {
    
    return db.query(`select * from sessions where u_token = $1`, [authorization]) 

}

export async function getUrlIdDB(id) {
    
    return db.query(`select * from urls where url_id = $1`, [id]);
}

export async function getUrlDB(short_url) {
    return db.query(`select * from urls where short_url = $1`, [short_url]);
}

export async function updateVisitCountDB(short_url) {
    return db.query(`update urls set visit_count = visit_count + 1 where short_url = $1`, [short_url]);
}

export async function checkOwnerDB(id, token) {
    return db.query(`select sessions.user_id, sessions.u_token, urls.user_id from sessions, urls where url_id = $1
    and sessions.user_id = urls.user_id and u_token = $2`, [id, token]);
}

export async function deleteUrlDB(id) {
    return db.query(`delete from urls where url_id = $1`, [id]);
}