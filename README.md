# Tanssikanta

Tanssikanta on graafitietokanta, jonka avulla käyttäjä voi tarkastella tanssijoiden
suhteita eri tanssiryhmiin sekä näiden tanssiryhmien tulevia esityksiä, tapahtumia ja
aikatauluja.
Tässä tietokannassa esiintyy useita many-to-many -suhteita, ja se on tyypillinen
monisuhteinen käyttötapaus, joka soveltuu hyvin Neo4j-grafitietokannan
hyödyntämiseen.
Tätä tietokantaa voidaan hyödyntää esimerkiksi sovelluksessa, jossa käyttäjä voi etsiä
eri tanssijoita, seurueita, koreografioita ja tapahtumia sekä tarkastella niiden suhteita
toisiinsa.

Tämä tietokantaprojekti on osa Tietokantojen Jatko -kurssin lopputyöstä. 

### Esittelyvideo: [Youtube](https://www.youtube.com/watch?v=38oey9RIrzI)
---

## Asennus- ja käyttöohjeet

1. Käy [Tanssikanta Neo4j GitHub](https://github.com/JunFengari/Tanssikanta-Neo4j) sivuilla, ja kloonaa
   repositorio haluamaasi hakemistoon seuraavalla komennolla:
    ```bash
   git clone https://github.com/JunFengari/Tanssikanta-Neo4j.git

2. Käynnistä hakemistossa Neo4j Docker kontin komennolla:
     ```bash
   docker compose up -d

3. Kun kontti on käynnistynyt, avaa linkki:
   http://localhost:7474/browser/

4. Avaa hakemistossa olevan tanssikannan_luonti.cypher -tiedoston, ja kopio sen
   koko sisältö Neo4jn komentoriville ja suorita komennot. Tämän jälkeen
   tietokanta pitäisi näkyä.
   Valmiit kyselyt löytyy kyselyt.cypher tiedostosta.
