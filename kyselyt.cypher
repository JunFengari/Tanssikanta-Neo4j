// Kyselyt:
// 1.	Näytä kaikki seurueet jotka esiintyvät Tampereella.
MATCH
  (s:Seurue)-[:OSALLISTUU]->
  (t:Tapahtuma)-[:PIDETAAN]->
  (p:Paikka {kaupunki: "Tampere"})
RETURN DISTINCT s.nimi AS TampereellaEsiintyvat;
// tulos: Sambacha on ainut seurue, joka esiintyy Tampereella.

// 2.	Etsi kaikki balettia edustavat koreografiat.
MATCH (k:Koreografia)-[:EDUSTAA]->(laji:Laji {nimi: "Baletti"})
RETURN k.nimi AS Koreografia;
// tulos: Swan Lake ja NutCracker ovat balettia edustavia koreografioita.

// 3.	Mitkä tanssijat kuuluu Joutsen seureeseen?
MATCH (t:Tanssija)-[:KUULUU]->(s:Seurue {nimi: "Joutsenet"})
RETURN t.nimi AS JoutsenenTanssijat;
// tulos: Roberto, Stefan ja Alessandra kuuluvat Joutsen seureeseen.

// 4.	Sinun suosikki tanssija on Roberto, missä voit nähdä hänet esiintymässä?
MATCH
  (rob:Tanssija {nimi: "Roberto"})-[:KUULUU]->
  (s:Seurue)-[:OSALLISTUU]->
  (tap:Tapahtuma)-[:PIDETAAN]->
  (p:Paikka)
RETURN tap.nimi AS Tapahtuma, p.nimi AS Paikka, p.kaupunki AS Kaupunki;
// tulos: Roberto esiintyy Baletti Viikoilla.

// 5.	Missä tapahtumissa esitetään Bachataa?
MATCH
  (tap:Tapahtuma)-[:SISALTAA]->
  (k:Koreografia)-[:EDUSTAA]->
  (laji:Laji {nimi: "Bachata"})
RETURN DISTINCT tap.nimi AS Tapahtuma;
//tulos: Tanssimania.

// 6.	Kuinka monessa tapahtumassa jokainen ryhmä esiintyy?
MATCH (s:Seurue)-[:OSALLISTUU]->(tap:Tapahtuma)
WITH s, COUNT(tap) AS tapahtumienMaara
RETURN s.nimi AS Seurue, tapahtumienMaara;
// tulos: Vividity 1, Joutsenet 1, Sambacha 2.

// 7. Päivitä Rebeccan tanssikokemusta 6 vuoteen
MATCH (rebu:Tanssija {nimi: "Rebecca"})
SET rebu.kokemusVuodet = 6
RETURN rebu;

// 8.	Stefan jää eläkkeelle, poistetaan hänet tietokannasta.
MATCH (t:Tanssija {nimi: "Stefan"})
DETACH DELETE t;