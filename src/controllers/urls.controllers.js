import { nanoid } from 'nanoid'
import { checkToken, getUrlIdDB, insertUrlDB } from '../respository/urls.repository.js';

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
       
        // res.status(201).send(object);
        res.status(201).send(insertUrl.rows[0]);
    } catch (err) {
        res.status(500).send(err.message);
    } 
}

export async function getIdUrl(req, res) {

    try {
        const url = await getUrlIdDB(req.params.id);
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