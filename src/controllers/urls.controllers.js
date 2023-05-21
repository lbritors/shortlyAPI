import { nanoid } from 'nanoid'
import { checkToken, getUrlDB, insertUrlDB } from '../respository/urls.repository.js';

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
        // const getIdUrl = await getUrlDB(urlShortened);
        // const object = {
        //     id: getIdUrl.rows[0].url_id,
        //     shortUrl: getIdUrl.rows[0].short_url
        // }
        // res.status(201).send(object);
        res.status(201).send(insertUrl.rows[0]);
    } catch (err) {
        res.status(500).send(err.message);
    } 
}