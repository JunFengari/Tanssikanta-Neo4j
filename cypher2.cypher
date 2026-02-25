// Poistetaan kaikki aiemmat tiedot Neo4jstä.
MATCH (n)
DETACH DELETE n;

// ------------------
// TANSSIJAT
CREATE
  (stella:Tanssija {nimi: "Stella", ika: 22, kokemusVuodet: 10}),
  (roberto:Tanssija {nimi: "Roberto", ika: 28, kokemusVuodet: 15}),
  (monique:Tanssija {nimi: "Monique", ika: 32, kokemusVuodet: 5}),
  (stefan:Tanssija {nimi: "Stefan", ika: 44, kokemusVuodet: 25}),
  (rebecca:Tanssija {nimi: "Rebecca", ika: 15, kokemusVuodet: 3}),
  (alessandra:Tanssija {nimi: "Alessandra", ika: 34, kokemusVuodet: 20}),

  // ------------------
  // SEURUEET
  (vividity:Seurue
    {nimi: "Vividity", perustettu: 1965, kotipaikka: "Helsinki"}),
  (joutsenet:Seurue
    {nimi: "Joutsenet", perustettu: 1865, kotipaikka: "Tampere"}),
  (sambacha:Seurue {nimi: "Sambacha", perustettu: 2021, kotipaikka: "Joensuu"}),

  // ------------------
  // LAJIT
  (bachata:Laji {nimi: "Bachata", alkupera: "Dominican Republic"}),
  (baletti:Laji {nimi: "Baletti", alkupera: "Italia"}),
  (valssi:Laji {nimi: "Valssi", alkupera: "Itävalta"}),

  // ------------------
  // KOREOGRAFIA
  (swanlake:Koreografia {nimi: "Swan Lake"}),
  (viennesewaltz:Koreografia {nimi: "Viennese Waltz"}),
  (modernabachata:Koreografia {nimi: "Moderna Bachata"}),
  (nutcracker:Koreografia {nimi: "NutCracker"}),

  // ------------------
  // TAPAHTUMA
  (balettiviikot:Tapahtuma
    {nimi: "Baletti Viikot", ajankohta: date("2026-03-25")}),
  (tanssimania:Tapahtuma {nimi: "TanssiMania", ajankohta: date("2027-06-03")}),
  (dancefest:Tapahtuma {nimi: "DanceFest", ajankohta: date("2026-09-15")}),

  // ------------------
  // PAIKKA
  (kansallisteatteri:Paikka {nimi: "Kansallisteatteri", kaupunki: "Helsinki"}),
  (oopperatalo:Paikka {nimi: "Ooppera Talo", kaupunki: "Helsinki"}),
  (tampereenteatteri:Paikka {nimi: "Tampereen Teatteri", kaupunki: "Tampere"}),

  // ------------------
  // SUHTEET
  (stella)-[:KUULUU]->(vividity),
  (roberto)-[:KUULUU]->(joutsenet),
  (monique)-[:KUULUU]->(sambacha),
  (stefan)-[:KUULUU]->(joutsenet),
  (rebecca)-[:KUULUU]->(vividity),
  (alessandra)-[:KUULUU]->(joutsenet),
  (stella)-[:TANSSII]->(baletti),
  (roberto)-[:TANSSII]->(baletti),
  (monique)-[:TANSSII]->(bachata),
  (stefan)-[:TANSSII]->(baletti),
  (rebecca)-[:TANSSII]->(baletti),
  (rebecca)-[:TANSSII]->(valssi),
  (alessandra)-[:TANSSII]->(baletti),
  (vividity)-[:ESITTAA]->(viennesewaltz),
  (joutsenet)-[:ESITTAA]->(nutcracker),
  (joutsenet)-[:ESITTAA]->(swanlake),
  (sambacha)-[:ESITTAA]->(modernabachata),
  (swanlake)-[:EDUSTAA]->(baletti),
  (nutcracker)-[:EDUSTAA]->(baletti),
  (modernabachata)-[:EDUSTAA]->(bachata),
  (viennesewaltz)-[:EDUSTAA]->(valssi),
  (balettiviikot)-[:SISALTAA]->(swanlake),
  (balettiviikot)-[:SISALTAA]->(nutcracker),
  (tanssimania)-[:SISALTAA]->(modernabachata),
  (dancefest)-[:SISALTAA]->(viennesewaltz),
  (balettiviikot)-[:PIDETAAN]->(oopperatalo),
  (tanssimania)-[:PIDETAAN]->(tampereenteatteri),
  (dancefest)-[:PIDETAAN]->(kansallisteatteri),
  (vividity)-[:OSALLISTUU]->(dancefest),
  (joutsenet)-[:OSALLISTUU]->(balettiviikot),
  (sambacha)-[:OSALLISTUU]->(tanssimania),
  (sambacha)-[:OSALLISTUU]->(dancefest);

// -------------------------------------------
// Lopulta muiden komentojen jälkeen näytetään kaikki tulokset
MATCH (n)
RETURN n;