// Poistetaan kaikki aiemmat tiedot Neo4jstä. 
MATCH (n) DETACH DELETE n;

// ------------------
// TANSSIJAT
// Varmistetaan, että tanssijan nimi on uniikki
// CREATE CONSTRAINT tanssija_nimi_uniikki IF NOT EXISTS FOR (t:Tanssija)
// REQUIRE t.nimi IS UNIQUE;

CREATE 
(stella:Tanssija {nimi: "Stella", ika: 22, kokemusVuodet: 10}), 
(roberto:Tanssija {nimi: "Roberto", ika: 28, kokemusVuodet: 15}), 
(monique:Tanssija {nimi: "Monique", ika: 32, kokemusVuodet: 5}), 
(stefan:Tanssija {nimi: "Stefan", ika: 44, kokemusVuodet: 25}),
(rebecca:Tanssija {nimi: "Rebecca", ika: 15, kokemusVuodet: 3}), 
(elisa:Tanssija {nimi: "Elisa", ika: 31, kokemusVuodet: 9}), 
(nadia:Tanssija {nimi: "Nadia", ika: 19, kokemusVuodet: 10}), 
(alessandra:Tanssija {nimi: "Alessandra", ika: 34, kokemusVuodet: 20}),

// ------------------
// SEURUEET
// Varmistetaan, että seurueen nimi on uniikki
// CREATE CONSTRAINT seurue_nimi_uniikki IF NOT EXISTS FOR (s:Seurue)
// REQUIRE s.nimi IS UNIQUE

(vividity:Seurue {nimi: "Vividity", perustettu:1965, kotipaikka:"Helsinki"}),
(joutsenet:Seurue {nimi: "Joutsenet", perustettu:1865, kotipaikka:"Tampere"}),
(sambacha:Seurue {nimi: "Sambacha", perustettu:2021, kotipaikka:"Joensuu"}),

// ------------------
// TANSSITYYLIT  (TYYLI)
// (lyhennetty Tyylit jotta ei olisi liian monta Tanssi-alkuista nimitystä)

// Varmistetaan, että tanssityylin nimi on uniikki
// CREATE CONSTRAINT tyyli_nimi_uniikki IF NOT EXISTS FOR (ty:Tyyli)
// REQUIRE ty.nimi IS UNIQUE


(bachata:Tyyli {nimi:"Bachata", alkupera: "Dominican Republic"}),
(baletti:Tyyli {nimi:"Baletti", alkupera: "Italia"}),
(reggaeton:Tyyli {nimi:"Reggaeton", alkupera: "Puerto Rico"}),
(valssi:Tyyli {nimi:"Valssi", alkupera: "Itävalta"}),

// ------------------
// KOREOGRAFIA
// Varmistetaan, että koreografia teoksen nimi on uniikki
// CREATE CONSTRAINT koreo_nimi_uniikki IF NOT EXISTS FOR (kor:Koreografia)
// REQUIRE kor.nimi IS UNIQUE


(swanlake:Koreografia {nimi:"Swan Lake"}),
(viennesewaltz:Koreografia {nimi:"Viennese Waltz"}),
(modernabachata:Koreografia{nimi:"Moderna Bachata"}),
(nutcracker:Koreografia {nimi:"NutCracker"}),

// ------------------
// TAPAHTUMA
// Varmistetaan, että tapahtuman nimi on uniikki
// CREATE CONSTRAINT tapah_nimi_uniikki IF NOT EXISTS FOR (tapah:Tapahtuma)
// REQUIRE tapah.nimi IS UNIQUE


(balettiviikot:Tapahtuma {nimi:"Baletti Viikot", ajankohta: date("2026-03-25")}),
(tanssimania:Tapahtuma {nimi:"TanssiMania", ajankohta: date("2027-06-03")}),
(dancefest:Tapahtuma {nimi:"DanceFest", ajankohta: date("2026-09-15")}),

// ------------------
// TAPAHTUMA-PAIKKA (PAIKKA)
// lyhensin tämän myös tapahtumapaikasta pelkkään paikkaan
// Varmistetaan, että tapahtumapaikan nimi on uniikki
// CREATE CONSTRAINT paikka_nimi_uniikki IF NOT EXISTS FOR (paikka:Paikka)
// REQUIRE paikka.nimi IS UNIQUE

(kansallisteatteri:Paikka {nimi: "Kansallisteatteri", kaupunki: "Helsinki"}),
(oopperatalo:Paikka {nimi: "Ooppera Talo", kaupunki: "Helsinki"}),
(tampereenteatteri:Paikka {nimi: "Tampereen Teatteri", kaupunki: "Tampere"}),

// ------------------
// SUHTEET
// ------------------

(stella)-[:KUULUU]->(vividity),
(roberto)-[:KUULUU]->(joutsenet),
(monique)-[:KUULUU]->(sambacha), 
(stefan)-[:KUULUU]->(joutsenet),
(rebecca) -[:KUULUU]->(vividity), 
(elisa)-[:KUULUU]->(sambacha), 
(nadia)-[:KUULUU]->(vividity),
(alessandra)-[:KUULUU]->(joutsenet),

(stella)-[:TANSSII]->(baletti),
(roberto)-[:TANSSII]->(baletti), 
(monique)-[:TANSSII]->(bachata), 
(stefan)-[:TANSSII]->(baletti), 
(rebecca)-[:TANSSII]->(baletti),
(rebecca)-[:TANSSII]->(valssi),
(elisa)-[:TANSSII]->(reggaeton), 
(elisa)-[:TANSSII]->(bachata), 
(nadia)-[:TANSSII]->(valssi),
(alessandra)-[:TANSSII]->(baletti),

(vividity)-[:ESITTÄÄ]->(viennesewaltz),
(vividity)-[:ESITTÄÄ]->(nutcracker),
(joutsenet)-[ESITTÄÄ]->(nutcracker),
(joutsenet)-[ESITTÄÄ]->(swanlake),
(sambacha)-[ESITTÄÄ]->(modernabachata),

(swanlake)-[:EDUSTAA]->(baletti),
(nutcracker)-[:EDUSTAA]->(baletti),
(modernabachata)-[:EDUSTAA]->(bachata),
(viennesewaltz)-[:EDUSTAA]->(valssi),

(balettiviikot)-[:SISÄLTÄÄ]->(swanlake),
(balettiviikot)-[:SISÄLTÄÄ]->(nutcracker),
(tanssimania) -[:SISÄLTÄÄ]->(modernabachata),
(dancefest) -[:SISÄLTÄÄ]->(viennesewaltz),

(balettiviikot)-[:PIDETÄÄN]->(oopperatalo),
(tanssimania)-[:PIDETÄÄN]->(tampereenteatteri),
(dancefest)-[:PIDETÄÄN]->(kansallisteatteri),

(vividity)-[:OSALLISTUU]->(dancefest),
(vividity)-[:OSALLISTUU]->(balettiviikot),
(joutsenet)-[OSALLISTUU]->(balettiviikot),
(sambacha)-[ OSALLISTUU]->(tanssimania);

