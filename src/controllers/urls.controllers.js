import { nanoid } from 'nanoid'
import { checkOwnerDB, checkToken, getUrlDB, getUrlIdDB, insertUrlDB, updateVisitCountDB, deleteUrlDB } from '../respository/urls.repository.js';

export async function createURL(req, res) {
    const { authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");
    const { url } = req.body;
    const urlShortened = req.body.url = nanoid();
    

    try {
        const session = await checkToken(token);
        if (!session.rowCount) return res.sendStatus(401); 
        const insertUrl = await insertUrlDB(url, session.rows[0].user_id, urlShortened);
        console.log(insertUrl.rows[0]);
    
        res.status(201).send(insertUrl.rows[0]);
    } catch (err) {
        res.status(500).send(err.message);
    } 
}

export async function getIdUrl(req, res) {

    try {
        const url = await getUrlIdDB(req.params.id);
        if (!url.rowCount) return res.status(404).send("Url não encontrada!");
        const object = {
            id: url.rows[0].url_id,
            shortUrl: url.rows[0].short_url,
            url: url.rows[0].url
        }
        res.send(object);
    } catch (err) {
        res.status(500).send(err.message);
    }

}

export async function urlRedirect(req, res) {
    const { shortUrl } = req.params;

    try {
        const short_url = await getUrlDB(shortUrl);
        console.log(short_url.rows[0]);
        if (!short_url.rows) return res.status(404).send("Url não encontrada!");
        const update = updateVisitCountDB(shortUrl);
        res.redirect(short_url.rows[0].url);
        
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function deleteUrlId(req, res) {
    const { id } = req.params;
    const { authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");

    try {
        const session = await checkToken(token);
        if (!token || !session.rowCount) return res.sendStatus(401); 
        const exists = await getUrlIdDB(id);
        if (!exists.rowCount) return res.sendStatus(404);
        const url = await checkOwnerDB(id, token);
        if (!url.rowCount) return res.sendStatus(401);
        const result = await deleteUrlDB(id)
        res.sendStatus(204);
    } catch (err) {
        res.status(500).send(err.message);
    }

}