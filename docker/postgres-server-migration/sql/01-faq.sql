DROP TABLE IF EXISTS "faq";
DROP SEQUENCE IF EXISTS faq_id_seq;
CREATE SEQUENCE faq_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."faq" (
    "title" text,
    "text" text,
    "tag" text,
    "id" integer DEFAULT nextval('faq_id_seq') NOT NULL,
    "category" text,
    CONSTRAINT "faq_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "faq_id_index" ON "public"."faq" USING btree ("id");

INSERT INTO "faq" ("title", "text", "tag", "id", "category") VALUES
('1. Čo všetko budem potrebovať, ak chcem komunikovať s úradmi elektronicky?',	'V prvom rade potrebujete vlastniť občiansky preukaz s elektronickým čipom. Pri jeho preberaní si môžete zvoliť 6-miestny bezpečnostný osobný kód (BOK), ktorý vám bude automatický aktivovaný.

<p>Ak chcete občiansky preukaz používať aj na podpisovanie kvalifikovaným elektronickým podpisom, požiadajte o nahratie kvalifikovaných certifikátov na jeho elektronický čip. <a href="https://www.slovensko.sk/sk/slovnik/detail/_bok">Bezpečnostný osobný kód</a>  a certifikáty na vytváranie kvalifikovaného elektronického podpisu si môžete vybaviť bez poplatku na ktoromkoľvek oddelení dokladov Okresného riaditeľstva Policajného zboru. <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">Kvalifikovaný elektronický podpis</a> v elektronickom svete nahrádza vlastnoručný podpis pri papierovom úradnom vybavovaní.</p>

Ďalej budete potrebovať čítačku elektronických kariet a v počítači nainštalovaný príslušný softvér na prihlasovanie (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a>), balík aplikácií pre <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> (KEP) a ovládač na čítačku kariet. Softvér je dostupný v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.',	NULL,	349,	'Občan'),
('2. Aké čítačky kontaktných čipových kariet môžem využívať s občianskym preukazom s čipom?',	'Zoznam čítačiek, ktoré boli úspešne testované, nájdete uvedené v <a href="https://eidas.minv.sk/download/Aplikacia_EID/">používateľských príručkách k aplikácii eID klient roztriedených podľa jednotlivých operačných systémov</a>.',	NULL,	350,	'Občan'),
('3. Čo sú elektronické schránky a na čo ich môžem využívať?',	'Elektronická schránka v procese komunikácie občana a podnikateľa s úradmi slúži na elektronické doručovanie úradných rozhodnutí, notifikácií a iných správ od orgánov verejnej moci. Doručenie úradného rozhodnutia do elektronickej schránky má rovnaké právne účinky ako doručenie rozhodnutia v listinnej podobe do vlastných rúk klasickou poštou. Na to, aby vám mohol orgán verejnej moci doručiť do elektronickej schránky úradné rozhodnutie, musí byť vaša elektronická schránka aktivovaná na doručovanie.',	NULL,	351,	'Občan'),
('4. Ako si nastavím notifikácie na prijaté správy v elektronickej schránke?',	'Nastavenie notifikácie na prijaté správy do elektronickej schránky je možné nastaviť tak, že po prihlásení sa do elektronickej schránky kliknete na Nastavenia (symbol ozubeného kolieska), a následne na Nastavenia oznámení. V tabuľke si potom vyberiete priečinok, pre ktorý chcete nastaviť notifikácie (oznámenia) a zadáte údaje, kam sa notifikácie budú zasielať (ak máte vyplnené údaje v Profile, automaticky sa prednastavia). Konkrétny postup nájdete vo <a href="https://www.youtube.com/watch?v=4CizEEoX6ko">videonávode</a>.

<p>Notifikácie je možné nastaviť:</p>
<ul>
<li>pri doručení novej správy do priečinku,</li>
<li>pri presune správy do priečinku (v rozšírených nastaveniach),</li>
<li>alebo obidve možnosti (v rozšírených nastaveniach).</li>
</ul>
Pri každej z možností môže byť notifikácia zaslaná prostredníctvom notifikačného modulu (uprednostnený kanál SMS/alebo e-mail, ktorý máte zvolený v sekcii „Profil“) alebo na inú emailovú adresu, ktorú si definujete. Pri druhej možnosti, je potrebné e-mailovú adresu vpísať do zoznamu adries.',	NULL,	352,	'Občan'),
('5. Ako si môžem vyhľadať elektronické služby?',	'Všetky úrady, na ktoré je možné odoslať elektronickú žiadosť sú dostupné v sekcii <a href="https://www.slovensko.sk/sk/najst-sluzbu">Nájsť službu</a>. Vyhľadávanie je fulltextové, do pola názov elektronickej služby stačí napísať kľúčové slovo a následne sa zobrazí zoznam registrovaných služieb. V prípade ak chcete adresovať žiadosť na konkrétny úrad vyhľadáte si ho v poli „Názov inštitúcie alebo úradu“. Elektronickú službu si môžete vyhľadať aj prostredníctvom navigácie podľa životných situácií umiestnenej na titulnej stránke. ',	NULL,	353,	'Občan'),
('6. Aké operačné systémy sú podporované na prihlásenie sa do elektronickej schránky a využívanie služieb portálu www.slovensko.sk?',	'<b> Prihlásenie do elektronickej schránky:</b>

<ul>
<li>Windows XP, 7, 8, 10</li>
<li>MAC OSX 10.x.x</li>
<li>Linux (Mint, Ubuntu, Debian)</li>
</ul>

<b>Podanie na Obchodný register SR:</b>

<ul>
<li>Windows XP, 7, 8, 10</li>
<li>MAC OSX 10.x.x</li>
<li>Linux (Mint, Ubuntu, Debian)</li>
</ul>

<b>Služba Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a>, ostatné služby:</b>

<ul>
<li>Windows XP, 7, 8, 10</li>
<li>MAC OSX 10.x.x</li>
<li>Linux (Mint, Ubuntu, Debian)</li>
</ul>

<b>Aplikácia <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a>:</b>

<ul>
<li>Windows XP SP3, Vista, 7, 8, 8.1, 10</li>
<li>Mac OS X 10.8/10.9/10.10.2/10.10.3/10.11</li>
<li>Linux (Mint 13/17 32-bit/64-bit, Ubuntu 12.04/14.04 32-bit/64-bit, Debian 7.0 32-bit/64-bit)</li>
</ul>

Pre tieto verzie operačných systémov Ministerstvo vnútra SR garantuje úplnú funkčnosť aplikácie <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a>.',	NULL,	354,	'Občan'),
('7. Ako si aktivujem elektronickú schránku na doručovanie?',	'Elektronickú schránku si aktivujete na doručovanie cez tlačidlo „Aktivovať schránku“. Tlačidlo sa nachádza v schránke vpravo hore vedľa mena majiteľa schránky. Po kliknutí na tlačidlo sa vám zobrazí samotná žiadosť o aktiváciu, ktorú je potrebné odoslať. Po jej úspešnom odoslaní budete mať elektronickú schránku aktivovanú na doručovanie a to ku dňu, ktorý ste uviedli v žiadosti, ale najskôr na tretí pracovný deň po jej doručení.

<b>Upozornenie:</b> Ak v žiadosti uvediete deň aktivácie, ktorý je rovnaký s dňom odoslania žiadosti, bude vám schránka aktivovaná následne <b>až o 3 pracovné dni.</b>',	NULL,	355,	'Občan'),
('8. Ako vytvorím <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> a čo na to potrebujem?',	'<a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">Kvalifikovaný elektronický podpis</a> vytvoríte aplikáciou na podpisovanie. Na ústrednom portáli sú na podpisovanie voľne dostupné aplikácie v sekciii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>. Pre systém MS Windows je k dispozícii aplikácia <a href="https://www.slovensko.sk/sk/na-stiahnutie">D.Signer/XAdES</a>, ako súčasť balíka D.Suite/<a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a>. (V prípade systémov Mac OS X a GNU/Linux sa Java verzia aplikácie D.Signer/XAdES automaticky stiahne a spustí prostredníctvom aplikácie D.Launcher, ktorú je potrebné v týchto systémoch nainštalovať.)',	NULL,	356,	'Občan'),
('14. Kde môže občan získať softvérové vybavenie potrebné pre používanie elektronickej identifikačnej karty?',	'Ovládače k čítačke kontaktných čipových kariet získa občan od jej výrobcu napr. pri jej kúpe na dátovom nosiči alebo na internetovej stránke podpory konkrétneho výrobcu.

<p>Softvérové vybavenie pre elektronickú identifikačnú kartu si občan môže bezplatne stiahnuť v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a> alebo na <a href="https://eidas.minv.sk/download/Aplikacia_EID/">internetovom portáli Ministerstva vnútra Slovenskej republiky</a>.</p>',	NULL,	424,	'Občan'),
('9. Ako odstránim problém pri elektronickom podpisovaní?',	'V drvivej väčšine prípadov dokážete problém s elektronickým podpísaním podaní alebo dokumentov odstrániť rýchlo a jednoducho reštartovaním alebo aktualizáciou softvéru či počítača. Z uvedeného dôvodu vás prosíme, aby ste vyskúšali nižšie uvedené kroky v chronologickom poradí:

<ol>
<li> vypnite a zapnite Aplikáciu pre eID, ak problém pretrváva,</li>
<li>pripojte čítačku čipových kariet do iného USB vstupu, ak problém pretrváva,</li>
<li>vyskúšajte použiť iný internetový prehliadač, ak problém pretrváva,</>li
<li>reštartujte si počítač, ak problém pretrváva,</li>
<li>nainštalujte si najnovšiu verziu Aplikácie <a href="https://www.slovensko.sk/sk/na-stiahnutie">D.Suite/D.Launcher</a> pre  <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> a reštartujte si počítač, ak problém pretrváva,</li>
<li>nainštalujte si najnovšiu verziu  <a href="https://www.slovensko.sk/sk/na-stiahnutie">Aplikácie pre eID</a> na prihlásenie a reštartujte si počítač, ak problém pretrváva,</li>
<li>aktualizujte si <a href="https://dotnet.microsoft.com/en-us/download/dotnet-framework">.NET Framework</a> (ak používate operačný systém Windows) a reštartujte si počítač.</li>
</ol>',	NULL,	357,	'Občan'),
('10. Služby živnostenského registra - ako vytvorím  <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> pri podaniach na <a href="https://www.slovensko.sk/sk/slovnik/detail/_jkm">Jednotné kontaktné miesto</a> (JKM)?',	'Ak chcete podpísať podanie pri elektronických službách živnosteského registra na <a href="https://www.slovensko.sk/sk/slovnik/detail/_jkm">Jednotné kontaktné miesto</a> kvalifikovaným elektronickým podpisom, je potrebné sa prihlásiť na portál cez internetový prehliadač <b>Internet Explorer</b> v operačnom systéme MS Windows. Samotné podanie podpíšete kvalifikovaným elektronickým podpisom (KEP)  cez aplikáciu D.Signer/XAdES, ktorá je k dispozícii v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>. Prílohy, ktoré sú súčasťou podania, môžete podpísať aplikáciami QSign, Disig Desktop Signer alebo cez online aplikáciu http://zep.disig.sk.
Služby Jednotného kontaktného miesta sú v pôsobnosti Ministerstva vnútra SR.',	'Podnikanie',	358,	'Občan'),
('11. Služby obchodného registra - ako vytvorím <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> pri podaniach na Obchodný register SR?',	'Pri podpisovaní podania na obchodný register elektronický formulár vypísaný <a href="https://www.justice.gov.sk/sluzby/obchodny-register/">na stránke Ministerstva spravodlivosti SR</a> uložte do počítača vo formáte XML a podpíšte ho kvalifikovaným elektronickým podpisom alebo viacnásobným kvalifikovaným elektronickým podpisom vo formáte XAdES. Výstupom je ASiC kontajner (prípona súboru .asics, .asice, .scs, .sce). <i>Aktuálne je ešte podporovaný aj formát XAdES_ZEP EPES – výstupom je XML súbor s príponou .zepx</i>.

Prílohy k podaniu (napr. spoločenskú zmluvu, zakladateľskú zmluvu a pod.) naskenujte vo formáte PDF (preferovaný formát) alebo TIFF a podpíšte kvalifikovaným elektronickým podpisom alebo viacnásobným kvalifikovaným elektronickým podpisom vo formáte CAdES alebo XAdES.  Výstupom je ASiC kontajner (prípona súboru .asics, .asice, .scs, .sce).  Text na dokumentoch musí byť čitateľný. Nie sú podporované dokumenty vytvorené zaručenou konverziou. <i>Aktuálne je ešte podporovaný aj formát CMS – CAdES EPES – výstupom je dokument s príponou súboru .zep a formát XAdES_ZEP prípona súboru .zepx</i>.

Kvalifikované elektronické podpisy môžete vytvárať bezplatnými (napr. <a href="https://qesportal.sk/Portal/sk">ZEP.disig.sk</a>) alebo komerčnými aplikáciami <a href="https://www.qsign.sk/">QSign</a>, <a href="https://www.disig.sk/">Disig Desktop Signer</a>, <a href="https://www.podpisuj.sk/">Podpisuj.sk</a>, <a href="https://www.dstore.sk/shop/product/d-bulk-signer-standard-444?category=22#attr=442">D.Bulk Signer – Standard</a>. V prípade, že disponujete podpísanými súbormi s príponou .xzep a potrebujete ich priložiť k podaniu na obchodný register, premenujte príponu súboru na .zepx. (Pozn.: Formát podpisu XAdES_ZEP nemá predpísanú príponu a v praxi sa rovnocenne používajú .xzep aj .zepx, avšak pre podania do obchodného registra Ministerstvo spravodlivosti vyžaduje príponu .zepx).

Prílohy môžete do formátu .xzep podpisovať aj na <a href="https://obcan.justice.sk/podpisovanie-dokumentov">portáli Ministerstva spravodlivosti</a> alebo priložením prílohy a jej následným stiahnutím po podpísaní vo <a href="https://www.slovensko.sk/sk/detail-sluzby?externalCode=App.GeneralAgenda">všeobecnej agende</a>.

Služby Obchodného registra SR vypublikované na <a href="https://www.slovensko.sk/sk/titulna-stranka">www.slovensko.sk</a> v časti „Podnikateľ“, „Začiatok podnikania“, „Registrácia právnickej osoby“  sú v pôsobnosti Ministerstva spravodlivosti SR.',	'Podnikanie',	359,	'Občan'),
('12. Akú aplikáciu mám použiť na vytvorenie kvalifikovaného elektronického podpisu na portáli, ak nevyužívam kvalifikovaný certifikát na eID karte?',	'Aj v tomto prípade použite aplikáciu D.Signer/XAdES, ktorá je súčasťou balíka D.Suite/<a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> alebo aplikáciu D.Launcher, ktoré sú dostupné v sekciii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>. Pri inštalácii odporúčame postupovať podľa príslušnej <a href="https://www.slovensko.sk/static/zep/docs/Pouzivatelska_dokumentacia_pre_verzie_4_.NET_aplikacii_pre_ZEP/GOV_ZEP.252.2.170523.Instalacna_prirucka_D.Suite-eIDAS.v1.0.pdf">inštalačnej príručky</a> dostupnej v rovnakej sekcii.',	NULL,	360,	'Občan'),
('13. Existujú videonávody ako sa orientovať v elektronickej schránke ?',	'Áno. Na portáli sú zverejnené inštruktážne videá, ktoré jednoduchým spôsobom zobrazujú základné situácie, ktoré môžu nastať pri práci na portáli, s elektronickou schránkou či pri inštalácii základných aplikácií a programov. Jednotlivé na seba nadväzujúce videá nájdete v novovytvorenej sekcii s názvom <a href="https://www.slovensko.sk/sk/navody/videonavody">Videonávody</a>. ',	NULL,	361,	'Občan'),
('14. Aké prípony majú názvy elektronicky podpísaných súborov (.asice, .xzep, .pdf, ...) ?',	'Súbory obsahujúce elektronické podpisy alebo pečate môžu v názve súboru používať rôzne prípony, avšak samotná prípona súboru nijako negarantuje, že súbor je skutočne podpísaný. 

Pre zistenie, či je súbor autorizovaný platným kvalifikovaným elektronickým podpisom alebo kvalifikovanou elektronickou pečaťou, je potrebné využiť službu overenia podpisov. Pre informatívne overenie je k dispozícii <a href="https://www.slovensko.sk/sk/e-sluzby/sluzba-overenia-zep">služba na slovensko.sk</a>.

V prípade súborov obsahujúcich elektronické podpisy môže ísť o:

<ul>
<li>​podpisové kontajnery, ktoré obvykle obsahujú samostatné elektronické dokumenty a samostatné podpisy alebo pečate.</li>
<li>podpisy obsahujúce nimi podpisované dokumenty ako svoju súčasť.</li>
<li>podpisované elektronické dokumenty, ktoré obsahujú podpisy ako svoju súčasť.</li>
</ul>

Podpisové kontajnery vytvorené v súlade s platnou legislatívou účinnou od 1. júla 2016 - Vykonávacie rozhodnutie Komisie (EÚ) č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a>:

<ul>
<li>podpisové kontajnery ASiC-E používajú prípony: <b>.asice, .sce, .zip</b></li>
<li>podpisové kontajnery ASiC-S používajú prípony: <b>.asics, .scs, .zip</b></li>
</ul>

Podpisové kontajnery vytvorené na základe slovenských pravidiel účinných do 30. júna 2016 alebo po tomto dátume v prípade vzájomnej dohody všetkých strán príslušnej komunikácie:

<ul>
<li>podpisové kontajnery ZEPf obvykle používajú príponu: <b>.zep</b></li>
<li>podpisové kontajnery a podpisy XAdES_ZEP používajú obvykle prípony: <b>.xzep, .zepx</b> (nesprávne sa niekedy používa prípona .xml alebo .zep)</li>
</ul>

Elektronické dokumenty, ktoré obsahujú podpisy ako svoju súčasť:

<ul>
<li>PDF súbory obsahujúce podpis PAdES používajú príponu: <b>.pdf</b></li>
<li>XML súbory obsahujúce podpis XAdES enveloped používajú príponu: <b>.xml (alebo inú)</b> (Tieto podpisy nie sú v súčasnosti v Centrálnej elektronickej podateľni podporované.)</li>
</ul>

Elektronické podpisy, ktoré obsahujú nimi podpisované elektronické dokumenty ako svoju súčasť:
(Tieto podpisy nie sú v súčasnosti v Centrálnej elektronickej podateľni podporované.)

<ul>
<li>podpisy CAdES (enveloping) používajú príponu: <b>.p7m</b></li>
<li>podpisy XAdES enveloping používajú príponu: <b>.xml</b></li>
</ul>

Elektronické podpisy oddelené od podpísaných elektronických dokumentov:
(Tieto podpisy nie sú v súčasnosti v Centrálnej elektronickej podateľni samostatne podporované ako samostatné, musia sa nachádzať v podpisovom kontajneri.)

<ul>
<li>podpisy CAdES "detached" používajú príponu: <b>.p7s</b></li>
<li>podpisy XAdES "detached" používajú príponu: .xml</li>
</ul>

Časové pečiatky oddelené od elektronických dokumentov na ktoré sa vzťahujú:

<ul>
<li>používajú príponu: <b>.tst</b></li>
</ul>

Elektronické dokumenty, ktoré sú podpísané alebo zapečatené v podpisových kontajneroch alebo v elektronických podpisoch, môžu mať rôzne formáty, napríklad .pdf, .txt, .png. Orgány verejnej moci sú <a href="https://www.slovensko.sk/sk/navody/videonavody">povinné prijímať a vytvárať formáty elektronických dokumentov predpísané vo Výnose č. 55/2014 Z.z</a> o štandardoch pre informačné systémy verejnej správy SR.

Overovanie elektronických podpisov a pečatí XAdES enveloping (.xml), XAdES enveloped (.xml), CAdES enveloping (.p7m) a samostatných časových pečiatok dokumentov (.tst) nie sú na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v súčasnosti plne podporované.

Pre tieto formáty je preto potrebné použiť inú službu overenia podpisov. Podpisy "detached" oddelené od podpísaných dokumentov (.p7s, .xml) je možné na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v súčasnosti spracúvať a  overovať len v podpisovom kontajneri.

Podrobnosti o podporovaných formátoch podpisov na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> môžete nájsť <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">v dokumentácii funkčnosti centrálnej elektronickej podateľne</a>.',	NULL,	362,	'Občan'),
('15. Aké formáty elektronických podpisov musia orgány verejnej moci prijímať a vytvárať? ',	'Povinné formáty kvalifikovaných elektronických podpisov a pečatí ako aj povinné formáty podpisových kontajnerov <a href="https://www.nbu.gov.sk/wp-content/uploads/doveryhodne-sluzby/docs/Povinne-formatyQESpre-subjekt-verejneho-sektora.pdf">sú uvedené v osobitnom dokumente NBÚ</a> a vyplývajú z nariadenia Európskeho parlamentu a Rady (EÚ) č. <a href="https://eur-lex.europa.eu/legal-content/SK/ALL/?uri=CELEX%3A32014R0910">910/2014</a> a z Vykonávacieho rozhodnutia Komisie (EÚ) č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a>. Ide o formáty XAdES, CAdES, PAdES a ASiC, ktorých obvyklé prípony sú uvedené v predošlej otázke. 

Pred nadobudnutím účinnosti tejto legislatívy boli v Slovenskej republike definované aj formáty XAdES_ZEP (.xzep, .zepx) a ZEPf (.zep), ktoré boli informatívne uvedené aj <a href="http://www.nbusr.sk/wp-content/uploads/doveryhodne-sluzby/docs/formaty_zep.pdf">v štandardoch NBÚ</a> účinných do 30.6.2016.
Po tomto dátume nie sú orgány verejnej moci povinné v zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/20210623.html#paragraf-47.odsek-1.pismeno-c">§ 47 písm. c) Vyhlášky č. 78/2020 Z. z. o štandardoch pre IT VS</a> a tiež v zmysle <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> prijímať formát XAdES_ZEP (.xzep, .zepx), nakoľko požiadavky tohto formátu sú nad rámec požiadaviek prílohy Vykonávacieho rozhodnutia Komisie (EÚ) č. 2015/1506. Formát XAdES_ZEP je podľa NBÚ možné zaradiť medzi alternatívne formáty validované podľa konkrétnych referenčných metód pre zdokonalený elektronický podpis podľa vykonávacieho rozhodnutia Komisie č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a>.
Z formátu ZEPf (.zep) sú orgány verejnej moci podľa <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> povinné prijímať podpis CAdES (prípadne XAdES), nakoľko tento je v súlade s prílohou Vykonávacieho rozhodnutia Komisie (EÚ) č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a> a je ho možné validovať ako samostatný podpis súboru .eml (obsahujúci base64 kódované súbory) alebo vložiť do ASiC a validovať ako ASiC v súlade s nariadením Európskeho parlamentu a Rady č. <a href="https://eur-lex.europa.eu/legal-content/SK/ALL/?uri=CELEX%3A32014R0910">910/2014</a>.

Formát XAdES_ZEP (.xzep, .zepx) a kontajnery ZEPf (.zep) sa v zmysle platnej legislatívy už nemajú vytvárať. Za vytvorenie podpisu alebo pečate vo formáte, ktoré nie sú v súlade s Vykonávacím rozhodnutím Komisie (EÚ) č. 2015/1506, sa v zmysle § 14 ods. 3 zákona č. 272/2016 Z.z. môže orgánu verejnej moci udeľovať sankcia.

Zároveň sa v zmysle zákona č. 95/2019 Z. z. môže dotknutému orgánu verejnej moci udeliť sankcia za porušovanie štandardov pre vytváranie podpisových kontajnerov predpísaných vo Vyhláške č. 78/2020 Z. z. o štandardoch pre IT VS.',	NULL,	363,	'Občan'),
('16. Čo je KEP PUK?',	'Ďalšou bezpečnostnou ochranou vytvárania KEP prostredníctvom elektronickej identifikačnej karty je limitovaný počet nesprávne zadanej hodnoty KEP PIN. Po troch (3) nesprávne zadaných hodnotách KEP PIN sa zablokuje možnosť použitia súkromného kľúča na vytvorenie KEP. Odblokovanie je možne len prostredníctvom KEP PUK.',	NULL,	443,	'Občan'),
('16. Ako zistím, či je súbor elektronicky podpísaný? ',	'Súbor podpísaný kvalifikovaným elektronickým podpisom alebo opatrený kvalifikovanou elektronickou pečaťou nemusí obsahovať písomnú podobu vlastnoručného podpisu alebo pečiatky.

Pre overenie, či je súbor elektronicky podpísaný, je potrebné použiť aplikáciu alebo službu určenú na spracovanie a overovanie elektronických podpisov.

Funkcia informatívneho overovania podpisov je dostupná pre dokumenty v elektronických správach v rámci funkcií elektronických schránok. Pre informatívne overenie podpisov je možné využiť aj verejnú <a href="https://www.slovensko.sk/sk/e-sluzby/sluzba-overenia-zep">službu overovania podpisov</a>.

Stránka <a href="https://www.slovensko.sk/sk/titulna-stranka">slovensko.sk</a> podporuje informatívne overovanie podpisov elektronických dokumentov len v <a href="https://www.slovensko.sk/sk/faq/_vykon-verejnej-moci-organy-ve#neplatnost">niektorých formátoch</a>. Pre overenie podpisov pre iné formáty súborov odporúčame využiť iné dostupné certifikované nástroje.

<b>Akým spôsobom je možné získať záväzné overenie platnosti kvalifikovaného elektronického podpisu?</b>

Na Ústrednom portáli verejnej správy sa používa výlučne informatívne overenie podpisov a pečatí. Rovnako aj ďalšie verejne poskytované služby majú obvykle iba status informatívneho overenia.

Skutočnosť, že výsledok overenia podpisov je informatívny, neznamená, že výsledok overenia je nespoľahlivý alebo nedôveryhodný. Znamená to, že daná služba nemá štatút kvalifikovanej dôveryhodnej služby v zmysle článku 33 a 40 Nariadenia Európskeho parlamentu a Rady EÚ č. 910/2014. V zmysle uvedeného právneho predpisu nie je povinnosť poskytovať kvalifikovanú službu validácie a preto sa v súčasnosti nemusí používať ani na ústrednom portáli. Takúto službu na ústrednom portáli verejnej správy však do budúcna pripravujeme.

Zoznam poskytovateľov služieb, ktoré majú štatút kvalifikovanej služby je možné nájsť v <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/home">dôveryhodných zoznamoch zverejňovaných Európskou komisiou</a>, pričom sú označené ako "Qualified validation service...".',	NULL,	364,	'Občan'),
('17. Ako môžem otvoriť elektronicky podpísané dokumenty?',	'Elektronicky podpísané dokumenty sa prenášajú najmä v špecifických formátoch podpisových kontajnerov alebo podpisov, pre ktorých otvorenie je potrebný špecifický softvér.

Elektronické schránky na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> priamo umožňujú stiahnuť podpísaný elektronický dokument v jeho podpísanej pôvodnej forme (obvykle v podpisovom kontajneri), ale aj uložiť z podporovaného podpisového kontajnera samotný elektronický dokument. Je na to možné využiť funkcie "Stiahnuť", "Stiahnuť nepodpísaný obsah" alebo funkciu "Zobraziť" po kliknutí na súbor v elektronickej správe. V prípade použitia funkcie uloženia nepodpísaného obsahu však výsledný súbor neobsahuje podpis.

<p style="color:red;">Aplikácia D.Viewer bola z menu v novej elektronickej schránke vypustená, nahradili ju pokročilé funkcie s detailmi o podpisoch a kontajneroch. D. Viewer je naďalej použiteľný po stiahnutí a otvorení podpísaného súboru v počítači. V aplikácii D.Viewer sa nachádzajú informácie o podpisoch vo väzbe na dokumenty, nie je však možné overenie podpisov a zobrazenie údajov vyplnených podľa elektronického formulára je obmedzené len na malú časť existujúcich formulárov.</p>

Pre zobrazenie súborov bez použitia funkcie elektronickej schránky je možné použiť aj samostatnú aplikáciu D.Viewer pre MS Windows dostupnú na stránke "Na stiahnutie" alebo jej <a href="https://www.slovensko.sk/static/zep/java_apps/dviewer_standalone_2.0.jnlp">Java verziu pre MS Windows, MacOS X a GNU/Linux</a>, prípadne iné aplikácie od iných výrobcov ako napríklad <a href="https://qes.webnode.sk/na-stiahnutie/">QES</a> aplikáciu (postup je uvedený na druhej strane <a href="https://qes.webnode.sk/">úvodnej stránky QES</a>) alebo bezplatnú aplikáciu <a href="https://www.dstore.sk/blks">D.Bulk Signer – Start</a>, <a href="https://www.disig.sk/sk/produkty/elektronicky-podpis/disig-desktop-signer/">Disig Desktop Signer</a> či <a href="https://www.qsign.sk/">Ardaco QSign</a>.

Formáty XAdES_ZEP (.xzep, zepx) a ZEPf (.zep), ktoré vznikli v Slovenskej republike pred účinnosťou Nariadenia č. 910/2014 nie sú používané mimo SR a nemusia byť ani akceptované členskými štátmi EÚ. Formát ZEP je možné po otvorení v bezplatnej <a href="https://qes.webnode.sk/na-stiahnutie/">QES</a> aplikácii uložiť do ASiC-S kontajnera.

Podpisové kontajnery ASiC obsahujúce podpísané súbory PDF, TXT alebo PNG je v prípade technicky znalejších používateľov možné otvoriť aj pomocou aplikácie pre otváranie ZIP súborov, keďže formát ASiC bol vytvorený aj z formátu ZIP. Používateľ môže ASiC súbor priamo otvoriť v aplikácii pre otváranie ZIP súborov alebo súbor pre účely takéhoto otvorenia dočasne premenovať z ".asice" / ".asics" na ".zip" a priamo otvoriť príslušnou aplikáciou.

Do budúcna Národná agentúra pre sieťové a elektronické služby pripravuje verejne dostupnú aplikáciu podporujúcu zobrazovanie všetkých vyplnených formulárov. Dovtedy je bezplatná podpora pre zobrazovanie údajov vyplnených podľa všetkých elektronických formulárov zverejnených v module elektronických formulárov len v elektronickej schránke.',	NULL,	365,	'Občan'),
('18. Ktorý údaj je pre použitie dokumentu na právne úkony smerodajný? Platnosť podpisového certifikátu elektronického podpisu/elektronickej pečate alebo časovej pečiatky?',	'Zákon č. 305/2013 Z. z. o e-Governmente uvádza v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20170301#paragraf-23.odsek-1">§ 23 ods. 1</a> pravidlá pri výkone verejnej moci pre používanie časovej pečiatky a platného podpisu bez časovej pečiatky. Pri výkone verejnej moci je potrebné rozlišovať, či je náležitosťou právneho úkonu:

<ul>
<li>iba vlastnoručný podpis (pre ktorý sa v listinnom svete nevyžaduje úradné osvedčenie, a teda v elektronickom svete v čase platnosti certifikátu podpisu nie je potrebná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>) alebo</li>
<li>úradne osvedčený vlastnoručný podpis, kde sa <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> zahrnie do autorizácie (pričom sa zároveň odporúča pripájať časovú pečiatku aj k podpisu, pokiaľ je potrebné preukazovať čas, kedy autorizácia nastala. Viac informácií nájdete v <a href="https://www.mirri.gov.sk/sekcie/informatizacia/governance-a-standardy/zakon-o-e-governmente/vykladove-stanoviska-a-usmernenia/index.html">Usmernení k § 23 ods. 1 písm. b) zákona o e-Governmente</a> Úradu podpredsedu vlády SR pre investície a informatizáciu (dnes Ministerstvo investícií, regionálneho rozvoja a informatizácie).</li>
</ul>

Pre platnosť kvalifikovaných časových pečiatok je rozhodujúci stav "granted" uvedený v <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/home">dôveryhodnom zozname</a> pri príslušnej službe časových pečiatok. Podrobnosti o platnosti časových pečiatok je možné nájsť v <a href="https://www.slovensko.sk/sk/faq/faq-najcastejsie-otazky#akajeplatnost">otázke č. 20</a>.

Z uvedeného vyplýva nasledovné:

<ul>
<li>ak pre daný právny úkon netreba úradné osvedčenie podpisu a certifikát podpisu je platný, nezáleží na tom, či časová
pečiatka je alebo nie je platná (rovnako ako je jedno, či <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> je alebo nie je).</li>
<li>ak pre daný právny úkon netreba úradné osvedčenie podpisu a certifikát podpisu je neplatný, avšak
<a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> podpisu je platná a bola vyhotovená v čase platnosti podpisu, tak je dôležitá platnosť časovej pečiatky.</li>
<li>ak pre daný právny úkon treba úradné osvedčenie podpisu, pričom certifikát podpisu je neplatný ale <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>
podpisu platná je, tak je kľúčová práve <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>, ak bola vytvorená ešte v čase platnosti certifikátu podpisu.</li>
</ul>

Podrobnosti o platnosti časových pečiatok a čase dopĺňania časových pečiatok sú uvedené v <a href="https://www.slovensko.sk/sk/faq/faq-najcastejsie-otazky#akajeplatnost">otázke č. 20</a>.
Národný bezpečnostný úrad Slovenskej republiky vydal <a href="http://tl.nbu.gov.sk/kca/tsl/SchemaDohladu.pdf">Schému dohľadu kvalifikovaných dôveryhodných služieb</a> (vychádzajúca z vykonávajúceho rozhodnutia Komisie EÚ k <a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/?uri=OJ:JOL_2015_235_R_0005">2015/1505</a>), ktorá definuje povinnosť v prípade, ak ide o kvalifikovanú dôveryhodnú službu uchovávania kvalifikovaných elektronických podpisov a kvalifikovaných elektronických pečatí, aby:

<ul>
<li>bolo dodržiavané pravidlo <b>dopĺňania kvalifikovanej elektronickej časovej pečiatky</b> do podpisu alebo pečate alebo</li>
<li>bolo dodržiavané pravidlo <b>dopĺňania samostatnej kvalifikovanej elektronickej časovej pečiatky</b> v čase platnosti predchádzajúcej
kvalifikovanej elektronickej časovej pečiatky, ktorá zahŕňa položky podpisu, pečate, elektronických časových pečiatok a dokumentov, ktoré boli podpísané alebo zapečatené.</li>
</ul>

Tzn., že platnosť podpisu sa dá predlžovať prepečiatkovaním časovými pečiatkami, pričom:

<ul>
<li>prvá <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> musí byť pripojená k podpisu ešte v čase platnosti podpisu,</li>
<li>ďalšie časové pečiatky musia byť použité na poslednú časovú pečiatku ešte v čase platnosti poslednej časovej pečiatky a tak ďalej.</li>
</ul>',	NULL,	366,	'Občan'),
('19. Zabezpečí elektronická schránka platnosť podpisov počas celej doby uloženia správy v schránke?',	'Elektronická schránka nezabezpečuje dlhodobú platnosť autorizačných prostriedkov (podpisov/pečatí/časových pečiatok) v elektronických správach uložených v elektronickej schránke. Ak si správy necháte uložené v elektronickej schránke a budú obsahovať podpisy alebo pečate bez časovej pečiatky, dátumom konca platnosti podpisového certifikátu nebude možné  podpisy/pečate automatizovanými prostriedkami overiť ako platné.

Ak platné podpisy/pečate obsahujú kvalifikovanú časovú pečiatku pridanú v čase platnosti podpisového certifikátu, bude ich možné overiť ako platné počas doby, kedy je certifikát časovej pečiatky zverejnený v <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/home">dôveryhodnom zozname</a> so stavom "Granted". Kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> teda môže zabezpečiť dlhodobú platnosť, napríklad aj viac ako 10 rokov. Čas platnosti nie je vopred určený a je potrebné ho určovať na základe analýzy rizík. Podrobnejšie informácie k tejto problematike sú zverejnené napríklad v odpovediach na otázky na nasledujúcich webových stránkach:

<ul>
<li><a href="https://www.mirri.gov.sk/wp-content/uploads/2018/10/5.3..pdf">vicepremier.gov.sk</a> (často kladené otázky k zákonu o e-Governmente)</li>

<li><a href="https://www.slovensko.sk/sk/faq/_najcastejsie-otazky-a-odpovede#akajeplatnost">slovensko.sk</a> (otázka „Aká je platnosť podpisov vyhotovených certifikátmi, ktorých platnosť bola zrušená?“)</li>
</ul>

Pokiaľ podpis obsahuje kvalifikovanú časovú pečiatku pridanú v čase platnosti podpisu/pečate, môže dosiahnuť výrazne dlhší čas ako je limit pre bezplatné ukladanie dokumentov v module dlhodobého uchovávania.
V grafickom prostredí elektronickej schránky je možné pre jednotlivé elektronické správy využiť funkciu „Vložiť záznam do MDU“, pre ich uloženie do modulu dlhodobého uchovávania, v ktorom sa pre podpisy bez časovej pečiatky automaticky pripojí kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>, ak to bude technicky možné. Jednotlivé podpisy sú v module dlhodobého uchovávania chránené integritným podpisom počas celej doby ich uloženia (predvolene na 1 rok), pričom po automatickom ukončení uloženia budú vrátené do elektronickej schránky v stave, v akom boli do modulu dlhodobého uchovávania vložené a podpisy, ktoré pri vkladaní do modulu dlhodobého uchovávania časovú pečiatku neobsahovali, budú doplnené o kvalifikovanú časovú pečiatku.

Orgány verejnej moci, právnické osoby a fyzické osoby podnikatelia integrovaní na služby <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> majú možnosť pre zabezpečenie dlhodobej automatizovanej overiteľnosti platnosti podpisov/pečatí využiť služby poskytovateľov komerčných služieb alebo modul dlhodobého uchovávania <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> a predlžovať v ňom dobu uloženia záznamov aj na viac rokov za podmienok, ktoré sa dohodnú v dohode o integračnom zámere.',	NULL,	367,	'Občan'),
('20. Aká je platnosť podpisov vyhotovených certifikátmi, ktorých platnosť bola zrušená? ',	'V prípade, že ku kvalifikovanému elektronickému podpisu bola pred zrušením platnosti kvalifikovaného certifikátu podpisovateľa pripojená kvalifikovaná elektronická <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> podpisu, podpis je možné validovať ako platný počas celej doby platnosti tejto časovej pečiatky. Platnosť sa v zmysle <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> určuje podľa stavu platnosti časovej pečiatky v dôveryhodnom zozname zverejňovanom NBÚ. Pre platnosť kvalifikovaných časových pečiatok je rozhodujúci stav "granted" uvedený v <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/home">dôveryhodnom zozname</a> pri príslušnej službe časových pečiatok. Dátum konca platnosti uvedený v certifikáte kvalifikovanej časovej pečiatky nemá vplyv na platnosť časových pečiatok vytvorených do tohto dátumu a obmedzuje iba poskytovateľa služby vo vytváraní nových časových pečiatok súkromným kľúčom s týmto certifikátom (napr. <a href="https://www.etsi.org/deliver/etsi_ts/119300_119399/119312/01.02.01_60/ts_119312v010201p.pdf">kapitola 9.4 technickej špecifikácie ETSI TS 119 312 V1.2.1 - 2017-05</a>). Čas, kedy je možné očakávať zrušenie stavu dôveryhodnosti služby, (t.j. napr. na stav "withdrawn") nie je určený. Služba má kvalifikovaný štatút aj po čase, kedy sa už <a href="https://www.slovensko.sk/sk/slovnik/detail/_sukromny-kluc">súkromný kľúč</a> služby používaný na vytváranie podpisov, vrátane podpisov časových pečiatok nesmie použiť a v tomto období poskytuje informácie o stave vydaných certifikátov, pečiatok alebo iných výstupov svojej služby pre dlhodobé použitie a minimálne vedie tieto informácie 10 rokov aj po ukončení použitia súkromného kľúča.

Potrebu opätovne pečiatkovať údaje kvalifikovanými časovými pečiatkami je potrebné v zmysle <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> určovať na základe analýzy rizík. Tá môže zahŕňať napríklad odolnosť algoritmov a funkcií, riziká a informácie o ukončení služby overenia platnosti zo strany poskytovateľa a pod. Reťazenie časových pečiatok je potrebné v čase, kedy je malé bezpečnostné riziko že aktuálna <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> by mohla byť oslabená prelomením algoritmov, zabezpečenia, kompromitovaním poskytovateľa či iným rizikom.

V elektronických podateľniach sa platnosť podpisov overuje pri doručovaní resp. spracovaní elektronických dokumentov, kedy sa môže chýbajúca kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> podpisu doplniť, alebo sa pomocou kvalifikovanej časovej pečiatky vyhotoví externá evidencia existencie jedného alebo viacerých podpisov a pri validácii podpisov sa vychádza z tejto evidencie v ďalšom konaní.

Ak bol platný <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> vyhotovený bez kvalifikovanej elektronickej časovej pečiatky podpisu pred zrušením kvalifikovaného certifikátu podpisovateľa a v príslušnej podateľni nebola vyhotovená dôveryhodná evidencia do času zrušenia certifikátu, napr. pomocou kvalifikovanej časovej pečiatky, nie je už možná automatizovaná validácia platnosti podpisu, platnosť takéhoto podpisu je možné validovať manuálne, kedy sa predloží dôkaz, že podpis existoval, alebo bol vyhotovený, pred zrušením platnosti kvalifikovaného certifikátu podpisovateľa. Podrobnosti o postupe validácie nájdete v <a href="https://www.nbu.gov.sk/doveryhodne-sluzby/dohlad/index.html">schéme dohľadu NBÚ</a>.',	NULL,	368,	'Občan'),
('21. Je potrebné certifikáty so zrušenou platnosťou manuálne odstrániť? Ak áno, aký je postup?',	'Používateľom, ktorí využívajú operačný systém <b>MS Windows</b>, sa odporúča pred elektronickým podpisovaní dokumentov <b>vymazať si zo systému staré neplatné certifikáty</b> (z dôvodu neprehľadnosti pri výbere platného certifikátu). <a href="https://www.slovensko.sk/_img/CMS4/Navody/navod_na_odstranenie_certifikatov_so_zrusenou_platnostou.pdf">Návod na odstránenie certifikátov so zrušenou platnosťou...</a> [.pdf, 552.8 kB].

Používateľom, ktorí využívajú operačné systémy <b>GNU/Linux</b> a <b>macOS</b>, sa certifikáty automaticky neukladajú, preto ich <b>nemusia odstraňovať</b>.',	NULL,	369,	'Občan'),
('22. Kedy sa elektronická úradná správa považuje za doručenú?',	'Podľa zákona o e-Governmente sa elektronická úradná správa považuje za doručenú:

<ul>
<li><b>uložením elektronickej úradnej správy</b> (okamih, odkedy je elektronická úradná správa objektívne dostupná prijímateľovi v elektronickej schránke) - ak je adresátom orgán verejnej moci,</li>
<li><b>deň bezprostredne nasledujúci po uložení elektronickej úradnej správy</b> - ak nie je adresátom orgán verejnej moci a nedoručuje sa do vlastných rúk,</li>
<li><b>dňom, hodinou, minútou a sekundou uvedenými na elektronickej doručenke alebo márnym uplynutím úložnej lehoty podľa toho, ktorá skutočnosť nastane skôr, a to aj vtedy, ak sa adresát o tom nedozvedel</b> - ak nie je adresátom orgán verejnej moci a doručuje sa do vlastných rúk</li>
</ul>',	NULL,	370,	'Občan'),
('23. Aký dátum a čas obsahuje elektronická doručenka?',	'Elektronická doručenka obsahuje <b>údaje o dátume a čase, kedy bola elektronická úradná správa (rozhodnutie) doručená</b>.

<ul>
<li>Údaje sa automaticky generujú po úspešnej autorizácii a po uložení doručovanej správy do elektronickej schránky.</li>
<li>Následne sa adresátovi obsah elektronickej úradnej správy fyzicky sprístupní v jeho elektronickej schránke v priečinku „Prijaté".</li>
<li>V prípade preťaženia systému, výpadku alebo inej poruchy sa však elektronická úradná správa doručí až po odstránení vzniknutého problému.</li>
</ul>',	NULL,	371,	'Občan'),
('24. Čo mám robiť, ak nemôžem z objektívnych dôvodov elektronický úradný dokument prevziať a oboznámiť sa s jeho obsahom?',	'Zákonodarca pamätal aj na situácie, keď si z objektívnych príčin bez vlastného pričinenia (napr. z dôvodu hospitalizácie a pod.) nemôžete doručené elektronické úradné dokumenty prevziať a oboznámiť sa s ich obsahom. Na tento účel bol v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180401.html#paragraf-33.odsek-1">§ 33 ods. 1</a> zákona o e-Governmente ustanovený inštitút neúčinnosti elektronického doručenia. Ako postupovať pri návrhu na neúčinnosť doručenia nájdete v sekcii <a href="https://www.slovensko.sk/sk/navody">Návody</a>, v časti určenej pre fyzické alebo právnické osoby, v návode s názvom <a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/postup_neucinnost_dorucovania.pdf">Postup pri návrhu na neúčinnosť doručovania</a>.',	NULL,	372,	'Občan'),
('25. Ako postupovať po zobrazení chybovej hlášky pri elektronickom udeľovaní oprávnenia na prístup a disponovanie s elektronickou schránkou právnickej osoby? ',	'Právnická osoba (ďalej len „PO“), ktorej bola zriadená elektronická schránka, je jej majiteľom a je oprávnená disponovať s ňou v súlade a spôsobom ustanoveným zákonom o e-Governmente. Pristupovať a disponovať s elektronickou schránkou PO môže automaticky zo zákona <b>štatutárny orgán alebo člen štatutárneho orgánu PO</b>, ktorej bola elektronická schránka zriadená, alebo <b>osoba, ktorej sa udelilo oprávnenie</b>.

Plné alebo čiastočné oprávnenie na prístup a disponovanie s elektronickou schránkou je možné udeliť a zmenu tohto oprávnenia vykonať prostredníctvom listinnej žiadosti dostupnej na portáli slovensko.sk v sekcii „<a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">Tlačivá</a>“ alebo cez určenú funkciu priamo v elektronickej schránke. Viac informácií nájdete v <a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/udelenie_opravnenia_FO.pdf">návode</a>...

Majiteľ elektronickej schránky (v tomto prípade spoločnosť) môže poveriť inú spoločnosť správou elektronickej schránky, to znamená, že jej môže dať povolenie na jednotlivé úkony v schránke alebo na plnú manipuláciu s touto elektronickou schránkou.

UPOZORNENIE: Nižšie uvedený postup, prosím, aplikujte iba v prípade, ak môžete postupovať oprávnenie na ďalšie osoby a ak sa vám pri elektronickom udeľovaní oprávnenia cez funkciu elektronickej schránky zobrazila chybová hláška. V praxi sme uvedený problém zaznamenali v prípade viacstupňového udeľovania oprávnení medzi právnickými osobami. <i>Príklad: štatutár s.r.o. udelí oprávnenie s možnosťou jeho postúpenia inej s.r.o. a tá následne oprávni komanditnú spoločnosť, ktorej komplementárom je ďalšia právnická osoba.</i>

<ol>
<li>Ak máte oprávnenie na prístup a disponovanie s elektronickou schránkou PO a na postúpenie tohto oprávnenia, prihláste sa na stránke <a href="https://www.slovensko.sk/sk/titulna-stranka">www.slovensko.sk</a> v mene PO a na úvodnej stránke portálu kliknite na „<b>Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a></b>“.</li>
<li>Vyberte poskytovateľa služby – <b>Národnú agentúru pre sieťové a elektronické služby</b>.</li>
<li>V predmete správy uveďte: <b>Žiadosť o udelenie oprávnenia na prístup a disponovanie s elektronickou schránkou – elektronicky</b>.</li>
<li>Do správy uveďte stručný popis žiadosti , teda že sa žiadate o udelenie oprávnenia na prístup a disponovanie s elektronickou schránkou, no napriek tomu, že môžete postúpiť oprávnenie na ďalšiu osobu, sa vám ho nepodarilo urobiť elektronicky (t.j. pri zobrazení chybovej hlášky pri elektronickom udeľovaní oprávnenia na prístup a disponovanie s elektronickou schránkou).</li>
<li><b>Priložte vyplnenú žiadosť</b>, ktorá obsahuje základné údaje o tom, kto komu udeľuje oprávnenie (meno, priezvisko, rodné číslo, prípadne IČO), dobu platnosti oprávnenia (odkedy dokedy), rozsah oprávnenia (úplný alebo čiastočný prístup). Uvedená žiadosť je dostupná vo formáte PDF na portáli slovensko.sk, konkrétne v sekcii „<a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">Tlačivá</a>“.</li>
<li><b>Správu podpíšte platným kvalifikovaným elektronickým podpisom (KEP) osoby</b>, ktorá má možnosť postúpiť oprávnenie.</li>
<li>Správu odošlite.</li>
<li>Do elektronickej schránky vám bude následne doručená informačná správa o postúpení oprávnenia.</li>
</ol>',	NULL,	373,	'Občan'),
('6. Koľkým osobám je možné delegovať prístup do schránky?',	'Počet osôb, ktorým je možné udeliť oprávnenie, zákon nelimituje. Avšak pri udeľovaní oprávnenia je potrebné zvážiť, komu a v akom rozsahu (čiastočný, úplný) prístup umožníte, nakoľko tieto osoby sa následne budú môcť prihlasovať do elektronickej schránky a disponovať s ňou',	'Školy',	653,	'Orgán verejnej moci'),
('26. Čo znamená informácia o nevalidnom PDF formáte vo výsledku overenia podpisov?',	'Ide iba o informatívny výsledok validácie PDF súboru voči formátu PDF/A-1a v špecifickom validátore používanom na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, ktorý v niektorých prípadoch nesprávne vyhodnocuje vlastnosti formátu súboru. Tento výsledok nemá vplyv na platnosť autorizácie.

Vo výsledku overenia podpisov je vždy dôležité, či je platná autorizácia. Výsledok validácie objektu uvedeného až v nižšej časti výsledku overenia nemá vplyv na platnosť autorizácie.

Podľa účinného Výnosu o štandardoch pre ISVS č. 55/2014 z.Z., je verejná správa od marca 2018 povinná akceptovať podpísané PDF súbory aj v iných verziách než je PDF/A-1a. Zároveň je povinná v prípade odosielania a zverejňovania podpísaných PDF súborov používať formát PDF/A-1 alebo PDF/A-2.

Validácia objektu je v súčasnosti vykonávaná len voči špecifikácii PDF/A-1a, <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> zatiaľ nepodporuje validáciu voči PDF/A-2. V minulosti bola verejná správa povinná akceptovať a vyhotovovať len PDF/A-1a, ak išlo o autorizované súbory.',	NULL,	374,	'Občan'),
('27. Ako je možné získať kvalifikovanú časovú pečiatku?',	'Pri vytváraní kvalifikovaného elektronického podpisu (<a href="https://www.slovensko.sk/sk/faq/faq-najcastejsie-otazky#ako4">Vytvorenie kvalifikovaného elektronického podpisu</a>) prostredníctvom portálu slovensko.sk v tzv. konštruktore správy (po potvrdení úspešného podpísania v aplikácii D.Signer/XAdES) sa automaticky k podpisu pripojí aj kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>.

V prípade, ak používateľ pripojí do prílohy podania už podpísaný elektronický dokument, ktorý v podpise časovú pečiatku neobsahuje, portál kvalifikovanú časovú pečiatku do takéhoto podpisu nepripája. Ak pre autorizáciu daného dokumentu v zmysle zákona nepostačuje vlastnoručný podpis a vyžaduje sa úradne osvedčený podpis a používateľ disponuje už podpísaným dokumentom bez kvalifikovanej časovej pečiatky, môže kvalifikovanú časovú pečiatku podpisu získať vytvorením podpisu na portáli alebo pre doplnenie kvalifikovanej časovej pečiatky využiť služby iného poskytovateľa služieb.',	NULL,	375,	'Občan'),
('28. Čo je to Web SSO (Single Sign-On)?',	'Modul IAM (Identity and Access Management) poskytuje funkcionalitu overenia identity používateľa a odovzdáva identifikačné údaje (federáciu identity) ostatným zapojeným systémom. Výhodou použitia jednotného prihlásenia je to, že používateľ môže prechádzať celým prostredím na poskytovanie služieb bez nutnosti znova zadávať svoje identifikačné údaje. Z pohľadu používateľa je jedno, v ktorom systéme svoje prihlásenie realizuje, žiadny z partnerských systémov (Service Provider Portál) už od neho opätovne prihlásenie nepožaduje.

Modul IAM funguje na princípe Single Sign-On (SSO), čo znamená „jednotné prihlásenie sa“. Používateľ sa prihlási prostredníctvom prihlasovacej webovej stránky s využitím autentifikačného prostriedku, čim preukaze svoju totožnosť.

<a href="https://www.slovensko.sk/sk/sluzba-web-sso">Viac o možnostiach služby Web Single Sign-On...</a>

V prípade otázok alebo nejasností môžete zatelefonovať na Ústredné kontaktné centrum. Jeho pracovníci vám radi poradia na telefónnom čísle +421235803083 od pondelka do piatka v čase od 8.00 h do 18.00 h, v stredu až do 21.00 h. Mimo uvedeného času môžete svoje otázky zaslať prostredníctvom <a href="https://helpdesk.slovensko.sk/new-incident/">elektronického kontaktného formulára</a>.',	NULL,	376,	'Občan'),
('29. Môže sa občan inej krajiny EÚ prihlásiť na slovenské portály? Môže Slovák využívať elektronické služby v iných krajinách EÚ?',	'Na portáli slovensko.sk je možné prihlásiť sa pomocou <a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> Node. Prihlásenie je určené pre zahraničné fyzické osoby, ktoré sú držiteľmi zahraničného prihlasovacieho prostriedku vydaného v niektorej z krajín EÚ. <a href="https://www.slovensko.sk/sk/eidas/informacie-o-prihlaseni-cez-ei">Viac informácií...</a>

Držitelia slovenských občianskych preukazov s čipom (eID) alebo slovenských dokladov o pobyte cudzinca s čipom už môžu využívať elektronické služby verejného sektora  na portáli Európskej komisie, na podporu európskych občianskych iniciatív a na portáloch Česka, Belgicka, Portugalska, Španielska a Talianska. Do 18. decembra 2020 majú všetky členské štáty EÚ povinnosť sprístupniť svoje elektronické služby občanom Slovenskej republiky a cudzincom s pobytom v Slovenskej republike.

Ďalšie užitočné informácie nájdete aj v <a href="https://www.slovensko.sk/_img/CMS4/eIDAS/FAQ_eIDAS.pdf">často kladených otázkach k elektronickej identifikácii na základe eIDAS</a>.',	'Občania iných krajín',	377,	'Občan'),
('30. Prečo a ako si môžem pred podpisom skontrolovať verzie PDF?',	'Technológia PDF (z angličtiny Portable Document Format) umožňuje vytvoriť dokument s viacerými prekrývajúcimi sa vrstvami. Dokument s typom podpisu PADES tak môže v niektorej vrstve obsahovať text, s ktorým by ste nemali možnosť sa oboznámiť. Preto odporúčame, aby ste si PDF dokument najskôr stiahli a otvorili v programe, ktorý umožňuje sledovanie vrstiev (napríklad Adobe Reader) a až následne po preštudovaní jeho kompletného obsahu ho podpísali.',	NULL,	378,	'Občan'),
('1. Na čo slúži elektronická schránka?',	'Orgány verejnej moci prijímajú do schránky elektronické podania (žiadosti) od občanov, podnikateľov a iných inštitúcií. Schránka občanov a podnikateľov je určená na prijímanie elektronických úradných dokumentov (rozhodnutí) od orgánov verejnej moci. Komunikácia prostredníctvom elektronickej schránky nahrádza klasický spôsob komunikácie s verejnou správou a je ekvivalentná k podaniam a doručovaniu dokumentov v listinnej podobe.
Prostredníctvom schránky je ďalej možné prijímať správy, notifikácie o odoslaní a doručení a zisťovať stav odoslaných podaní.',	'Podnikanie',	379,	'Občan'),
('2. Aké základné zásady bezpečnosti treba pri práci s elektronickou schránkou dodržiavať?',	'Pri práci s elektronickou schránkou a eID používateľ pracuje s citlivými údajmi, a preto by nikdy nemal po prihlásení do svojej schránky umožniť prístup neoprávneným osobám k otvorenému webovému prehliadaču, resp. aplikácii, v ktorej sa do schránky prihlásil. Neodporúča sa prihlasovať sa do schránky a na portál použitím eID na zdieľaných počítačoch, v ktorých používateľ nemá žiadnu kontrolu nad nainštalovaným softvérom a hardvérom. Po odhlásení zo schránky sa odporúča skontrolovať, či odhlásenie prebehlo úspešne a následne zatvoriť webový prehliadač.',	NULL,	380,	'Občan'),
('3. Komu sa elektronická schránka zriaďuje?',	'Podľa zákona č. 305/2013 Z. z. o e-Governmente sa elektronická schránka zriaďuje pre fyzické osoby, podnikateľov, právnické osoby, orgány verejnej moci a pre subjekty medzinárodného práva. Elektronické schránky sa zriaďujú na portáli Ústrednom portáli verejnej správy na adrese www.slovensko.sk.',	'Podnikanie',	381,	'Občan'),
('4. Ako požiadam o zriadenie elektronickej schránky?',	'<b>Ak ste občan SR, elektronická schránka sa vám zriadi automaticky po dovŕšení 18. roku života</b>. Elektronické schránky fyzických osôb – podnikateľov a právnických osôb sa zriaďujú priebežne od 31. januára 2014 v nadväznosti na registráciu subjektu v príslušnom registri. V týchto prípadoch nie je rovnako potrebné o zriadenie elektronickej schránky žiadať.

Orgány verejnej moci žiadajú o zriadenie elektronickej schránky podľa Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2019/438/">438/2019 Z. z.</a>, ktorou sa vykonávajú niektoré ustanovenia zákona o e-Governmente zaslaním listinného alebo elektronického formulára pre nahlásenie údajov na účely zriadenia elektronickej schránky orgánu verejnej moci.',	'Podnikanie',	382,	'Občan'),
('5. Musím svoju elektronickú schránku využívať? Musím sa do nej pravidelne prihlasovať?',	'Nie, ak ste fyzická osoba, nemusíte. Avšak v prípade, že si ju aktivujete na doručovanie, vám do nej môže orgán verejnej moci doručiť úradné rozhodnutie elektronicky. Takéto rozhodnutie je rovnocenné s tým, ktoré by vám zaslal v listinnej forme. Či si schránku aktivujete na doručovanie, alebo nie, je vaším rozhodnutím.',	NULL,	383,	'Občan'),
('6. Čo potrebujem na prihlásenie sa do elektronickej schránky podľa zákona o e-Governmente na ústrednom portáli?',	'Na to, aby ste sa úspešne prihlásili na portál a mohli vstúpiť do elektronickej schránky,  je  potrebné vlastniť občiansky preukaz s elektronickým čipom (tzv. eID kartu). Občiansky preukaz musí mať aktivovanú Online eID funkciu, to znamená, že ste si k nemu definovali  bezpečnostný osobný kód (BOK).
Ďalej je nevyhnutné vlastniť čítačku kariet, mať inštalovaný príslušný softvér – aplikáciu <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a> (slúži na prihlasovanie) a ovládače k čítačke kariet, ktoré sú k dispozícii v časti <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.',	NULL,	384,	'Občan'),
('7. Ako  mám postupovať pri prihlásení sa do elektronickej schránky?',	'Pred samotným prihlásením je potrebné, aby ste mali:

<ul>
<li>občiansky preukaz s elektronickým čipom a definovaným bezpečnostným osobným kódom,</li>
<li>čítačku elektronických kariet,</li>
<li>na počítači nainštalovaný softvér na prihlasovanie (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a>) a ovládače k čítačke kariet.</li>
</ul>

Do elektronickej schránky sa prihlásite cez funkciu „Prihlásiť sa na portál“, ktorá sa nachádza na prihlasovacom paneli v pravom hornom rohu obrazovky titulnej stránky www.slovensko.sk.
Ďalej postupujte podľa <a href="https://www.slovensko.sk/_img/CMS4/Navody/postup_prihlasenie_na_portal.pdf">Návodu na prihlásenie sa na portál a do elektronickej schránky</a> [.pdf, 704.6 kB].

Prvým krokom na prihlásenie je vaša úspešná autentifikácia na portáli, následne sa do vašej elektronickej schránky dostanete kliknutím na ikonu obálky (Schránka) v prihlasovacom paneli v pravom hornom rohu obrazovky.
V prípade, že ste oprávnenou osobou a konáte v mene iného subjektu (fyzickej osoby, právnickej osoby, orgánu verejnej moci), po úspešnej autentifikácii si vyberte z ponúkaného rozbaľovacieho menu tú identitu, v mene ktorej sa chcete prihlásiť.',	NULL,	385,	'Občan'),
('8. Neviem sa prihlásiť do elektronickej schránky, čo mám urobiť?',	'V prípade, že prihlásenie do vašej elektronickej schránky zlyhalo, skontrolujte, prosím, či boli splnené nasledujúce podmienky:

<ul>
<li>Ste držiteľom občianskeho preukazu s čipom vydaného po 1. 12. 2013 a máte na ňom aktivovaný elektronický čip a aktivovaný bezpečnostný osobný kód.</li>
<li>Máte nainštalované príslušné softvérové vybavenie (aplikáciu <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a> a príslušné ovládače pre čítačky kariet, ktoré sú dostupné v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>).</li>
<li>Postupovali ste podľa <a href="https://www.slovensko.sk/_img/CMS4/Navody/postup_prihlasenie_na_portal.pdf">návodu na prihlásenie sa do elektronickej schránky</a>.</li>
</ul>

Ak sa vám napriek dodržaniu všetkých spomínaných podmienok a krokov nepodarilo do elektronickej schránky prihlásiť, kontaktujte Ústredné kontaktné centrum na telefónnom čísle  02/35 803 083 v pracovných dňoch, pondelok až piatok, od 8.00 do 18.00 h, v stredu do 21.00 h alebo prostredníctvom <a href="https://helpdesk.slovensko.sk/new-incident/">kontaktného formulára</a>.',	NULL,	386,	'Občan'),
('9. Na čo slúži aktivácia elektronickej schránky na doručovanie?',	'V prípade, že si elektronickú schránku aktivujete na doručovanie, sprístupníte ju na doručovanie elektronických úradných dokumentov (úradných rozhodnutí). Úradné rozhodnutia vám môžu zasielať do elektronickej schránky iba orgány verejnej moci.

Odosielanie elektronických podaní prostredníctvom ústredného portálu nesúvisí s aktiváciou vašej elektronickej schránky. To znamená, že <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a> môžete odoslať či už je vaša schránka aktivovaná na doručovanie alebo nie. Rozdiel je len v tom, že do aktivovanej schránky vám orgán verejnej moci môže doručiť elektronické úradné rozhodnutie, ale v prípade, že schránku aktivovanú na doručovanie nemáte, rozhodnutie vám orgán musí doručiť listinne.

<i><b>Poznámka:</b> Na podanie návrhu na vykonanie exekúcie musí mať oprávnený (alebo jeho zástupca) elektronickú schránku aktivovanú na doručovanie, v opačnom prípade podáva návrh prostredníctvom ktoréhokoľvek exekútora (<a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/1995/233/20190101#paragraf-48.odsek-8">§ 48 ods. 8</a> zákona č. 233/1995 Z. z. o súdnych exekútoroch a exekučnej činnosti).</i>',	NULL,	387,	'Občan'),
('10. Ako si svoju schránku aktivujem na doručovanie?',	'Elektronickú schránku si môžete aktivovať na doručovanie prostredníctvom Žiadosti o aktiváciu elektronickej schránky, ktorá je dostupná vo vašej schránke prostredníctvom tlačidla „Aktivovať“.

Elektronickú schránku budete mať aktivovanú na doručovanie ku dňu, ktorý uvediete v žiadosti, <b>najskôr na tretí pracovný deň po jej doručení</b>. Viac informácií o postupe aktivácie schránky na doručovanie nájdete v <a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/navod_aktivacia_na_dorucovanie.pdf">návode na aktiváciu elektronickej schránky na doručovanie</a>.

Informácie spojené s procesom povinnej aktivácie schránok právnických osôb a organizačných zložiek so sídlom v SR si prečítajte v <a href="https://www.slovensko.sk/sk/faq/faq-aktivacia-po/_povinna-aktivacia-schranok-pra">najčastejších otázkach a odpovediach týkajúcich sa povinnej aktivácie</a>.',	NULL,	388,	'Občan'),
('11. Ak je moja elektronická schránka aktivovaná na doručovanie, musím komunikovať s orgánmi verejnej moci elektronicky?',	'Ak máte svoju elektronickú schránku aktivovanú na doručovanie, predpokladá sa, že preferujete elektronickú komunikáciu s verejnou správou. Stále však môžete svoje podania uskutočniť aj v klasickej listinnej forme.',	NULL,	389,	'Občan'),
('12. Ako splnomocniť niekoho na prístup do svojej elektronickej schránky?',	'Splnomocnenie alebo oprávnenie určenej fyzickej, resp. právnickej osoby je možné vykonať prostredníctvom žiadosti Udelenie oprávnenia fyzickej/právnickej osobe na zastupovanie subjektu, ktorá je sprístupnená vo vašej elektornickej schránke v časti Vytvorenie žiadosti (pôvodná verzia schránky) alebo v sekcii Nastavenia v časti Oprávnenia osôb (nová verzia schránky). Po schválení žiadosti je možné vybrať rozsah oprávnení pre splnomocnenú osobu pomocou funkcie elektronickej schránky. Viac informácií, ako postupovať nájdete v sekcii <a href="https://www.slovensko.sk/sk/navody">Návody</a>.

Žiadosť o udelenie prístupu do elektronickej schránky môžete poslať aj listinne vyplnením príslušného tlačiva, ktoré nájdete v sekcii <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">tlačivá</a>.',	'Podnikanie',	390,	'Občan'),
('13. Sme zahraničná osoba/subjekt, ako si zriadime elektronickú schránku a ako sa do nej prihlásime?',	'Na prihlasovanie sa do elektronických schránok zriadených podľa zákona o e-Governmente je možné použiť na účely autentifikácie (procesu overenia identity, ktorá sa prihlasuje) iba občiansky preukaz s čipom a bezpečnostným osobným kódom, doklad o pobyte s elektronickým čipom a bezpečnostným osobným kódom alebo alternatívny autentifikátor.

Ak ide o cudzinca alebo o štatutára zahraničnej právnickej osoby, títo nemajú možnosť získať občiansky preukaz s čipom, ktorého vydanie sa viaže na slovenské štátne občianstvo a trvalý pobyt na území SR. V súlade so zákonom č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2011/404/20170501">404/2011 Z. z.</a> o pobyte cudzincov môžu na príslušnom policajnom útvare SR požiadať o vydanie dokladu o pobyte s čipom.
<b>Od 1. marca 2017</b> môže zahraničný štatutár, ktorý nemá nárok na vydanie dokladu o pobyte s čipom, v zmysle vyhlášky Ministerstva vnútra Slovenskej republiky požiadať o vydanie <a href="https://www.slovensko.sk/sk/oznamy/detail/_alternativny-autentifikator-pr">alternatívneho autentifikátora</a>. Viac informácií k <a href="https://www.slovensko.sk/sk/agendy/agenda/_zahranicny-statutar/">zahraničným štatutárom</a>...',	'Podnikanie',	391,	'Občan'),
('14. Ako si mám deaktivovať doručovanie do schránky?',	'Elektronickú schránku si môžu v súčasnosti deaktivovať iba fyzické osoby a fyzické osoby podnikatelia (prípadne právnické osoby nezapísané v Obchodnom registri SR do 1. júna 2020 - t. j. do ich povinnej aktvácie zo zákona o e-Governmente) prostredníctvom elektronickej žiadosti, ktorá je dostupná priamo v ich elektronickej schránke v sekcii „Nastavenia" v časti „Informácie o schránke". Pri položke „Stav schránky“ je možnosť „Deaktivovať schránku“ . V Žiadosti o deaktiváciu elektronickej schránky na doručovanie stačí zvoliť požadovaný dátum deaktivácie a správu odoslať.  V prípade zadania aktuálneho dátumu, bude schránka deaktivovaná ku dňu uvedenému v žiadosti, najskôr na tretí pracovný deň po doručení žiadosti.  O deaktiváciu elektronickej schránky je možné požiadať aj listinne (napr. osoby vo výkone trestu odňatia slobody alebo vo väzbe, ktoré nemajú prístup k počítaču a pod.). Tlačivo je dostupné v sekcii <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/4f6a8f60-ad8a-4e5e-83a5-a5f500b5eab5">Tlačivá</a>.

<b>Upozornenie!</b>
Orgány verejnej moci a právnické osoby so sídlom v SR zapísané do Obchodného registra SR si nemôžu schránku deaktivovať z vlastnej vôle, lebo im bola aktivovaná na doručovanie priamo zo zákona o e-Governmente.',	'Podnikanie',	392,	'Občan'),
('15. Môžem svoju elektronickú schránku zrušiť?',	'Elektronická schránka sa aktom vôle zrušiť nedá. Schránka bude zrušená a jej obsah vymazaný iba v prípade smrti jej majiteľa, resp. zániku právnickej osoby alebo orgánu verejnej moci, a to po uplynutí 3 rokov odo dňa, keď sa o tejto skutočnosti dozvie zriaďovateľ z príslušného referenčného registra.',	'Podnikanie',	393,	'Občan'),
('16. Ako získam ako dedič prístup do elektronickej schránky zosnulého živnostníka?',	'Ak živnostník zomrie, môžu v živnosti až do skončenia dedičského konania pokračovať dedičia, pozostalý manžel, aj keď nie je dedičom, ak je spoluvlastníkom majetku používaného na prevádzkovanie živnosti a ak v živnosti nepokračujú dedičia alebo správca dedičstva, ak ho ustanovil súd.

<b>Pokračovanie v živnosti musia však tieto osoby samé oznámiť živnostenskému úradu</b>, a to v lehote jedného mesiaca od úmrtia živnostníka, správca dedičstva do jedného mesiaca od ustanovenia do funkcie. Po oznámení týchto skutočností príde automaticky Národnej agentúre pre sieťové a elektronické služby (<a href="https://www.slovensko.sk/sk/slovnik/detail/_nases">NASES</a>) aktualizovaná dávka údajov zo živnostenského registra a následne sa umožní prístup takejto osoby do elektronickej schránky zosnulého živnostníka.',	'Podnikanie',	394,	'Občan'),
('17. Doplňujúce najčastejšie otázky a odpovede',	'Pokiaľ ste v predchádzajúcom článku nenašli riešenie svojho problému týkajúceho sa elektronických schránok, vypracovali sme pre vás doplňujúce <a href="https://www.slovensko.sk/sk/faq/_doplnujuce-otazky-a-odpovede-t">otázky a odpovede</a>, v ktorých nájdete bližšie informácie.',	NULL,	395,	'Občan'),
('1. Aké elektronické služby môžem využívať prostredníctvom ústredného portálu?',	'Sprístupnené elektronické služby pre občanov a podnikateľov nájdete v sekcii <a href="https://www.slovensko.sk/sk/najst-sluzbu">Nájsť službu</a>. V nej si službu vyberiete zadaním kľúčových slov do vyhľadávacích polí, ktorými sú názov elektronickej služby, názov úradu alebo inštitúcie alebo výberom zo zoznamu životných situácií.
Elektronické služby si môžete vyhľadať aj prostredníctvom navigácie podľa jednotlivých životných situácií.

Elektronické služby si zverejňujú na ústrednom portáli samotné orgány verejnej moci. Takýmito službami sú napr. služby obchodného a živnostenského registra, katastra nehnuteľností, Úradu pre verejné obstarávanie, služby Centrálnej ohlasovne alebo evidencie vozidla.
Popri týchto službách má každý orgán verejnej moci automaticky pridelenú aj službu Všeobecnej agendy. Prostredníctvom tejto služby môžete orgánu verejnej moci doručiť <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a> do jeho elektronickej schránky zriadenej na ústrednom portáli, ktoré nemá špecifickú formu a náležitosti predpísané právnymi normami.

Zoznam služieb sa priebežne rozširuje so sprístupňovaním elektronických služieb jednotlivých rezortov verejnej správy. Prehľad jednotlivých služieb spolu s názvom orgánu verejnej moci, ktorý je aktualizovaný týždenne, nájdete v <a href="https://www.slovensko.sk/sk/zoznam-zverejnenych-sluzieb">zozname zverejnených služieb</a>.',	'Podnikanie',	396,	'Občan'),
('2. Odkedy je možné urobiť podanie do elektronických schránok zriadených podľa zákona o e-Governmente?',	'Podania do elektronických schránok zriadených podľa zákona o e-Governmente a prihlasovanie k elektronickým službám ústredného portálu prostredníctvom občianskeho preukazu s čipom je sprístupnené od 3. februára 2014.',	NULL,	397,	'Občan'),
('3. Aké formáty môže mať príloha, ktorá je súčasťou elektronického podania?',	'Konkrétne požiadavky na prílohy k elektronickému podaniu, ak sú vyžadované, by mali byť špecifikované pri každej elektronickej službe samotným orgánom verejnej moci, ktorý je adresátom podania. Formáty elektronických dokumentov, ktoré sú povinné osoby podľa zákona č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2019/95/">95/2019 Z.z.</a> povinné prijímať a čítať, sú predpísané vo Vyhláške č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch pre informačné technológie verejnej správy.

<b>Príklady požiadaviek na prílohy:</b>

<b>Služba Obchodného registra SR - Návrh na zápis, zmenu a výmaz údajov v obchodnom registri</b> -  naskenované prílohy k návrhu musia byť vo formáte PDF (preferovaný formát) alebo TIFF podpísané kvalifikovaným elektronickým podpisom. Je nutné, aby skenovaný dokument bol v odtieňoch sivej s rozlíšením najviac 200 dpi (dots per inch/počet bodov na jeden palec).

<b>Služba Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a></b> - prílohy k podaniu Všeobecnej agendy môžu byť v akomkoľvek formáte, avšak podpísať kvalifikovaným elektronickým podpisom sa na portáli môžu iba prílohy vo formáte .pdf, .xml (vo formáte elektronického formulára registrovaného na ústrednom portáli), .txt a .png. Na podpisovanie je určený balík aplikácií D.Suite/<a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> alebo aplikácia D.Launcher, ktoré sú k dispozícii v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.

<h2>Povinne prijímané formáty elektronických dokumentov</h2>
<b>Podpísané elektronické dokumenty</b>

V zmysle Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch pre informačné technológie verejnej správy platí povinnosť prijímať a čítať nasledovné formáty elektronických dokumentov podpísaných elektronickým podpisom alebo opatrených elektronickou pečaťou:

<ul>
<li>Portable Document Format (.pdf) vo verzii A-1 (PDF/A-1), A-2 (PDF/A-2), A-3 (PDF/A-3),</li>
<li>Portable Document Format (.pdf) minimálne vo verzii 1.3 a maximálne vo verzii 2.0 v súlade s <a href="LINK">SLOVO</a>§ 19 písm. a) bod 2,</li>
<li>Plain Text Format v kódovaní UTF-8 (.txt),</li>
<li>Portable Network Graphics (.png),</li>
<li>XMLDataContainer (.xml) - kontajner XML údajov podľa prílohy č. 7 Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch alebo</li>
<li>v iných formátoch elektronických dokumentov, ak sa na tom zasielateľ a prijímateľ dohodnú.</li>
</ul>

Elektronické dokumenty musia byť obvykle spolu s elektronickým podpisom alebo elektronickou pečaťou, ktorými sa dokumenty autorizujú, vložené:

<ul>
<li>v podpisovom kontajneri ASiC (.asics, .scs, .asice, .sce) alebo</li>
<li>v inom podpisovom kontajneri, ak sa na tom zasielateľ a prijímateľ dohodnú (napríklad .zep, .xzep).</li>
</ul>

V prípade elektronických dokumentov vo formáte PDF môžu byť elektronický podpis alebo elektronická pečať, ktorými sa dokumenty autorizujú, pripojené ako súčasť súboru vo formáte PDF (.pdf), a preto nemusia byť vložené v podpisovom kontajneri. V takomto prípade ide o takzvaný PAdES podpis.

Formáty podpisov, ktoré sú orgány verejnej moci povinné prijímať, sú uvedené v <a href="https://www.slovensko.sk/sk/faq/_vykon-verejnej-moci-organy-ve#formaty">samostatnej otázke</a>.

<b>Poznámka:</b>
Povinné osoby môžu podpisovať iné ako povinné formáty len ak sa na tom všetky strany príslušnej komunikácie dohodnú, s vedomím možných škôd a nezrovnalostí v ďalšom konaní vyplývajúcich z takého postupu. Povinné osoby môžu v prípade formátu PDF podpisovať len PDF/A-1, PDF/A-2 a PDF/A-3.

<b>Čo znamená informácia o nevalidnom PDF formáte vo výsledku overenia podpisov?</b>
Vo výsledku overenia podpisov je dôležité, či je platná autorizácia. Výsledok validácie objektu uvedeného až v nižšej časti výsledku overenia nemá vplyv na platnosť autorizácie. <a href="https://www.slovensko.sk/sk/faq/_najcastejsie-otazky-a-odpovede#nevalidnyformatpdf">Viac...</a>

<b>Nepodpísané elektronické dokumenty</b>

V zmysle Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch platí povinnosť prijímať a čítať aj nepodpísané elektronické dokumenty, ak možnosť podávania nepodpísaných elektronických dokumentov príslušné konanie pripúšťa. Medzi povinne prijímané formáty nepodpísaných elektronických dokumentov uvedené v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/20220101.html#paragraf-18">§ 18 až § 25</a> Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch patria napríklad:

Textové súbory vo formátoch:

<ul>
<li>Hypertext Markup Language (.html, .htm) alebo Extensible Hypertext Markup Language (.xhtml),</li>
<li>Portable Document Format (.pdf) minimálne vo verzii 1.3 a maximálne vo verzii 2.0, ak neobsahujú dynamický obsah uvedený v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/20220101.html#paragraf-19">§ 19</a> Vyhlášky o štandardoch,</li>
<li>Plain Text Format v kódovaní UTF-8 (.txt), alebo</li>
<li>v iných formátoch, ak vopred súhlasia všetky zúčastnené strany a technické podmienky to umožňujú.</li>
</ul>

Grafické súbory pre rastrovú grafiku vo formátoch:

<ul>
<li>Graphics Interchange Format (.gif),</li>
<li>Portable Network Graphics (.png),</li>
<li>Joint Photographic Experts Group (.jpg, .jpeg, .jpe, .jfif, .jfi, .jif),</li>
<li>Tagged Image File Format (.tif, .tiff) vo verzii 6.0, najmä jednostránkové Baseline TIFF, alebo</li>
<li>v iných formátoch, ak vopred súhlasia všetky zúčastnené strany a technické podmienky to umožňujú.</li>
</ul>

Grafické súbory pre vektorovú grafiku vo formátoch:

<ul>
<li>Scalable Vector Graphics (.svg), alebo</li>
<li>v iných formátoch, ak vopred súhlasia všetky zúčastnené strany a technické podmienky to umožňujú.</li>
</ul>',	NULL,	398,	'Občan'),
('4. Musím <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a>, ktoré zasielam orgánu verejnej moci, podpísať kvalifikovaným elektronickým podpisom?',	'Kvalifikovaný elektronický podpis je ekvivalentom vlastnoručného podpisu. Vlastnoručným podpisom sa potvrdzujú právne úkony v listinnej podobe.
To znamená, že tie konania (žiadosti, podnety, návrhy a pod.), ktoré vyžadujú od občana vlastnoručný podpis pri listinnom vybavovaní, je potrebné v elektronickej podobe podpísať kvalifikovaným elektronickým podpisom.
Je preto dôležité si pred odoslaním samotného podania prečítať návod na vyplnenie formulára (služby), v ktorom orgány verejnej moci uvádzajú povinné náležitosti podania.',	NULL,	399,	'Občan'),
('5. Môžem používať už v minulosti zakúpený a platný kvalifikovaný certifikát na tvorbu elektronického podpisu pri podaniach na ústrednom portáli?',	'Áno, na tvorbu kvalifikovaného elektronického podpisu na portáli môžete využívať už v minulosti zakúpený platný kvalifikovaný certifikát, ktorý vlastníte napríklad na USB nosiči.',	NULL,	400,	'Občan'),
('6. Čo znamená elektronické doručovanie a <a href="https://www.slovensko.sk/sk/slovnik/detail/_fikcia-dorucenia">fikcia doručenia</a>?',	'Doručovanie v tomto prípade znamená doručovanie elektronického podania alebo elektronického dokumentu elektronicky, a to do schránky, ktorá je aktivovaná na doručovanie.

Doručovať do elektronickej schránky je možné v zmysle zákona o e-Governmente nie do vlastných rúk (obyčajne) alebo do vlastných rúk s fikciou doručenia. Ak ide o doručovanie do vlastných rúk s fikciou doručenia, adresátovi (ak nie je orgánom verejnej moci) sa sprístupní obsah správy až po potvrdení notifikácie o doručení (zadaním BOK kódu).  Elektronická správa sa považuje za doručenú <b>buď márnym uplynutím úložnej lehoty, alebo potvrdením notifikácie o doručení</b>. Úložná lehota je podľa zákona o e-Governmente 15 dní a plynie odo dňa nasledujúceho po dni uloženia elektronickej správy. Uložením elektronickej správy sa rozumie okamih, odkedy je správa objektívne dostupná v elektronickej schránke adresáta.
Uplatnenie fikcie doručenia teda znamená, že ak v úložnej lehote nepotvrdíte notifikáciu o doručení, rozhodnutie <b>sa bude považovať márnym uplynutím tejto lehoty za doručené, t. j. nastanú jeho právne účinky</b>.

Osobitné predpisy môžu upraviť spôsoby doručovania elektronickými prostriedkami inak.',	NULL,	401,	'Občan'),
('7. Ako sa dozviem o tom, že moje <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a> bolo doručené na orgán verejnej moci?',	'Zákon č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20170301">305/2013 Z. z.</a> o e-Governmente definuje na tento účel doručenku. Telo správy doručenky obsahuje stručný text, ktorý prijímateľa prehľadne informuje o dátume a čase doručenia elektronického dokumentu. V detaile správy sú dostupné bližšie informácie, ktoré sa prijímateľovi elektronickej správy zobrazia  po kliknutí na „Podrobné informácie“. V prípade záujmu si tak môžete pozrieť napr. kto je odosielateľom správy, prijímateľ správy, dátum doručenia, identifikátor správy alebo elektronického dokumentu a iné. Táto funkcionalita je funkčná vo všetkých typoch internetových prehliadačov okrem Internet Explorer.
Vzor doručenky pri službe Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a> je zobrazený na obrázku.

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/dorucenka.png">
</picture>

Obrázok - Vzor doručenky pri službe Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a>',	NULL,	402,	'Občan'),
('8. Čo znamená, keď mi do schránky príde Potvrdenie o odoslaní elektronického podania?',	'Potvrdenie o odoslaní elektronického podania je notifikačná správa, ktorá slúži na účely preukázania presného momentu odoslania elektronického podania, ktoré má význam najmä z pohľadu počítania a zachovávania niektorých (procesnoprávnych) lehôt ustanovených právnymi predpismi. Odosielateľom tejto informácie je Ministerstvo investícií, regionálneho rozvoja a informatizácie SR, ktoré je správcom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, a preto sa vám v časti odosielateľ zobrazí text „Ústredný portál verejnej správy“. Potvrdenie sa zasiela odosielateľovi aj adresátovi (orgánu verejnej moci) a obsahuje údaje o odosielateľovi a prijímateľovi podania, časový údaj o prijatí podania modulom G2G na spracovanie, identifikátor a predmet správy a môže obsahovať aj doplnkové informácie uvedené v definícii dátovej štruktúry.

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/potvrdenie_o_odoslani.jpg">
</picture>

Obrázok - Vzor potvrdenia o odoslaní',	NULL,	403,	'Občan'),
('9. Do elektronickej schránky mi prišla ,,Notifikácia o doručení k...", čo to znamená a ako mám postupovať?',	'Ak vám orgán verejnej moci doručuje do elektronickej schránky úradné rozhodnutie do vlastných rúk, zobrazí sa vám v schránke najskôr „Notifikácia o doručení k...". Na to, aby sa vám sprístupnil obsah rozhodnutia, musíte v zmysle zákona o e-Governmente najprv potvrdiť prijatie tejto notifikácie o doručení cez funkciu „Prevziať", zadaním bezpečnostného osobného kódu (BOK). <b>Po prevzatí notifikácie o doručení sa vám obratom zobrazí príslušné úradné rozhodnutie (aj s prílohami), ktoré bude zároveň uložené v priečinku „Prijaté správy".</b> Vzor notifikácie o doručení je zobrazený na obrázku.

<p><i>Poznámka: ak vám notifikácia o doručení nejde prevziať, vyskúšajte najskôr <a href="https://www.slovensko.sk/sk/navody/nekorektne-zobrazenie-stranky/_ako-postupovat-nekorektne-zobrazenie/">vymazať pamäť vášho internetového prehliadača</a>.</i></p>

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/notifikacia%20o%20doru%C4%8Den%C3%AD%20-%20nov%C3%A1.PNG">
</picture>

Obrázok - Vzor notifikácie o doručení',	NULL,	404,	'Občan'),
('10. Kedy sa prihlásenie do schránky považuje za bezdôvodné odopretie prijatia doručovaného úradného dokumentu?',	'Od 1. januára 2017 bolo do zákona o súdoch doplnené <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2004/757/20170701#paragraf-82l.odsek-1">osobitné ustanovenie o elektronickom výkone verejnej moci na súdoch</a>. V konaniach pred súdmi sa teda prihlásenie do elektronickej schránky bez potvrdenia doručenky počas úložnej lehoty pri doručovaní do vlastných rúk, ak je vylúčené náhradné doručenie, považuje za bezdôvodné odopretie prijatia doručovaného úradného dokumentu. Úradný dokument sa v takomto prípade považuje za doručený dňom nasledujúcim po uplynutí úložnej lehoty.',	NULL,	405,	'Občan'),
('11. Môže sa elektronický úradný dokument (rozhodnutie), ktorý je podpísaný kvalifikovaným elektronickým podpisom a zaslaný do elektronickej schránky, použiť na právne účely?',	'Áno, dokument podpísaný kvalifikovaným elektronickým podpisom (KEP) nahrádza dokument v tlačenej a podpísanej podobe.',	NULL,	406,	'Občan'),
('12. Aká je maximálna veľkosť podania?',	'Vzhľadom na štandardne používané kódovanie base 64, celková veľkosť všetkých objektov vložených do elektronickej správy v závislosti od jej ďalšieho obsahu všeobecne nemôže presiahnuť 33 MB.',	NULL,	407,	'Občan'),
('13. Ako počítať a zachovávať lehoty?',	'<p>Na počítanie lehôt je rozhodujúci právny stav, ktorý určujú osobitné právne predpisy, resp. či má ísť v konkrétnom konaní o zachovanie procesnoprávnej alebo hmotnoprávnej lehoty. Všeobecne sa hmotnoprávna lehota považuje za zachovanú, pokiaľ je adresátovi určitý úkon v stanovenej lehote aj reálne doručený. Na zachovanie procesnoprávnej lehoty postačí, ak sa posledný deň lehoty podanie odovzdá orgánu, ktorý má povinnosť ho doručiť (napr. pošta). </p>

<p>Potvrdenie o  odoslaní v zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180401#paragraf-25.odsek-1">§ 25 ods. 1</a> zákona o e-Governmente má význam najmä z pohľadu počítania a zachovávania procesnoprávnych lehôt. Elektronické podanie je podané jeho odoslaním do elektronickej schránky orgánu verejnej moci. Na účely preukázania momentu odoslania sa použijú údaje z potvrdenia podľa <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180401#paragraf-5.odsek-8">§ 5 ods. 8</a> zákona o e-Governmente. V súčasnosti sa toto potvrdenie vyhotovuje automatizovane, do 31. mája 2018 sa vyhotovovalo individuálne na požiadanie odosielateľa.<p>

<p>Z pohľadu počítania a zachovávania hmotnoprávnych lehôt je rozhodujúce, kedy prišlo k doručeniu podania. V zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180401#paragraf-32.odsek-5">§ 32 ods. 5</a> zákona o e-Governmente sa elektronická úradná správa, vrátane všetkých elektronických dokumentov, považuje za doručenú,</p>

<ul>
<li>ak je adresátom orgán verejnej moci, uložením elektronickej úradnej správy (okamih, odkedy je elektronická úradná správa objektívne dostupná v elektronickej schránke adresáta),</li>
<li>ak nie je adresátom orgán verejnej moci a doručuje sa do vlastných rúk, dňom, hodinou, minútou a sekundou uvedenými na elektronickej doručenke alebo márnym uplynutím úložnej lehoty podľa toho, ktorá skutočnosť nastane skôr, a to aj vtedy, ak sa adresát o tom nedozvedel,</li>
<li>ak nie je adresátom orgán verejnej moci a nedoručuje sa do vlastných rúk, deň bezprostredne nasledujúci po uložení elektronickej úradnej správy.</li>
</ul>',	NULL,	408,	'Občan'),
('14. Aké sú požiadavky na názvy súborov pripájaných do elektronických podaní alebo do elektronických úradných dokumentov? ',	'Odporúčanou požiadavkou je nepoužívať v názvoch súborov špeciálne znaky ako „/“, „\“, „:“, „*“, „”, “|”, „?“, „!“, „NULL“ a podobne. Odporúča sa skracovať názvy súborov na dĺžku do 64 znakov. ',	NULL,	409,	'Občan'),
('15. Ako otvoriť súbor bez prípony, ktorý sa nachádza v ASiC alebo v elektronickej správe? ',	'<p>V grafickom rozhraní elektronickej schránky na Ústrednom portáli verejnej správy sa automaticky dopĺňa v názve súboru prípona pre tie súbory, ktoré nemajú v názve príponu alebo majú uvedenú nesprávnu príponu. Prípona sa dopĺňa podľa princípov uvedených v <a href="https://www.slovensko.sk/sk/o-portali/technicke-informacie-o-upvs">technických informáciách o funkčnosti portálu</a>.</p>

<p>V prípade využitia aplikácie D.Viewer na otváranie alebo ukladanie podpísaného súboru bez prípony sa automaticky dopĺňa prípona súboru len pre základné formáty súborov na základe hodnoty mimetype.</p>

<p>Pravidlá technickej funkčnosti elektronickej schránky sú uvedené v dokumente <a href="https://www.slovensko.sk/_img/CMS4/eDESK/Dokumentacia_funkcnosti_eDesk.pdf">Dokumentácia funkčnosti elektronickej schránky</a> [.pdf, 494.9 kB]</p>',	NULL,	410,	'Občan'),
('1. Čo je to elektronická identifikačná karta?',	'Elektronická identifikačná karta predstavuje občiansky preukaz s elektronickým čipom (ďalej len „eID“), doklad o povolení na pobyt s elektronickým čipom (ďalej len „eDoPP“) alebo alternatívny autentifikátor (ďalej len „AA“).  Nový zákon o občianskych preukazoch č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2019/395/">395/2019 Z. z.</a> umožňuje vydávať eID  aj ako elektronický  doklad <a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_vybavujem-obciansky-preukaz-s/#beztvare">bez podoby tváre</a> a podpisu držiteľa pre potreby elektronického zdravotníctva.',	NULL,	411,	'Občan'),
('2. Ako vyzerá občiansky preukaz s čipom?',	'Jednotlivé typy elektronických identifikačných kariet sú zobrazené na nasledovných obrázkoch. Na zadnej strane kariet je umiestnený elektronický kontaktný čip.

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/eid_vzor.jpg">
  <br>Obrázok 1 - Vzor občianskeho preukazu s elektronickým čipom (eID)</br>
</picture></p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/edopp_vzor.png">
  <br>Obrázok 2 - Vzor povolenia na pobyt s elektronickým čipom (eDoPP)</br>
</picture></p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/aa_vzor.jpg">
  <br>Obrázok 3 - Vzor alternatívneho autentifikátora (AA)</br>
</picture></p>',	NULL,	412,	'Občan'),
('3. Aké sú základné zásady bezpečnosti používania eID karty?',	'Zásady bezpečného používania eID karty:

<ul>
<li>svoju eID kartu si ukladajte na bezpečné miesta mimo dosahu iných osôb,</li>

<li>nikdy svoju eID kartu nedovoľte používať iným ľuďom,</li>

<li>zabezpečte, aby vaše bezpečnostné kódy zostali pre ostatných utajené. Neprezrádzajte ich a pokiaľ ich potrebujete mať zapísané, zápis nikdy neuchovávajte spolu s eID kartou.</li>

<li>bezpečnostné kódy sú len vaše tajomstvo, takže ich v žiadnom prípade nikde neoznamujte, aj keď vás o to požiadajú,</li>

<li>pri strate, odcudzení alebo podozrení z možného zneužitia eID karty ihneď informujte políciu a zabezpečte zrušenie uložených certifikátov buď pri osobnej návšteve pracoviska dokladov a evidencií na okresnom riaditeľstve Policajného zboru, alebo prostredníctvom na tento účel zverejnenej eGovernment služby.</li>
</ul>',	NULL,	413,	'Občan'),
('4. Ako je možné získať novú elektronickú identifikačnú kartu (eID)?',	'Žiadosť o vydanie eID je možné podať na ktoromkoľvek Okresnom riaditeľstve Policajného zboru (platí len pre OP vo formáte ID1, ktorých vydávanie začalo 01.07.2008), viac informácií nájdete na stránke <a href="https://www.minv.sk/?obcianske-preukazy">Ministerstva vnútra SR</a>. Pracovníci môžu prísť aj s mobilnými pracoviskami za občanmi, ktorí žiadosť napr. pre bezvládnosť nemôžu podať osobne.

<p>Žiadosť o doklad o povolení na pobyt s elektronickým čipom je možné podať na oddeleniach cudzineckej polície Policajného zboru, viac informácií na stránke <a href="https://www.minv.sk/?kontakt-na-oddelenia-cudzineckej-policie-pz">Ministerstva vnútra SR</a>.</p>

<p>Žiadosť o alternatívny autentifikátor je možné podať na vybraných Okresných riaditeľstvách Policajného zboru a oddeleniach cudzineckej polície Policajného zboru, viac informácií na stránke <a href="https://www.minv.sk/?alternativne-autentifikatory">Ministerstva vnútra SR</a>.</p>',	NULL,	414,	'Občan'),
('5. Prečo je elektronická identifikačná karta vybavená elektronickým čipom?',	'Elektronický čip zásadne rozširuje možnosti použitia občianskeho preukazu. Pri identifikačnom doklade bez elektronického čipu je nutný osobný kontakt pri preukazovaní totožnosti držiteľa s verejnými alebo komerčnými inštitúciami. eID s elektronickým čipom rozširuje toto použitie aj na elektronickú komunikáciu prostredníctvom Internetu. Na čipe eID sú uložené identifikačné údaje občana. Taktiež vďaka elektronickému čipu bude eID slúžiť aj ako prostriedok pre vytváranie kvalifikovaného elektronického podpisu (KEP).',	NULL,	415,	'Občan'),
('6. Čo je bezpečnostný osobný kód (BOK)?',	'BOK kód je bezpečnostný osobný kód, ktorý spolu s elektronickou identifikačnou kartou slúži na potvrdenie totožnosti držiteľa karty pri elektronickej komunikácii s informačnými systémami orgánov verejnej správy, alebo s inými fyzickými osobami či právnickými osobami. <b>BOK kód sa neprideľuje dokladom</b> bez fotografie a podpisu držiteľa, ktoré slúžia pre potreby elektronického zdravotníctva.

<p>Viac informácií nájdete v článku <a href="https://www.slovensko.sk/sk/faq/_obciansky-preukaz-s-cipom-do#dolezite">Občiansky preukaz s čipom - doplňujúce najčastejšie otázky a odpovede</a>.</p>',	NULL,	416,	'Občan'),
('7. Čo má držiteľ elektronickej identifikačnej karty robiť, keď kartu stratí alebo mu je odcudzená? Môže byť elektronická identifikačná karta zneužitá?',	'V prípade straty alebo odcudzenia elektronickej identifikačnej karty je nutné stratu alebo odcudzenie okamžite nahlásiť na najbližšom Okresnom riaditeľstve Policajného zboru alebo prostredníctvom k tomu určenej <a href="https://portal.minv.sk/wps/wcm/connect/sk/site/main/zivotne-situacie/menu-doklady/strata_odcudzenie_obciansky_preukaz_s_cipom/">elektronickej služby</a> (ak ste pred stratou alebo odcudzením mali <a href="https://portal.minv.sk/wps/wcm/connect/sk/site/main/zivotne-situacie/menu-doklady/do-modifikacia/">zadefinovaný diskrétny údaj</a>).

<p>Zneužitie elektronickej identifikačnej karty nie je možné, keďže na jej použitie v elektronickom styku je potrebná znalosť bezpečnostného osobného kódu (BOK), resp. KEP PIN v prípade KEP. Nahlásením straty je pre daný doklad automaticky zrušená možnosť elektronickej identifikácie pri internetovej komunikácii s verejnou správou.</p>

<p>V prípade, že je na elektronickej identifikačnej karte uložený kvalifikovaný certifikát pre vyhotovenie kvalifikovaného elektronického podpisu (KEP), o jeho zrušenie musí držiteľ požiadať certifikačnú autoritu, ktorá mu certifikát vydala. Inštrukcie, ako tak môže spraviť, získa od príslušného pracovníka pri podaní žiadosti o vydanie kvalifikovaného certifikátu na Okresnom riaditeľstve Policajného zboru.</p>',	NULL,	417,	'Občan'),
('8. Aký je účel elektronickej identifikačnej karty?',	'Zavedenie elektronickej identifikačnej karty súvisí s postupným procesom elektronizácie služieb verejnej správy. Elektronická identifikačná karta slúži ako bezpečné médium pre uloženie identifikačných údajov občana, ako aj na elektronickú identifikáciu a autentifikáciu občana pri používaní elektronických služieb verejnej správy. Elektronická identifikačná karta bude taktiež slúžiť ako prostriedok pre vytváranie kvalifikovaného elektronického podpisu, ktorý bude v elektronickej komunikácii občana s verejnou správou plniť ekvivalentnú úlohu ako ručne vytvorený podpis využívaný v neelektronickom styku s ňou.',	NULL,	418,	'Občan'),
('9. Aké možnosti použitia poskytuje elektronická identifikačná karta?',	'Elektronická identifikačná karta slúži na preukazovanie totožnosti pri osobnom styku s úradmi a inštitúciami, avšak poskytuje aj možnosť preukazovania totožnosti v elektronickom prostredí. Funkcia preukazovania totožnosti držiteľa je základná a nevyhnutná funkcia pri používaní elektronických služieb, či už vo verejnom alebo v súkromnom sektore. Medzi elektronické služby vo verejnom sektore patria napríklad: nahlasovanie zmien; podávanie žiadostí, sťažností, žalôb; aukcie, verejné obstarávanie; služby katastra; služby daňového úradu; eZdravie a podobne.',	NULL,	419,	'Občan'),
('10. Čo je Online eID Funkcia?',	'Online eID funkciu elektronickej identifikačnej karty môže použiť jej držiteľ na dôveryhodné preukázanie svojej totožnosti (autentifikáciu) pri prístupe k elektronickým službám. Funkcia sa aktivuje zadaním BOK kódu pri podaní žiadosti o vydanie elektronickej identifikačnej karty. Elektronické služby budú zo začiatku zahŕňať len eGovernment služby verejnej správy. Neskôr budú zahrnuté aj on-line služby ponúkané súkromnými spoločnosťami, ako služby bánk a podobne. Je predpoklad, že pre stále viac a viac poskytovateľov internetových služieb, ktorí ponúkajú individuálne služby, bude používanie online eID funkcie oveľa jednoduchšie, bezpečnejšie a pohodlnejšie ako alternatívne metódy na identifikáciu a autentifikáciu používateľa.',	NULL,	420,	'Občan'),
('11. Ako funguje Online eID Funkcia?',	'Princíp bude vysvetlený na príklade prihlásenia sa na stránky portálu elektronických služieb Ministerstva vnútra Slovenskej republiky.

<p>Na stránke portálu si držiteľ elektronickej identifikačnej karty vyberie možnosť prihlásenia. Stránka portálu ho presmeruje na eID autentifikačný systém (ďalej len „AS-C“), ktorý sa cez bezpečný šifrovaný kanál pripojí na elektronickú identifikačnú kartu. Následne bude držiteľ vyzvaný zadať BOK. Po zadaní BOK AS-C overí pomocou bezpečných šifrovacích algoritmov, že použitá karta je platná (tzn. nebola stratená, odcudzená, klonovaná a jej údaje neboli pozmenené) a prečíta z nej držiteľovu identitu. Potom AS-C vystaví dočasné potvrdenie o vykonaní elektronickej identifikácie, ktorý prehliadač držiteľa zašle na portál elektronických služieb Ministerstva vnútra Slovenskej republiky. Toto potvrdenie je takisto zabezpečené šifrovacími prostriedkami pred zneužitím. Portál z potvrdenia o elektronickej identifikácii zistí identitu držiteľa a umožní mu prístup k poskytovaným elektronickým službám.</p>',	NULL,	421,	'Občan'),
('12. Aké technické vybavenie je potrebné na používanie online eID funkcie?',	'Držiteľ potrebuje elektronickú identifikačnú kartu, príslušné softvérové vybavenie a kontaktnú čítačku čipových kariet pripojenú k svojmu počítaču. Softvérové vybavenie (Aplikácia pre eID) k elektronickej identifikačnej karte je zverejnené v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a> alebo na <a href="https://eidas.minv.sk/download/Aplikacia_EID/">internetovom portáli Ministerstva vnútra Slovenskej republiky</a>.',	NULL,	422,	'Občan'),
('13. Aké čítačky kontaktných čipových kariet môže občan používať? Existujú odporúčania?',	'<style>
table, th, td {
  border:1px solid black;
}
</style>
<body>

<p>S elektronickou identifikačnou kartou možno používať akúkoľvek čítačku, ktorá spĺňa nasledujúce parametre:</p>

<table style="width:50%">
  <tr>
    <td><b>Štandard</b></td>
    <td>ISO 7816</td>
  </tr>
  <tr>
    <td><b>Rozhranie do PC</b></td>
    <td>USB CCID</td>
  </tr>
  <tr>
    <td><b>Napájanie</b></td>
    <td>Z USB</td>
  </tr>
  <tr>
    <td><b>Protokol komunikácie s čipom</b></td>
    <td>T=0, T=1</td>
  </tr>
  <tr>
    <td><b>Veľkosť karty</b></td>
    <td>ID-1</td>
  </tr>
  <tr>
    <td><b>Rýchlosť komunikácie s čipom</b></td>
    <td>Čítačka musí podporovať rýchlosť 115,2 kbaud</td>
  </tr>
  <tr>
    <td><b>Frekvencia hodín čipu</b></td>
    <td>Čítačka musí podporovať frekvenciu 3,5 MHz</td>
  </tr>
  <tr>
    <td><b>Typy čipových kariet</b></td>
    <td>5V, 3V a 1.8V (ISO 7816 Class A, B and C)</td>
  </tr>
  <tr>
    <td><b>Rozhranie</b></td>
    <td>PC / SC</td>
  </tr>
  <tr>
    <td><b>PC / SC pre OS</b></td>
    <td>Windows XP/Vista/7/8/10, Linux, Mac OS X (32/64 bit)</td>
  </tr>
</table>

<p>Väčšina dnes predávaných čítačiek uvedené parametre spĺňa. Ideálne je, aby čítačka mala aj certifikáty konformity a bezpečnosti, napr.:</p>

<table style="width:50%">
  <tr>
    <td><b>Konformita a certifikáty</b></td>
    <td>Microsoft WHQL, EMV 2000 Level 1, ISO 7816, HBCI4, USB 2.0 (kompatibilita s USB 1.1), CCID, GSA FIPS 201 approved product list</td>
  </tr>
  <tr>
    <td><b>Bezpečnosť zariadenia</b></td>
    <td>CE, WEEE, FCC, UL, VCCI, MIC, RoHS</td>
  </tr>
</table>',	NULL,	423,	'Občan'),
('15. Čo je KEP PIN?',	'edným z bezpečnostných hľadísk vytvárania KEP je aj to, že sa pri ňom uplatňuje tzv. dvojfaktorová autentizácia, t. j. že občan vytvárajúci KEP niečo vlastní (elektronickú identifikačnú kartu so súkromným kľúčom) a niečo pozná (KEP PIN). Bez týchto dvoch faktorov nie je možné vytvoriť KEP. KEP PIN je teda bezpečnostná ochrana pred vytvorením KEP neoprávnenou osobou.',	NULL,	442,	'Občan'),
('15. Čo je softvérové vybavenie pre elektronickú identifikačnú kartu?',	'<p>Softvérové vybavenie pre elektronickú identifikačnú kartu zabezpečuje riadenie procesu elektronickej identifikácie a poskytuje štandardné programovacie rozhrania umožňujúce iným aplikáciám integrovať sa na funkcie karty ako napr. aplikácii pre vytváranie kvalifikovaného elektronického podpisu umožňuje komunikovať s príslušnými KEP funkciami na karte.</p>

<p>Elektronická identifikácia občana v elektronickom styku s použitím online eID funkcie je zabezpečovaná Aplikáciou pre eID. Aplikácia počas priebehu elektronickej identifikácie zabezpečuje interakciu s používateľom a umožňuje AS-C komunikovať na diaľku s elektronickou identifikačnou kartou.</p>

<p>Prostredníctvom Aplikácie pre eID je možné vykonať aj zmenu BOK kódu, resp. KEP PIN a KEP PUK.</p>',	NULL,	425,	'Občan'),
('16. Ako si nainštalujem softvérové vybavenie určené pre eID?',	'Z <a href="https://eidas.minv.sk/download/Aplikacia_EID/">internetového portálu Ministerstva vnútra Slovenskej republiky</a> je potrebné stiahnuť inštalačný balíček Aplikácie pre eID a inštalačnú príručku pre požadovaný operačný systém a postupovať podľa inštrukcií v príručke.',	NULL,	426,	'Občan'),
('17. Občiansky preukaz s čipom - doplňujúce najčastejšie otázky a odpovede',	'Pokiaľ ste v predchádzajúcom článku nenašli riešenie svojho problému týkajúceho sa elektronických schránok, vypracovali sme pre vás doplňujúce <a href="https://www.slovensko.sk/sk/faq/_obciansky-preukaz-s-cipom-do">otázky a odpovede</a>, v ktorých nájdete bližšie informácie.',	NULL,	427,	'Občan'),
('1. Čo je to <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> a aký je jeho účel?',	'<a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">Kvalifikovaný elektronický podpis</a> (ďalej len „KEP“) je informácia pripojená alebo inak logicky spojená s elektronickým dokumentom, ktorá za splnenia podmienok daných zákonom <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2016/272/20190801">č. 272/2016 Z. z. o dôveryhodných službách</a>, umožňuje spoľahlivo a jednoznačne určiť fyzickú osobu, ktorá ho vyhotovila. Pomocou KEP je možné elektronicky realizovať právne úkony, ktoré v papierovom svete vyžadujú písomnú formu (<a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/1964/40/20190130#paragraf-40.odsek-4">§ 40 ods. 4 zákona č. 40/1964 Z. z. Občiansky zákonník</a>), t. j. KEP v tomto prípade nahrádza písomnú podobu vlastnoručného podpisu. Z uvedeného dôvodu je nevyhnutné jeho použitie pri niektorých úkonoch uskutočňovaných v rámci elektronickej komunikácie s orgánmi verejnej moci a komerčným sektorom. KEP elektronického dokumentu zabezpečuje:

<ul>
<li>autenticitu – možno jednoznačne overiť identitu subjektu, ktorý podpis vytvoril*;</li>
<li>integritu – možno preukázať, že po podpísaní dokumentu nedošlo k žiadnej úmyselnej alebo neúmyselnej zmene obsahu dokumentu, aký bol v čase jeho podpisovania;</li>
<li>nepopierateľnosť – autor nemôže tvrdiť, že nevyhotovil daný podpis elektronického dokumentu.</li>
</ul>

<p>* kvalifikovaný certifikát pre elektronický podpis musí obsahovať meno a priezvisko osoby alebo pseudonym, pričom v prípade pseudonymu musí byť jasne uvedené, že ide o pseudonym; certifikát môže tiež obsahovať nepovinné údaje, pričom v SR sa obvykle uvádza rodné číslo osoby alebo číslo identifikačnej karty. Mandátny kvalifikovaný certifikát pre elektronický podpis musí obsahovať aj údaje o mandantovi a mandáte.</p>

<p>Viac informácií o platnosti podpisového certifikátu elektronického podpisu/elektronickej pečate alebo časovej pečiatky nájdete v súvisiacom článku „<a href="https://www.slovensko.sk/sk/faq/_najcastejsie-otazky-a-odpovede#platnost">Najčastejšie otázky a odpovede</a>".</p>',	NULL,	428,	'Občan'),
('2. Kde všade je v súčasnej dobe možné využiť <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> (KEP)?',	'Občan môže použiť KEP pri komunikácii s orgánmi verejnej moci prostredníctvo <a href="https://www.slovensko.sk/sk/titulna-stranka">ústredného portálu verejnej správy</a> formou univerzálneho podania pre rôzne subjekty (notári, exekútori, organizácie štátnej správy, katastrálne úrady atď.), pri komunikácii napr. s OR SR a JKM - Služby živnostenského registra. Ďalej je možné KEP použiť pri komunikácii napr. s finančnou správou Slovenskej republiky, pri komunikácii so súdmi atď.',	NULL,	429,	'Občan'),
('3. Aké sú podmienky vyhotovenia kvalifikovaného elektronického podpisu (KEP)?',	'Na vyhotovenie KEP musí mať občan k dispozícii:

<ul>
<li>elektronický dokument,</li>
<li><a href="https://www.slovensko.sk/sk/slovnik/detail/_sukromny-kluc">súkromný kľúč</a> uložený na kvalifikovanom zariadení na vyhotovenie kvalifikovaného elektronického podpisu (<a href="https://ec.europa.eu/futurium/en/content/compilation-member-states-notification-sscds-and-qscds.html">zoznam kvalifikovaných zariadení</a>),</li>
<li>kvalifikovaný certifikát vydaný poskytovateľom dôveryhodných služieb pre <a href="https://www.slovensko.sk/sk/slovnik/detail/_verejny-kluc">verejný kľúč</a> patriaci k súkromnému kľúču,</li>
<li>prostriedok a príslušné softvérové vybavenie na vyhotovenie kvalifikovaného elektronického podpisu, pričom sa odporúča používať certifikované softvérové vybavenie resp. softvérové vybavenie z dôveryhodných zdrojov.</li>
</ul>',	NULL,	430,	'Občan'),
('4. Môže občan získať <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> (KEP) uložený na elektronickej identifikačnej karte?',	'Nie, KEP nie je možné získať. KEP sa dá len vytvoriť prostredníctvom nástrojov na jeho vytváranie (<a href="https://www.slovensko.sk/sk/slovnik/detail/_sukromny-kluc">súkromný kľúč</a>, podpisová aplikácia). Je to podobné ako u písomnej formy podpisu, ktorá vyžaduje nosič (napr. papier) a nástroj na jeho vytvorenie (napr. pero). Získať je možné len kvalifikovaný certifikát pre elektronický podpis vydaný na verejný kľuč patriaci k súkromnému kľúču, ktorý je uložený v elektronickej identifikačnej karte.',	NULL,	431,	'Občan'),
('5. Čo je kvalifikovaný certifikát pre elektronický podpis?',	'<a href="https://www.slovensko.sk/sk/slovnik/detail/_kvalifikovany-certifikat">Kvalifikovaný certifikát</a> pre elektronický podpis je elektronický dokument, ktorým vydavateľ certifikátu potvrdzuje, že v certifikáte uvedený <a href="https://www.slovensko.sk/sk/slovnik/detail/_verejny-kluc">verejný kľúč</a> patrí osobe, ktorej je certifikát vydaný (držiteľ certifikátu). Vydávať kvalifikované certifikáty môže len <a href="https://www.slovensko.sk/sk/slovnik/detail/_kvalifikovany-certifikat">kvalifikovaný poskytovateľ dôveryhodných služieb</a>.',	NULL,	432,	'Občan'),
('6. Čo je súkromný a <a href="https://www.slovensko.sk/sk/slovnik/detail/_verejny-kluc">verejný kľúč</a>?',	'<a href="https://www.slovensko.sk/sk/slovnik/detail/_sukromny-kluc">Súkromný kľúč</a> je tajná informácia, ktorá slúži na vyhotovenie elektronického podpisu alebo kvalifikovaného elektronického podpisu elektronického dokumentu. <a href="https://www.slovensko.sk/sk/slovnik/detail/_verejny-kluc">Verejný kľúč</a> je informácia dostupná overovateľovi, ktorá slúži na overenie správnosti elektronického podpisu alebo kvalifikovaného elektronického podpisu vyhotoveného pomocou súkromného kľúča patriaceho k danému verejnému kľúču. Súkromný a <a href="https://www.slovensko.sk/sk/slovnik/detail/_verejny-kluc">verejný kľúč</a> sú kryptograficky previazané a preto spolu tvoria kľúčový pár. Sú to pojmy spojené s asymetrickou kryptografiou, ktorá tvorí základ vytvárania elektronického podpisu.',	NULL,	433,	'Občan'),
('7. Ako súvisí elektronická identifikačná karta s kvalifikovaným elektronickým podpisom (KEP)?',	'Elektronická identifikačná karta je bezpečným prostriedkom na uloženie kryptografických kľúčov (súkromný, verejný) a kvalifikovaného certifikátu pre elektronický podpis určených na vytváranie KEP. Kľúče a certifikát sú uložené v pamäti čipu elektronickej identifikačnej karty, kde <a href="https://www.slovensko.sk/sk/slovnik/detail/_sukromny-kluc">súkromný kľúč</a> nie je možné žiadnym spôsobom vyexportovať, t. j. existuje len v jedinom vyhotovení v konkrétnej elektronickej identifikačnej karte.',	NULL,	434,	'Občan'),
('8. Ako môže občan získať kvalifikovaný certifikát nevyhnutný k vytváraniu kvalifikovaného elektronického podpisu?',	'Občan môže požiadať o vydanie kvalifikovaného certifikátu pre elektronický podpis na Okresnom riaditeľstve Policajného zboru pri preberaní eID alebo kedykoľvek neskôr.
Cudzinec môže požiadať o vydanie kvalifikovaného certifikátu pre elektronický podpis na oddelení cudzineckej polície Policajného zboru pri preberaní eDoPP alebo kedykoľvek neskôr.
Vydať kvalifikovaný certifikát pre elektronický podpis na občiansky preukaz alebo doklad o pobyte s elektronickým čipom je možné aj z pohodlia domova prostredníctvom Aplikácie pre eID, ktorá je spolu s používateľskou príručkou k dispozícii na <a href="https://eidas.minv.sk/download/Aplikacia_EID/">internetovom portáli Ministerstva vnútra Slovenskej republiky</a> alebo v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.',	NULL,	435,	'Občan'),
('9. Koľko stojí kvalifikovaný certifikát pre <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elek',	'Vydanie kvalifikovaného certifikátu pre elektronický podpis na občiansky preukaz s čipom alebo doklad o pobyte cudzinca na klientskom centre alebo vzdialeným vydaním prostredníctvom Aplikácie pre eID je <b>bezplatné</b>. V prípade vydania kvalifikovaných certifikátov na iné zariadenia (napr. iné čipové karty, tokeny) rôznymi komerčnými poskytovateľmi dôveryhodných služieb je takáto služba obvykle spoplatnená.

<p>Platnosť kvalifikovaného certifikátu môže byť ukončená (revokovaná) pred uplynutím doby platnosti zrušením certifikátu (<a href="https://www.slovensko.sk/sk/faq/faq-zep/#ako25">viď. otázka k zrušeniu certifikátu</a>).</p>

Kvalifikované certifikáty pre elektronické podpisy (vydané SVK eID ACA) na slovenské doklady sa vydávali s platnosťou 5 rokov a 1 mesiac (61 mesiacov). <b>Od 27. mája 2021</b> sa vydávajú už len s platnosťou <b>do 30. decembra 2022</b> z dôvodu, že sa v tento deň skončí aj certifikácia elektronických čipov pôvodných občianskych preukazov a dokladov o pobyte. Po uvedenom termíne budú zároveň hromadne zrušené (revokované) všetky kvalifikované certifikáty s dlhšou dobou platnosti, ktoré boli vydané na občianske preukazy alebo doklady o pobyte s pôvodnými elektronickými čipmi.

<p>Ministerstvo vnútra SR bude <b>od 21. júna 2021</b> vydávať občianske preukazy s novými elektronickými čipmi, na ktoré sa budú nahrávať aj nové kvalifikované certifikáty k elektronickým podpisom (vydané SVK eID ACA2) s koncom platnosti <b>17. júna 2025</b>. Ide o rovnaký dátum, kedy sa zároveň skončí aj platnosť certifikácie elektronických čipov týchto nových občianskych preukazov.</p>

<p><b><i>Upozornenie:</i></b></p>

<i><u>Koniec, resp. zrušenie platnosti kvalifikovaného certifikátu neznamená koniec platnosti funkcie prihlasovania sa na ústredný portál alebo špecializované portály</u>. Neznamená ani koniec platnosti PCA a SCA certifikátov, ktoré však nie sú použiteľné na podpisovanie podaní a príloh. Týmito certifikátmi sa môže vytvoriť iba zdokonalený elektronický podpis, ktorý v Slovenskej republike nemá právne silu, ale v zmysle nariadenia o <a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> je to použiteľný formát, ktorý môžu akceptovať iné členské štáty EÚ, ak takúto úroveň zabezpečenia povoľujú.

<p>Ak osoba teda nemá vydaný platný kvalifikovaný certifikát k elektronickému podpisu <b>do 25. júna 2021</b> a chce podpisovať, musí požiadať o vydanie certifikátov na pôvodný preukaz do tohto termínu (s platnosťou certifikátov do konca roka 2022) alebo požiadať o vydanie občianskeho preukazu s novým elektronickým čipom (s platnosťou certifikátov do roku 2025).</p>

<p>Ak osoba má vydaný platný kvalifikovaný certifikát k elektronickému podpisu <b>do 25. júna 2021</b>,  na občianskom preukaze (vydanom pred 21. júnom 2021) sa bude môcť používať až do konca roka 2022 a občianskym preukazom s novým elektronickým čipom stačí disponovať až po tomto termíne.</p></i>',	NULL,	436,	'Občan'),
('10. Čo Aplikácia pre eID overuje?',	'Nasledovné informácie sa týkajú občianskych preukazov s elektronickými čipmi a dokladov o pobyte s elektronickými čipmi.

<p><b>Aplikácia pre eID (verzie 3.6 a 3.6 Update 1)</b> overuje po vložení eID do čítačky čipových kariet:</p>

<ul>
<li><b>exspiráciu certifikátov na eID karte</b> – v prípade potvrdenia ponúkne aplikácia používateľovi obnovu platnosti certifikátov,</li>
<li><b>blížiacu sa exspiráciu certifikátov na eID karte</b> (do 30 dní) – v prípade potvrdenia ponúkne aplikácia používateľovi obnovu platnosti certifikátov.</li>
</ul>

<p>V prípade vloženia starších eID kariet (s CardOS 5.0) do čítačky si aplikácia pre načítanie certifikátov vyžiada zadanie bezpečnostného osobného kódu (BOK). V prípade novších eID kariet (s CardOS 5.4) sa zadanie BOK nevyžaduje.</p>

<p>Ak na eID karte nie sú certifikáty vydané, neponúkne sa možnosť ich vydania. Nahratie certifikátov je možné zrealizovať manuálne prostredníctvom možnosti „<b>Vydať certifikáty</b>“ z kontextového menu aplikácie.<p>

<p><b>Aplikácia pre eID (verzie 3.4 a staršie)</b> overuje po vložení eID (len staršie eID s CardOS 5.0) a zadaní bezpečnostného osobného kódu (BOK):</p>

<ul>
<li><b>prítomnosť vydaných certifikátov na eID karte</b> – v prípade absencie certifikátov ponúkne aplikácia používateľovi možnosť ich vydania,</li>
<li><b>exspiráciu certifikátov na eID karte</b> – v prípade potvrdenia ponúkne aplikácia používateľovi obnovu certifikátov,</li>
<li><b>blížiacu sa exspiráciu certifikátov na eID karte</b> (do 30 dní) – v prípade potvrdenia ponúkne aplikácia používateľovi obnovu certifikátov,</li>
<li><b>preverenie prítomnosti starých certifikátov</b> (2048bit) – v prípade potvrdenia ponúkne aplikácia používateľovi obnovu certifikátov.</li>
</ul>

<p><b>Poznámka:</b> od 26. júna.2021 už nie je možné vydať nové certifikáty na eID karty s CardOS 5.0, už vydané certifikáty na kartách s CardOS 5.0 sú platné do 31. decembra 2022, resp. do termínu ukončenia ich platnosti, podľa toho, čo nastane skôr.</p>

<p><b>Upozornenie:</b> Aplikácia pre eID <b>neoveruje</b>, či je certifikát na eID karte zrušený (revokovaný). Overenie je možné vykonať prostredníctvom <a href="https://portal.minv.sk/wps/wcm/connect/sk/site/main/zivotne-situacie/menu-doklady/info_zoznam+certifikatov/">služby Ministerstva vnútra SR</a>.</p>',	NULL,	437,	'Občan'),
('11. Môže si občan obnoviť svoj kvalifikovaný certifikát uložený na občianskom preukaze prostredníctvom elektronickej služby cez Internet?',	'Áno, občan si bude môcť najskôr  30 dní pred ukončením platnosti prvého kvalifikovaného certifikátu požiadať o vydanie nového prostredníctvom služby e-Governmentu dostupnej na Internete alebo kedykoľvek po vypršaní platnosti kvalifikovaného certifikátu osobne na ktoromkoľvek oddelení dokladov Policajného zboru.

<p>Vydať ďalší kvalifikovaný certifikát pre elektronický podpis na občiansky preukaz alebo doklad o pobyte s elektronickým čipom je možné aj z pohodlia domova prostredníctvom Aplikácie pre eID.</p>',	NULL,	438,	'Občan'),
('12. Ako môže občan využiť <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a>?',	'KEP-om môže občan podpisovať elektronické dokumenty pri komunikácii s orgánmi verejnej moci a komerčnými subjektmi, pričom tak môže spraviť buď priamo na k tomu určených webových stránkach dostupných cez Internet alebo offline pomocou softvérových prostriedkov inštalovaných na počítači občana. Nie je teda potrebná osobná návšteva danej inštitúcie.',	NULL,	439,	'Občan'),
('13. Čo je potrebné k tomu, aby občan mohol vytvárať <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> pomocou občianskeho preukazu?',	'Na vytváranie KEP prostredníctvom elektronickej identifikačnej karty musia byť splnené nasledovné podmienky:

<ul>
<li>eID alebo eDoPP s platným kvalifikovaným certifikátom pre elektronický podpis uloženým na čipe;</li>
<li>počítač vybavený:</li>
<ul>
<li>kontaktnou čítačkou čipový kariet a príslušnými ovládačmi,</li>
<li>softvérovým vybavením pre eID,</li>
<li>aplikáciou pre vytváranie KEP;</li>
<li>znalosť BOK a KEP PIN.</li>
</ul>
</ul>

V prípade vytvárania KEP pri online komunikácii so službami verejnej moci musí byť počítač občana navyše vybavený:

<ul>
<li>pripojením do internetu,</li>
<li>internetovým prehliadačom s nainštalovanou aplikáciou pre vytváranie KEP.</li>
</ul>',	NULL,	440,	'Občan'),
('14. Kde môže občan získať softvérové vybavenie?',	'Kompletné softvérové vybavenie potrebné k vytváraniu KEP prostredníctvom elektronickej identifikačnej karty je dostupné na <a href="https://eidas.minv.sk/download/Aplikacia_EID/">internetovom portáli Ministerstva vnútra Slovenskej republiky</a> a na Ústrednom portáli verejnej správy v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.',	NULL,	441,	'Občan'),
('17. Aké sú dĺžky KEP PIN  a KEP PUK a koľko pokusov mám pred zablokovaním?',	'Dĺžka KEP PIN je šesť (6) číselných znakov a KEP PUK je osem (8) číselných znakov. K zablokovaniu KEP PIN dôjde po treťom (3) nesprávne zadanom kóde. Počet nesprávne zadaných hodnôt sa počíta priamo v karte, takže nie je možné ho ovplyvniť vytiahnutím karty z čítačky alebo vypnutím počítača. Vynulovanie počítadla nesprávne zadaných hodnôt je možné len zadaním správnej hodnoty. Ak je KEP PIN zablokovaný, odblokovanie je možné len KEP PUK-om. KEP PUK sa zablokuje po desiatich (10) nesprávne zadaných hodnotách.',	NULL,	444,	'Občan'),
('18. Kedy si volím hodnoty pre bezpečnostný osobný kód, KEP PIN a KEP PUK?',	'KEP PIN a KEP PUK si občan volí v procese prvého vydania kvalifikovaného certifikátu pre elektronický podpis na elektronickú identifikačnú kartu.',	NULL,	445,	'Občan'),
('19. Aké bezpečnostné kódy je potrebné zadať pri vytváraní kvalifikovaného elektronického podpisu?',	'Po vložení elektronickej identifikačnej karty do čítačky čipových kariet je nutné zadať BOK. Následne pri vytváraní KEP sa musí zadať KEP PIN.',	NULL,	446,	'Občan'),
('20. Čo sa stane po zablokovaní KEP PIN-u?',	'Po zablokovaní KEP PIN sa stane <a href="https://www.slovensko.sk/sk/slovnik/detail/_sukromny-kluc">súkromný kľúč</a> uložený na elektronickej identifikačnej karte a určený na vytváranie KEP nedostupný a KEP nie je možné vytvoriť.',	NULL,	447,	'Občan'),
('21. Ako a kde riešiť zablokovanú funkcionalitu vytvárania kvalifikovaného elektronického podpisu?',	'Zablokovanie funkcionality pre vytváranie KEP na elektronickej identifikačnej karte je možné zablokovaním BOK alebo KEP PIN. V prípade zablokovania BOK sa musí občan dostaviť na Okresné riaditeľstvo Policajného zboru, kde mu bude BOK odblokovaný. Ak máte doklad vydaný po 21. júni 2021, môžete odblokovať BOK pomocou PUK v nastaveniach Aplikácie pre eID v sekcii PIN manažment. V prípade, zablokovania KEP PIN si tento môže občan odblokovať prostredníctvom KEP PUK, pokiaľ si ho pri vydávaní elektronickej identifikačnej karty zvolil. Ak nemá zvolený KEP PUK a zablokuje si KEP PIN, tak odblokovanie funkcionality pre vytváranie KEP bude možné len na Okresnom riaditeľstve Policajného zboru, a to v podobe vydanie nového kvalifikovaného certifikátu pre elektronický podpis. Rovnaká možnosť je aj pri zablokovaní KEP PUK.',	NULL,	448,	'Občan'),
('22. Čo sa stane po zablokovaní KEP PUK-u?',	'Po zablokovaní KEP PUK dôjde k nevratnému zablokovaniu časti karty, kde sú uložené kryptografické kľúče a kvalifikovaný certifikát pre elektronický podpis. Po zablokovaní KEP PUK už nie je možné použiť tam uložené kryptografické kľúče a jediným riešením je obnova celej oblasti karty, ktorá ma za následok stratu dovtedy používaných kľúčov.',	NULL,	449,	'Občan'),
('23. Ako si môžem zmeniť hodnoty KEP PIN a KEP PUK?',	'Zmenu KEP PIN a KEP PUK je možn vykonať cez činnosť PIN manažment v Aplikácii pre eID.',	NULL,	450,	'Občan'),
('24. Ako často môžem meniť KEP PIN a KEP PUK?',	'Hodnoty je možné meniť kedykoľvek bez obmedzenia.',	NULL,	451,	'Občan'),
('25. Čo znamená zrušenie certifikátu?',	'Zrušenie certifikátu sa využíva v prípade, že má občan podozrenie, že iná osoba ako on má k dispozícii jeho elektronickú identifikačnú kartu a môže v jeho mene vytvoriť KEP, napr. pri strate eID alebo jeho krádeži. Zrušenie certifikátu sa využíva aj poskytovateľmi dôveryhodnej služby vydávajúcimi kvalifikované certifikáty napríklad ak exspiruje certifikát kvalifikovaného zariadenia pre uchovávanie privátneho kľúča, príde k oslabeniu používaných algoritmov alebo získa informácie o zmene údajov v certifikáte.',	NULL,	452,	'Občan'),
('26. Ako možno zrušiť certifikát na elektronickej identifikačnej karte?',	'O zrušenie akéhokoľvek certifikátu na elektronickej identifikačnej karte môže občan požiadať pri osobnej návšteve na ktoromkoľvek Okresnom riaditeľstve Policajného zboru alebo prostredníctvom <a href="https://portal.minv.sk/wps/wcm/connect/sk/site/main/zivotne-situacie/menu-doklady/info_zoznam+certifikatov/zoznam_certifikatov_vydanych+na+obcianskom+preukaze+s+cipom">elektronickej služby</a>.

<p>Kvalifikované certifikáty môže zrušiť aj samotný vydavateľ certifikátu (poskytovateľ dôveryhodnej služby) bez žiadosti držiteľa certifikátu, napríklad v prípade, ak platnosť vydaného kvalifikovaného certifikátu presahuje dobu platnosti certifikácie zariadenia (napr. čipovej karty), na ktorú bol vydaný alebo v prípade známeho zníženia jeho bezpečnosti pre použité kryptografické algoritmy.</p>',	NULL,	453,	'Občan'),
('27. Je možné vydať kvalifikovaný certifikát na občiansky preukaz dodatočne?',	'Pokiaľ sa občan rozhodne o vydanie kvalifikovaného certifikátu pre elektronický podpis na elektronickú identifikačnú kartu až dodatočne, toto vydanie je možné na Okresnom riaditeľstve Policajného zboru alebo prostredníctvom Aplikácie pre eID.',	NULL,	454,	'Občan'),
('28. Sú certifikáty na elektronickej identifikačnej karte verejné, dajú sa prečítať po zasunutí preukazu do čítačky?',	'Nie. Na zobrazenie certifikátov je potrebné, aby občan zadal svoj osobný bezpečnostný kód (BOK).',	NULL,	455,	'Občan'),
('29. Môžem používať elektronickú identifikačnú kartu na vytváranie kvalifikovaného elektronického podpisu na viacerých počítačoch?',	'Áno, pokiaľ je k príslušnému počítaču pripojená čítačka čipových kariet a nainštalovaný potrebný obslužný softvér k čítačke a elektronickej identifikačnej karte.',	NULL,	456,	'Občan'),
('30. Aké certifikáty môžu byť prítomné na občianskom preukaze s čipom?',	'Na elektronickú identifikačnú kartu môžu byť jej držiteľovi vydané tri rôzne typy certifikátov:

<ul>
<li>kvalifikovaný certifikát pre elektronický podpis, určený na vytváranie KEP rovnocenného s vlastnoručným podpisom;</li>
<li>certifikát na šifrovanie, určený na šifrovanie elektronickej komunikácie určenej pre občana;</li>
<li>certifikát pre elektronický podpis, určený na vytváranie zdokonaleného elektronického podpisu alebo iného elektronického podpisu; certifikát sa nepoužíva pri komunikácii s orgánmi verejnej moci, nakoľko ním vyhotovený podpis spravidla nie je uznávaný orgánmi verejnej moci.</li>
</ul>

Upozorňujeme používateľov, aby pri komunikácii s orgánmi verejnej moci nepoužívali certifikáty typu PCA a SCA, nakoľko nimi nie je možné vytvoriť <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a>. Prostredníctvom certifikátu PCA je možné vytvárať len <a href="https://www.slovensko.sk/sk/faq/faq-zep/#legpodpis">zdokonalený elektronický podpis</a>, ktorý nie je v zmysle zákona o <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/">e-Governmente</a> akceptovaný ako platná autorizácia.',	NULL,	457,	'Občan'),
('21. Kedy sa odoslané formuláre spracovávajú?',	'Žiadosti k registrácii a aktualizácii poskytovateľa služieb (service provider – SP) sa spracovávajú raz za 24 hodín, ostatné žiadosti každých 5 až 10 minút (ak sa pri nich nevyžaduje manuálne spracovanie pracovníkom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, napr. v prípade anonymne podanej žiadosti a pod.).',	NULL,	498,	'Občan'),
('31. Aký je rozdiel medzi osobným a kvalifikovaným certifikátom na občianskom preukaze?',	'Rozdiel medzi certifikátmi je hlavne v tom, na aký účel sa certifikáty môžu používať v platnej legislatíve, podľa ktorej je len s kvalifikovaným certifikátom možné vytvoriť KEP, ktorý je elektronickým ekvivalentom vlastnoručnému podpisu a v prípade zahrnutia kvalifikovanej časovej pečiatky ekvivalentom úradne overeného vlastnoručného podpisu. Osobným certifikátom, ktorý nie je kvalifikovaný, nie je možné vytvoriť platnú autorizáciu v zmysle zákona o e-Governmente a obvykle sa nepoužíva pri komunikácii s orgánmi verejnej moci.',	NULL,	458,	'Občan'),
('32. Keď stratím občiansky preukaz bude mi bezplatne vydaný nový certifikát pre <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a>?',	'Po strate/odcudzení dokladu nasleduje vydanie nového dokladu (za poplatok). Certifikáty sú na novo vydávané karty vydávané bezplatne.',	NULL,	459,	'Občan'),
('33. Ako pridám podpis alebo pečať, ak mi ich ústredný portál z technických príčin neumožňuje pridať priamo v elektronickej schránke?',	'Ak potrebujete pridať podpis alebo pečať k dokumentu, ktorý z technických príčin nemôže aplikácia pre vytváranie KEP alebo <a href="https://www.slovensko.sk/sk/slovnik/detail/_cep">Centrálna elektronická podateľňa</a> spracovať (t. j. v prostredí pre vytváranie správ sa vám nezobrazuje možnosť "podpísať" alebo sa zobrazí chybová hláška odkazujúca na použitie aplikácií od iných poskytovateľov), môžete využiť služby ako napríklad <a href="https://www.qsign.sk/">QSign</a>, <a href="https://www.disig.sk/">Disig Desktop Signer</a>, <a href="https://www.podpisuj.sk/">Podpisuj.sk</a>, <a href="https://qesportal.sk/Portal/sk">QES portál</a>, <a href="https://qes.webnode.sk/">QES aplikáciu</a> alebo <a href="https://www.dstore.sk/shop/product/d-bulk-signer-standard-444?category=22#attr=442">D.Bulk Signer – Standard</a>. Na uvedených portáloch dokument najskôr nahráte, potom ho podpíše alebo zapečatíte a následne si ho stiahnete a nahráte tam, kam potrebujete.

<p><i><b>Upozorňujeme, že orgány verejnej moci sú povinné prijímať len formáty dokumentov predpísané podľa <a href="https://www.slovensko.sk/sk/faq/faq-podania/#dokumenty">právnych predpisov</a>.</b></i></p>',	NULL,	460,	'Občan'),
('34. Prečo sa <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> vytvorený cez aplikáciu Adobe Acrobat Reader vyhodnocuje ako neplatný?',	'V zmysle Nariadenia Európskeho parlamentu a Rady EÚ č. 910/2014 o elektronickej identifikácii a dôveryhodných službách pre elektronické transakcie na vnútornom trhu sa akceptujú kvalifikované elektronické podpisy vo formátoch ASiC, XAdES, CAdES, PAdES.

<p>Ak ste teda na podpísanie použili aplikáciu Adobe Acrobat Reader a váš <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> je vyhodnotený ako neplatný, môže to byť zapríčinené tým, že ste v nastaveniach ponechali predvolený formát podpisu PKCS#7 a nezmenili ste ho na akceptovaný formát CAdES.</p>

<p>Formát podpisu v aplikácii Adobe Acrobat Reader môžete zmeniť nasledovne: v sekcii „Úpravy“ prejdite na „Predvoľby“, v časti „Kategórie“ zvoľte „Podpisy“. V časti „Vytvorenie a vzhľad“ kliknite na tlačidlo „Viac...“. Otvorí sa nové okno, kde je potrebné v poli „Predvolený formát podpisu“ vybrať „Ekvivalentný CAdES“. Kliknutím na „OK“ sa zmena uloží (Obr. 1).</p>

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/podpis.png">
</picture>

<p>Obr. 1 – Zmena predvoleného formátu podpisu v aplikácii Adobe Acrobat Reader</p>

<p><b>Upozornenie:</b> Za správnu funkčnosť podpisovania prostredníctvom aplikácií tretích strán (ako je napr. Adobe Reader) Národná agentúra pre sieťové a elektronické služby nezodpovedá a neposkytuje pre tieto aplikácie podporu.</p>',	NULL,	461,	'Občan'),
('35. Prečo sa na Ústrednom portáli verejnej správy pri podpisovaní vytvára formát ASiC a nie PDF s PAdES podpisom?',	'Uvádzame hlavné dôvody, prečo sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> vytvára formát ASiC a zároveň porovnanie vlastností s formátom PDF obsahujúcim podpis PAdES.

<p><b>Podpisy v ASiC vytvárané na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a></b></p>

<ul>
<li>Znemožňujú meniť dokument po jeho podpísaní, bez zneplatnenia existujúceho podpisu.</li>
<li>V prípade potreby podpísania dokumentu viacerými osobami každá podpisujúca osoba podpisuje v ASiC identický dátový obsah. (Používajú sa tzv. paralelné podpisy.)</li>
<li>ASiC-XAdES alebo ASiC-CAdES je jeden z povinných formátov, ktoré musia akceptovať všetky členské štáty EÚ podľa Nariadenia EP a Rady EÚ č. 910/2014 od 1. júla 2016.</li>
<li>V ASiC je možné podpisovať ľubovoľné formáty súborov. Na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> sú v súčasnosti vzhľadom na povinné štandardy verejnej správy SR podporované pri podpisovaní len základné 4 formáty - PDF, PNG, TXT, XML dáta formulára, pričom tieto formáty je povinná prijímať celá verejná správa v SR.</li>
<li>Umožňuje podpisovanie XML údajov vyplnených podľa elektronického formulára, ktoré sú podľa zákona č. 305/2013 Z. z. o e-Governmente povinným formátom pre elektronické podania a elektronické úradné dokumenty. Pre vizualizáciu údajov sú povinne predpísané transformácie (XSLT) do formátu HTML, XHTML alebo TXT.</li>
<li>Jeho výhodou je, že ide o ZIP súbor so špecifickou príponou a s jednoduchou štruktúrou priečinkov a súborov. V prípade podpísaného súboru je možné pomerne jednoducho tento súbor získať otvorením v aplikácii podporujúcej otváranie ZIP súborov. V prípade špecifických formátov ako sú XML údaje vyplnené podľa elektronického formulára je však pre zobrazenie potrebné použitie aplikácie pre transformáciu XML údajov pomocou XSLT transformácie do vizualizácie.</li>
<li>Jeho nevýhodou je, že zatiaľ nie je priamo podporovaný v bežných aplikáciách pre prácu s dokumentami. Do budúcna sa však očakáva rozšírenie jeho podpory vzhľadom na platnú európsku legislatívu.</li>
<li>ASiC je možné na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> vytvárať v aplikácii D.Suite/<a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> poskytovanej na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> bezplatne, pričom táto aplikácia podporuje len formát ASiC-XAdES. <a href="https://www.slovensko.sk/sk/slovnik/detail/_nases">NASES</a> sa v minulosti s ohľadom na používateľov rozhodol, že nebude od používateľov vyžadovať inštaláciu dvoch odlišných podpisovacích aplikácií (jednu pre XAdES / ASiC-XAdES a druhú pre PAdES a CAdES).</li>
<li>Umožňuje spoločnú autorizáciu viacerých dokumentov jedným podpisom alebo pečaťou. Spoločná autorizácia sa v zmysle zákona povinne vyžaduje pre niektoré prípady ako je napríklad zaručená konverzia z listinnej do elektronickej formy alebo pre autorizáciu niektorých typov elektronických úradných dokumentov.</li>
</ul>

<b>Formát PAdES</b>

<ul>
<li>PAdES umožňuje do už podpísaného dokumentu vkladať ďalšie údaje, čo môže ďalších používateľov pracujúcich s podpísaným dokumentom uviesť do omylu, keďže väčšina aplikácií podporujúcich PDF dokumenty pracuje vždy s poslednou revíziou a neupozorňuje používateľa, že podpísaná verzia dokumentu sa líši od aktuálne zobrazenej. Táto vlastnosť potenciálne umožňuje vykonávanie útokov ako je PDF Shadow attack, kedy po podpise prvou osobou môže prísť k úprave PDF súboru, ktorá spôsobí, že druhá osoba bude podpisovať odlišný informačný obsah, než prvá osoba.</li>
<li>V prípade autorizácie viacerými osobami v PAdES nie je možné v bežne dostupných aplikáciách zistiť, či všetky osoby podpísali rovnaký obsah, čo môže viesť k pochybnostiam. Porovnávanie obsahu môže predstavovať v niektorých prípadoch výrazné praktické problémy a manuálne porovnávanie obsahu. V PAdES sa používajú sekvenčné/sériové podpisy, v prípade ktorých každý ďalší podpis zahŕňa celý predchádzajúci podpis a ďalšie dodatočné informácie.</li>
<li>PAdES je jeden z povinných formátov, ktoré musia akceptovať všetky členské štáty EÚ v zmysle Nariadenia EP a Rady EÚ č. 910/2014.</li>
<li>PAdES umožňuje podpisovať výlučne formát PDF.</li>
<li>PAdES neumožňuje podpisovať povinné XML údaje vyplnené podľa elektronického formulára predpísané legislatívou.</li>
<li>Jeho výhodou je, že PDF súbory podpísané s PAdES sú štandardné PDF súbory, ktoré vo svojom vnútri obsahujú podpis. Je ich možné priamo otvárať v množstve aplikácií podporujúcich zobrazovanie PDF.</li>
<li>Nevýhodou je, že väčšina aplikácií nepodporuje zobrazovanie informácií o podpisoch, zobrazovanie obsahu podpísaného jednotlivými osobami alebo porovnanie tohto obsahu. Ďalšou nevýhodou je, že v PDF existujú aj iné formáty podpisov, ktoré však nespĺňajú legislatívne požiadavky EÚ a preto sa stáva, že používateľ vytvorí s kvalifikovaným certifikátom podpis, ktorý však nie je pri validácii vyhodnotený ako kvalifikovaný.</li>
<li>Je ho možné použiť pre podpisovanie príloh aplikáciami tretích strán mimo <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, pokiaľ sa v konkrétnom konaní vyžaduje prikladanie príloh.</li>
<li>Neumožňuje spoločnú autorizáciu viacerých dokumentov, ktorá sa v zmysle zákona povinne vyžaduje pre niektoré prípady ako je napríklad zaručená konverzia.</li>
</ul>',	NULL,	462,	'Občan'),
('36. Aké legislatívne typy podpisov/pečatí existujú?',	'<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/vysledok_informativneho_overenia.jpg">
</picture>

<p>Obr. 2 - Rozšírenie údajov vo výsledku informatívneho overenia o typ legislatívneho podpisu/pečate</p>

<p>Vo výsledku informatívneho overenia legislatívneho podpisu/pečate na Ústrednom portáli verejnej správy sa môžu vyskytnúť nasledujúce legislatívne typy podpisov:</p>

<p>Kvalifikovaný podpis - Ide o <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a>, ktorý má v zmysle Nariadenia Európskeho parlamentu a Rady EÚ <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/?uri=CELEX%3A32014R0910">č. 910/2014</a> (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a>) rovnocenný právny účinok ako vlastnoručný podpis. V zmysle zákona <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/">č. 305/2013 Z. z.</a> o e-Governmente je <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> jedným zo spôsobov, ktorým je možné autorizovať elektronické podania. V prípade, ak <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> zahŕňa kvalifikovanú časovú pečiatku, má právny účinok úradne overeného podpisu.</p>

<p><b>Kvalifikovaná pečať</b> - Ide o kvalifikovanú elektronickú pečať, ktorá je v zmysle zákona <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/">č. 305/2013 Z. z.</a> o e-Governmente jedným zo spôsobov, ktorým je možné autorizovať elektronické podania a v prípade pripojenia kvalifikovanej časovej pečiatky aj elektronické úradné dokumenty.</p>

<p><a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> alebo pečať, pri ktorom sa vo výsledku informatívneho overenia podpisov zobrazuje slovenská vlajka, nie sú orgány verejnej moci povinné akceptovať, nakoľko je vyhotovený <a href="https://www.slovensko.sk/sk/faq/_najcastejsie-otazky-a-odpovede#formaty">v slovenskom formáte používanom podľa legislatívy účinnej do 30. júna 2016</a>, ktorý nie je plne súladný s Vykonávacím rozhodnutím Komisie EÚ <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/?uri=CELEX:32015D1506">č. 2015/1506</a>.</p>

<p>Kvalifikovaný mandátny podpis - Ide o <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> vyhotovený použitím mandátneho certifikátu. V zmysle zákona <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/">č. 305/2013 Z. z.</a> je takýto podpis s pripojenou kvalifikovanou časovou pečiatkou vyžadovaný v prípade autorizácie elektronických úradných dokumentov, ak osobitný zákon vyžaduje autorizáciu konkrétnou osobou alebo osobou v konkrétnom postavení.</p>

<p><b>Zdokonalený podpis založený na kvalifikovanom certifikáte</b> - Tento typ podpisu nie je možné použiť na autorizáciu elektronických úradných dokumentov. Orgán verejnej moci sa môže rozhodnúť takýto podpis akceptovať na elektronickom podaní alebo jeho prílohách, ak ich osobitný predpis umožňuje zaslať bez autorizácie. Orgán verejnej moci je povinný tento typ  podpisu akceptovať v prípade, ak by osobitný predpis vyžadoval autorizáciu zdokonaleným elektronickým podpisom (príp. pečaťou) založeným na kvalifikovanom certifikáte alebo zdokonaleným elektronickým podpisom.</p>

<p>Ide o podpis vyhotovený s kvalifikovaným certifikátom, ktorý nie je uložený na kvalifikovanom bezpečnom zariadení pre vytváranie kvalifikovaných podpisov a preto neobsahuje príznak QSCD alebo SSCD. Vzhľadom na možnosť prenášať privátny kľúč takéhoto kvalifikovaného certifikátu bez kvalifikovaného bezpečného zariadenia má takýto podpis nižšiu mieru bezpečnosti.</p>

<p><b>Zdokonalená pečať založená na kvalifikovanom certifikáte</b> - Tento typ pečate nie je mžné použiť na autorizáciu elektronických úradných dokumentov. Orgán verejnej moci sa môže rozhodnúť takýto podpis akceptovať na elektronickom podaní alebo jeho prílohách, ak ich osobitný predpis umožňuje zaslať bez autorizácie. Orgán verejnej moci je povinný tento typ podpisu akceptovať v prípade, ak by osobitný predpis vyžadoval autorizáciu zdokonalenou elektronickou pečaťou založenou na kvalifikovanom certifikáte alebo zdokonalenou elektronickou pečaťou.</p>

<p>Ide o pečať vyhotovenú s kvalifikovaným certifikátom, ktorý nie je uložený na kvalifikovanom bezpečnom zariadení pre vytváranie kvalifikovaných pečatí a preto neobsahuje príznak QSCD alebo SSCD.</p>

<p>Je však potrebné upozorniť, že do nadobudnutia účinnosti zákona <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2016/272/">č. 272/2016 Z. z.</a> o dôveryhodných službách dňa 18. októbra 2016 niektorí poskytovatelia dôveryhodných služieb vydávali kvalifikované certifikáty pre pečať bez príznaku QSCD alebo SSCD aj v prípade, ak boli uložené na kvalifikovanom zariadení. Týka sa to najmä certifikátov vydaných CA Disig a CA Disig QCA3, ktorých platnosť postupne skončila počas rokov 2019 a 2020. <i>V prípade takýchto pečatí preto vo výsledku overenia bude uvedené, že ide iba o zdokonalené elektronické pečate založené na kvalifikovanom certifikáte.</i></p>

<p><b>Zdokonalený podpis</b> - Ide o podpis vyhotovený bez použitia kvalifikovaného certifikátu, ktorý nie je možné použiť na autorizáciu elektronických úradných dokumentov alebo elektronických podaní a príloh k nim.</p>

<p>Pre overenie platnosti takéhoto typu podpisu obvykle nie sú bežne dostupné služby a preto sa vo verejne dostupných službách obvykle overuje ako neplatný.</p>

<p>Orgán verejnej moci sa môže rozhodnúť takýto podpis akceptovať na elektronickom podaní alebo jeho prílohách, ak osobitný predpis umožňuje zaslať <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a> alebo jeho prílohy bez autorizácie. Orgán verejnej moci je povinný takýto  podpis akceptovať, ak osobitný predpis vyžaduje autorizáciu zdokonaleným elektronickým podpisom.</p>

<p><b>Zdokonalená pečať</b> - Ide o pečať vyhotovenú bez použitia kvalifikovaného certifikátu, ktorú nie je možné použiť na autorizáciu elektronických úradných dokumentov alebo elektronických podaní a príloh k nim.</p>

<p>Pre overenie platnosti takéhoto typu pečate obvykle nie sú bežne dostupné služby a preto sa vo verejne dostupných službách zvyčajne overuje ako neplatná.</p>

<p>Orgán verejnej moci sa môže rozhodnúť takúto pečať akceptovať na elektronickom podaní alebo jeho prílohách, ak osobitný predpis umožňuje zaslať <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a> alebo jeho prílohy bez autorizácie. Orgán verejnej moci je povinný takúto pečať akceptovať, ak osobitný predpis vyžaduje autorizáciu zdokonalenou elektronickou pečaťou.</p>',	NULL,	463,	'Občan'),
('37. Prečo mi nejde vytvoriť <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> bez Java?',	'V súčasnosti je pre vytvorenie kvalifikovaného elektronického podpisu v používateľskom prostredí ústredného portálu verejnej správy v operačných systémoch Apple macOS alebo GNU/Linux nevyhnutné mať prístupné knižnice: Java 8+, Java Web Start, Java FX a Java Architecture for XML Binding (JAXB). Všetky tieto komponenty sa aktuálne bezplatne nachádzajú vo verzii Oracle Java 8, ktorá umožňuje bezproblémové vytváranie kvalifikovaného elektronického podpisu. Jej podpora bude k dispozícii do Marca 2022.

<p>Národná agentúra pre sieťové a elektronické služby si uvedomuje situáciu na trhu a prechod na iné technológie, a preto do budúcnosti plánuje sprístupnenie nových verzií podpisovačov. Tento krok bude odkomunikovaný na portáli slovensko.sk.</p>',	NULL,	464,	'Občan'),
('1. Pomocou akého operačného systému je možné prihlásiť sa na ústredný portál?',	'Momentálne sa môžete prihlásiť na portál (do elektronickej schránky) cez aplikáciu <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a> prostredníctvom operačného systému (Windows XP SP3, Windows 7, Windows 8, Windows 8.1, Windows 10, Windows 11, MacOS 10.x, MacOS 11.x, MacOS 12.x, Linux (Mint, Ubuntu, Debian).',	NULL,	465,	'Občan'),
('2. Cez aké internetové prehliadače je možné využívať elektronické služby sprístupnené cez ústredný portál?',	'Elektronické služby je možné využívať cez podporované verzie webových prehliadačov. Verzia webového prehliadača je podporovaná vtedy, ak je jej podiel zastúpenia na trhu v Slovenskej republike viac ako 5 %. Podporované verzie webových prehliadačov je možné v zmysle <a href="https://www.mirri.gov.sk/wp-content/uploads/2018/10/Metodicky-pokyn-k-vynosu-o-standardoch-c.-552014-2.pdf">Metodického pokynu</a> Úradu podpredsedu vlády SR pre investície a informatizáciu (dnes Ministerstvo investícií, regionálneho rozvoja a informatizácie SR) k výnosu MF SR č. 55/2014 Z. z. o štandardoch pre informačné systémy verejnej správy nájsť najmä na <a href="https://ranking.gemius.com/sk/">webovom sídle portálu gemius rankinig</a>.

<p><i><b>Poznámka:</b> Pri niektorých službách môže však príslušný orgán verejnej moci (prijímateľ elektronického podania - inštitúcia, úrad) vyžadovať použitie konkrétneho prehliadača. Napr. pri vybraných službách živnostenského registra, ktoré vyžadujú podpísanie formulára kvalifikovaným elektronickým podpisom, je potrebné použiť Internet Explorer.</i></p>',	NULL,	466,	'Občan'),
('3. Ako postupovať pri prihlásení sa na portál prostredníctvom občianskeho preukazu s čipom?',	'Na prihlásenie kliknite na funkciu „Prihlásiť sa na portál“, ktorá sa nachádza v pravom hornom rohu obrazovky (prihlasovací panel). Ďalej postupujte podľa <a href="https://www.slovensko.sk/_img/CMS4/Navody/postup_prihlasenie_na_portal.pdf">Návodu na prihlásenie sa na portál a do elektronickej schránky</a>. [.pdf, 704.6 kB]',	NULL,	467,	'Občan'),
('4. Ako postupovať v prípade, že sa neviem na portál prihlásiť?',	'V prípade, že ste majiteľom občianskeho preukazu s čipom a máte správne inštalované softvérové aplikácie <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a> a aplikáciu pre čítačku karty a váš problém s prihlásením sa na portál pretrváva, kontaktujte naše Ústredné kontaktné centrum prostredníctvom <a href="https://helpdesk.slovensko.sk/new-incident/">kontaktného formulára</a> alebo na telefónnom čísle 02/35803083 v pracovných dňoch od pondelka do piatka v čase od 8.00 h do 18.00 h. a v stredu až do 21.00 h.',	NULL,	468,	'Občan'),
('5. Ako postupovať v prípade, že sa stránka ústredného portálu nezobrazuje korektne?',	'Na odstránenie popísaného problému je potrebné urobiť zmeny v nastaveniach vášho internetového prehliadača – vymazať tzv. súbory cookies. Postupujte, prosím, podľa nasledujúceho <a href="https://www.slovensko.sk/sk/navody/nekorektne-zobrazenie-stranky/_ako-postupovat-nekorektne-zobrazenie/">návodu</a>.',	NULL,	469,	'Občan'),
('6. Vo Win XP po vložení občianskeho preukazu s čipom do čítačky nevyskočí okno na zadanie bezpečnostného osobného kódu (tak ako pri Win 7, 8), ako mám postupovať?',	'Vo Win XP sa nezobrazuje okno na zadanie bezpečnostného osobného kódu automaticky. Okno na zadanie bezpečnostného osobného kódu sa zobrazí až pri samotnom kliknutí na funkciu „Prihlásiť sa na portál“.

<p><i>Zodpovednosť za obsah: Redakcia <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a></i></p>',	NULL,	470,	'Občan'),
('1. Akými spôsobmi môžem zaplatiť za elektronické služby spoplatnené správnym alebo súdnym poplatkom?',	'Najrýchlejším spôsobom úhrady poplatku je platba kartou priamo cez nový dizajn elektronickej schránky. Ďalej je na výber platba bankovým prevodom cez internet banking alebo Pay by square naskenovaním QR kódu, platba na kiosku cez mobilnú alebo webovú aplikáciu eKolok či platba poštovým poukazom. Viac o spôsoboch platby sa dozviete v <a href="https://www.slovensko.sk/sk/platba-online">súvisiacom článku...</a>',	'Dane a poplatky',	471,	'Občan'),
('2. Ktorý zo spôsobov platby sa odporúča?',	'Uvedené spôsoby platby sa od seba navzájom líšia najmä ich časovou náročnosťou a požadovaným technologickým vybavením žiadateľa. Kým platbu bankovým prevodom systém spracuje do 72 hodín, platba kartou sa uskutoční okamžite, nie je potrebný prístup do internet bankingu alebo nainštalovaná mobilná aplikácia banky, špeciálny mobilný telefón a ani osobná návšteva pošty, a preto sa poplatok odporúča zaplatiť práve kartou.',	'Dane a poplatky',	472,	'Občan'),
('3. Môžem zaplatiť kartou za všetky elektronické služby?',	'Momentálne je možné uhradiť kartou iba vybrané spoplatnené elektronické služby <b>Generálnej Prokuratúry SR, Ministerstva vnútra SR, Ministerstva dopravy a výstavby SR, Ministerstva spravodlivosti SR</b> a poplatok za žiadosť o opätovnú aktiváciu elektronickej schránky na doručovanie.

<p>Zoznam vybraných elektronických služieb generálnej prokuratúry:</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/detail-sluzby?externalCode=sluzba_egov_807">Poskytovanie výpisu a odpisu z registra trestov</a></li>
</ul>

<p>Zoznam vybraných elektronických služieb ministerstva vnútra:</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-pri-trvalo/">Získanie potvrdenia o trvalom pobyte</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-pri-trvalo/">Získanie potvrdenia o ohlásení "trvalého" pobytu v zahraničí</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-pri-precho/">Získanie potvrdenia o prechodnom pobyte</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-pri-precho/">Získanie potvrdenia o ohlásení prechodného pobytu v zahraničí</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_ziadosti-o-uradne-vypisy/">Podanie žiadosti o vydanie úmrtného listu s pôvodným menom</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_ziadosti-o-uradne-vypisy/">Vydanie úradného výpisu (duplikátu) matričného dokladu</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_ziadosti-o-uradne-vypisy/">Vyhotovenie potvrdenia o údajoch zapísaných v matričnej knihe</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-suvisiace1/">Podanie žiadosti o vydanie občianskeho preukazu s čipom</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zmenu údajov po prisťahovaní držiteľa z iného okresu</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o výmenu tabuľky s evidenčným číslom vozidla (za klasickú, voliteľnú alebo plastovú)</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o odhlásenie vozidla do cudziny</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o výmenu tabuľky s evidenčným číslom za duplikát (z dôvodu straty, odcudzenia alebo poškodenia)</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o objednanie tabuľky s evidenčným číslom na nosič bicyklov</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o obnovenie osvedčenia o evidencii vozidla po strate alebo odcudzení</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o výmenu osvedčenia, osvedčení o evidencii vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zrušenie prevodu držby vozidla na inú osobu</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o vykonanie zmeny v dokladoch vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zmenu vlastníctva vozidla po ukončení leasingu vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zápis vlastníka vozidla po oznámení ukončenia predchádzajúceho vlastníctva</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o prvé prihlásenie vozidla do evidencie</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zápis nového držiteľa vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o priamy prevod držby alebo vlastníctva vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o vyradenie vozidla z evidencie</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_pristup-k-elektronickym-archiv">Podanie žiadosti o nahliadnutie do matriky</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_pristup-k-elektronickym-archiv">Podanie žiadosti o poskytnutie správnej informácie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Ohlasovanie+vo%c4%benej%2c+remeselnej+a+viazanej+%c5%beivnosti+-+fyzick%c3%a1+osoba">Ohlasovanie voľnej, remeselnej a viazanej živnosti - fyzická osoba</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Ohlasovanie+vo%c4%benej%2c+remeselnej+a+viazanej+%c5%beivnosti+%e2%80%93+pr%c3%a1vnick%c3%a1+osoba">Ohlasovanie voľnej, remeselnej a viazanej živnosti - právnická osoba</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Oznamovanie+pozastavenia+prev%c3%a1dzkovania+%c5%beivnosti">Oznamovanie pozastavenia prevádzkovania živnosti</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+v%c3%bdpisu+z+verejnej+%c4%8dasti+%c5%beivnostensk%c3%a9ho+registra">Poskytovanie výpisu z verejnej časti živnostenského registra</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%c3%a1vanie+%c5%beiadosti+o+vydanie+potvrdenia+o+tom%2c+%c5%bee+poskytovanie+slu%c5%beieb+na+z%c3%a1klade+%c5%beivnostensk%c3%a9ho+opr%c3%a1vnenia+nie+je+obmedzen%c3%a9+alebo+zak%c3%a1zan%c3%a9">Podávanie žiadosti o vydanie potvrdenia o tom, že poskytovanie služieb na základe živnostenského oprávnenia nie je obmedzené alebo zakázané</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+opr%c3%a1vnenia+na+podnikanie+pod%c4%bea+osobitn%c3%bdch+predpisov-Fyzick%c3%a1+osoba+tuzemsk%c3%a1">Poskytovanie oprávnenia na podnikanie podľa osobitných predpisov - Fyzická osoba tuzemská</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+opr%c3%a1vnenia+na+podnikanie+pod%c4%bea+osobitn%c3%bdch+predpisov-Fyzick%c3%a1+osoba+zahrani%c4%8dn%c3%a1">Poskytovanie oprávnenia na podnikanie podľa osobitných predpisov - Fyzická osoba zahraničná</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+opr%c3%a1vnenia+na+podnikanie+pod%c4%bea+osobitn%c3%bdch+predpisov-Pr%c3%a1vnick%c3%a1+osoba+tuzemsk%c3%a1">Poskytovanie oprávnenia na podnikanie podľa osobitných predpisov - Právnická osoba tuzemská</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+opr%c3%a1vnenia+na+podnikanie+pod%c4%bea+osobitn%c3%bdch+predpisov-Pr%c3%a1vnick%c3%a1+osoba+zahrani%c4%8dn%c3%a1">Poskytovanie oprávnenia na podnikanie podľa osobitných predpisov - Právnická osoba zahraničná</a></li>
</ul>

<p>Zoznam vybraných elektronických služieb ministerstva dopravy a výstavby:</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%c3%a1vanie+%c5%beiadosti+o+vydanie+osved%c4%8denia+ADR+o+%c5%a1kolen%c3%ad+vodi%c4%8da+-+prv%c3%a9+vydanie">Podávanie žiadosti o vydanie osvedčenia ADR o školení vodiča – prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+ADR+o+%C5%A1kolen%C3%AD+vodi%C4%8Da+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia ADR o školení vodiča - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+ADR+o+%C5%A1kolen%C3%AD+vodi%C4%8Da+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie ADR osvedčenia o školení vodiča - duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+bezpe%C4%8Dnostn%C3%A9ho+poradcu+na+prepravu+nebezpe%C4%8Dn%C3%BDch+vec%C3%AD+-+prv%C3%A9+vydanie&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti bezpečnostného poradcu na prepravu nebezpečných vecí – prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+bezpe%C4%8Dnostn%C3%A9ho+poradcu+na+prepravu+nebezpe%C4%8Dn%C3%BDch+vec%C3%AD+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti bezpečnostného poradcu na prepravu nebezpečných vecí - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+bezpe%C4%8Dnostn%C3%A9ho+poradcu+na+prepravu+nebezpe%C4%8Dn%C3%BDch+vec%C3%AD+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti bezpečnostného poradcu na prepravu nebezpečných vecí - duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+bezpe%C4%8Dnostn%C3%A9ho+poradcu+na+prepravu+nebezpe%C4%8Dn%C3%BDch+vec%C3%AD+-+pred%C4%BA%C5%BEenie+platnosti&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti bezpečnostného poradcu na prepravu nebezpečných vecí - predĺženie platnosti</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+poverenie+pr%C3%A1vnickej+osoby+odbornou+pr%C3%ADpravou+bezpe%C4%8Dnostn%C3%BDch+poradcov+a+vodi%C4%8Dov+vozidiel+prepravuj%C3%BAcich+nebezpe%C4%8Dn%C3%A9+veci&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o poverenie právnickej osoby odbornou prípravou bezpečnostných poradcov a vodičov vozidiel prepravujúcich nebezpečné veci</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+od%C5%88atie+poverenia+pr%C3%A1vnickej+osoby+odbornou+pr%C3%ADpravou+bezpe%C4%8Dnostn%C3%BDch+poradcov+a+vodi%C4%8Dov+vozidiel+prepravuj%C3%BAcich+nebezpe%C4%8Dn%C3%A9+veci&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o odňatie poverenia právnickej osoby odbornou prípravou bezpečnostných poradcov a vodičov vozidiel prepravujúcich nebezpečné veci</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+poverenia+pr%C3%A1vnickej+osoby+odbornou+pr%C3%ADpravou+bezpe%C4%8Dnostn%C3%BDch+poradcov+a+vodi%C4%8Dov+vozidiel+prepravuj%C3%BAcich+nebezpe%C4%8Dn%C3%A9+veci&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu poverenia právnickej osoby odbornou prípravou bezpečnostných poradcov a vodičov vozidiel prepravujúcich nebezpečné veci</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+in%C5%A1truktorsk%C3%A9ho+preukazu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie inštruktorského preukazu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+pred%C4%BA%C5%BEenie+platnosti+in%C5%A1truktorsk%C3%A9ho+preukazu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o predĺženie platnosti inštruktorského preukazu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+udelenie+osved%C4%8Denia+technika+technickej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o udelenie osvedčenia technika technickej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+pred%C4%BA%C5%BEenie+platnosti+osved%C4%8Denia+technika+technickej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o predĺženie platnosti osvedčenia technika technickej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+zmenu+rozsahu+osved%C4%8Denia+technika+technickej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o zmenu rozsahu osvedčenia technika technickej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+udelenie+osved%C4%8Denia+technika+emisnej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o udelenie osvedčenia technika emisnej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+pred%C4%BA%C5%BEenie+platnosti+osved%C4%8Denia+technika+emisnej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o predĺženie platnosti osvedčenia technika emisnej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+zmenu+rozsahu+osved%C4%8Denia+technika+emisnej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o zmenu rozsahu osvedčenia technika emisnej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+udelenie+osved%C4%8Denia+technika+kontroly+originality&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o udelenie osvedčenia technika kontroly originality</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+pred%C4%BA%C5%BEenie+platnosti+osved%C4%8Denia+technika+kontroly+originality&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o predĺženie platnosti osvedčenia technika kontroly originality</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+zmenu+rozsahu+osved%C4%8Denia+technika+kontroly+originality&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o zmenu rozsahu osvedčenia technika kontroly originality</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+udelenie+osved%C4%8Denia+technika+mont%C3%A1%C5%BEe+plynov%C3%BDch+zariaden%C3%AD&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o udelenie osvedčenia technika montáže plynových zariadení</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+pred%C4%BA%C5%BEenie+platnosti+osved%C4%8Denia+technika+mont%C3%A1%C5%BEe+plynov%C3%BDch+zariaden%C3%AD&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o predĺženie platnosti osvedčenia technika montáže plynových zariadení</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+zmenu+rozsahu+osved%C4%8Denia+technika+mont%C3%A1%C5%BEe+plynov%C3%BDch+zariaden%C3%AD&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o zmenu rozsahu osvedčenia technika montáže plynových zariadení</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+na+vykon%C3%A1vanie+taxislu%C5%BEby+-+prv%C3%A9+vydanie&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti na vykonávanie taxislužby - prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+na+vykon%C3%A1vanie+taxislu%C5%BEby+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti na vykonávanie taxislužby - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+na+vykon%C3%A1vanie+taxislu%C5%BEby+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti na vykonávanie taxislužby - duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+prihl%C3%A1%C5%A1ky+na+sk%C3%BA%C5%A1ku+z+odbornej+sp%C3%B4sobilosti+v+taxislu%C5%BEbe&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie prihlášky na skúšku z odbornej spôsobilosti v taxislužbe</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+udelenie+koncesie+na+taxislu%C5%BEbu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o udelenie koncesie na taxislužbu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+koncesie+na+taxislu%C5%BEbu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu koncesie na taxislužbu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+od%C5%88atie+koncesie+na+taxislu%C5%BEbu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o odňatie koncesie na taxislužbu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+preukazu+vodi%C4%8Da+vozidla+taxislu%C5%BEby+-+prv%C3%A9+vydanie&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie preukazu vodiča vozidla taxislužby – prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+preukazu+vodi%C4%8Da+vozidla+taxislu%C5%BEby+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie preukazu vodiča vozidla taxislužby - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+preukazu+vodi%C4%8Da+vozidla+taxislu%C5%BEby+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie preukazu vodiča vozidla taxislužby duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+odbornej+sp%C3%B4sobilosti+v+cestnej+doprave+-+prv%C3%A9+vydanie&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia odbornej spôsobilosti v cestnej doprave – prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+odbornej+sp%C3%B4sobilosti+v+cestnej+doprave+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia odbornej spôsobilosti v cestnej doprave - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+odbornej+sp%C3%B4sobilosti+v+cestnej+doprave+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia odbornej spôsobilosti v cestnej doprave - duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/faq/$https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+udelenie+povolenia+na+v%C3%BDkon+povolania+prev%C3%A1dzkovate%C4%BEa+cestnej+dopravy&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o udelenie povolenia na výkon povolania prevádzkovateľa cestnej dopravy</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+povolenia+na+v%C3%BDkon+povolania+prev%C3%A1dzkovate%C4%BEa+cestnej+dopravy&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu povolenia na výkon povolania prevádzkovateľa cestnej dopravy</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+od%C5%88atie+povolenia+na+v%C3%BDkon+povolania+prev%C3%A1dzkovate%C4%BEa+cestnej+dopravy&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o odňatie povolenia na výkon povolania prevádzkovateľa cestnej dopravy</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+udelenie+licencie+spolo%C4%8Denstva&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o udelenie licencie spoločenstva</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+licencie+spolo%C4%8Denstva&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu licencie spoločenstva</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+registr%C3%A1ciu+%C5%A1koliaceho+strediska&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o registráciu školiaceho strediska</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+registr%C3%A1cie+%C5%A1koliaceho+strediska&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu registrácie školiaceho strediska</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+povolenie+prestavby+jednotliv%C3%A9ho+vozidla&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na povolenie prestavby jednotlivého vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+schv%C3%A1lenie+prestavby+jednotliv%C3%A9ho+vozidla&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na schválenie prestavby jednotlivého vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+povolenie+hromadnej+prestavby+typu+vozidla&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o povolenie hromadnej prestavby typu vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+schv%C3%A1lenie+hromadnej+prestavby+typu+vozidla&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o schválenie hromadnej prestavby typu vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+jednotliv%C3%A9+uznanie+typov%C3%A9ho+schv%C3%A1lenia+E%C3%9A+jednotlivo+dovezen%C3%A9ho+vozidla+z+%C4%8Dlensk%C3%A9ho+%C5%A1t%C3%A1tu+alebo+zmluvn%C3%A9ho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na jednotlivé uznanie typového schválenia EÚ jednotlivo dovezeného vozidla z členského štátu alebo zmluvného štátu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+jednotliv%C3%A9+uznanie+schv%C3%A1lenia+jednotlivo+dovezen%C3%A9ho+vozidla+z+%C4%8Dlensk%C3%A9ho+%C5%A1t%C3%A1tu+alebo+zmluvn%C3%A9ho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na jednotlivé uznanie schválenia jednotlivo dovezeného vozidla z členského štátu alebo zmluvného štátu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+vn%C3%BAtro%C5%A1t%C3%A1tne+jednotliv%C3%A9+schv%C3%A1lenie+jednotlivo+dovezen%C3%A9ho+vozidla+z+tretieho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na vnútroštátne jednotlivé schválenie jednotlivo dovezeného vozidla z členského štátu alebo zmluvného štátu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+vn%C3%BAtro%C5%A1t%C3%A1tne+jednotliv%C3%A9+schv%C3%A1lenie+jednotlivo+dovezen%C3%A9ho+vozidla+z+tretieho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na vnútroštátne jednotlivé schválenie jednotlivo dovezeného vozidla z tretieho štátu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+jednotliv%C3%A9+uznanie+typov%C3%A9ho+schv%C3%A1lenia+E%C3%9A+jednotlivo+dovezen%C3%A9ho+vozidla+z+tretieho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na jednotlivé uznanie typového schválenia EÚ jednotlivo dovezeného vozidla z tretieho štátu</a></li>
<a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+registr%C3%A1ciu+auto%C5%A1koly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o registráciu autoškoly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+registra%C4%8Dn%C3%BDch+%C3%BAdajov+auto%C5%A1koly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu registračných údajov autoškoly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+povolenie+evidencie%2c+uvedenie+na+trh+alebo+do+prev%C3%A1dzky+v+prem%C3%A1vke+na+pozemn%C3%BDch+komunik%C3%A1ci%C3%A1ch&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o povolenie evidencie, uvedenie na trh alebo do prevádzky v premávke na pozemných komunikáciách</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+op%C3%A4tovn%C3%A9+schv%C3%A1lenie+jednotliv%C3%A9ho+vozidla+na+prev%C3%A1dzku+v+cestnej+prem%C3%A1vke&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na opätovné schválenie jednotlivého vozidla na prevádzku v cestnej premávke</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+z%C3%A1pis+zmeny+%C3%BAdajov+v+osved%C4%8Den%C3%AD+o+evidencii+vozidla+(OEII)+%2f+technick%C3%A9ho+osved%C4%8Denia+vozidla+(TOV)&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zápis zmeny údajov v osvedčení o evidencii vozidla (OEII)/technického osvedčenia vozidla (TOV)</a></li>
</ul>

<p>Zoznam vybraných elektronických služieb ministerstva spravodlivosti:</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%c3%a1vanie+n%c3%a1vrhov+a+s%c3%bavisiacich+p%c3%adsomnost%c3%ad+na+s%c3%badne+konanie">Podávanie návrhov a súvisiacich písomností na súdne konanie (elektronické služby Ministerstva spravodlivosti SR týkajúce sa exekučného a upomínacieho konania)</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%c3%a1vanie+n%c3%a1vrhu+na+z%c3%a1pis%2c+zmenu+a+v%c3%bdmaz+%c3%badajov+v+obchodnom+registri">Podávanie návrhu na zápis, zmenu a výmaz údajov v obchodnom registri</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Po%c5%beiadanie+o+vyhotovenie+k%c3%b3pie+listiny+ulo%c5%beenej+v+zbierke+list%c3%adn+v+tla%c4%8denej+podobe">Požiadanie o vyhotovenie kópie listiny uloženej v zbierke listín v tlačenej podobe</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+v%c3%bdpisu+z+obchodn%c3%a9ho+registra+v+tla%c4%8denej+podobe">Poskytovanie výpisu z obchodného registra v tlačenej podobe</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Po%c5%beiadanie+o+vystavenie+potvrdenia+o+tom%2c+%c5%bee+listina+nie+je+ulo%c5%been%c3%a1+v+zbierke+list%c3%adn+v+tla%c4%8denej+podobe">Požiadanie o vystavenie potvrdenia o tom, že listina nie je uložená v zbierke listín v tlačenej podobe</a></li>
</ul>',	'Dane a poplatky',	473,	'Občan'),
('4. Akým spôsobom sa dozviem údaje potrebné na vykonanie úhrady?',	'Po odoslaní podania k vybranej spoplatnenej elektronickej službe dochádza k jeho spracovaniu, ktoré môže trvať niekoľko hodín. Následne sa vám do elektronickej schránky doručí správa s názvom „Príkaz na úhradu“, v ktorej sú všetky potrebné informácie k zaplateniu poplatku (lehota na zaplatenie, suma, číslo účtu v tvare IBAN, variabilný symbol a podobne).',	'Dane a poplatky',	474,	'Občan'),
('5. Ako mám postupovať, ak chcem uhradiť poplatok kartou?',	'Priamo v elektronickej schránke v príslušnom príkaze na úhradu nájdete zelené tlačidlo „Zaplatiť“, následne si vyberiete možnosť platby kartou a kliknete na „Zaplatiť kartou“, čím sa dostanete do virtuálneho kiosku. Vyplníte meno vlastníka karty, číslo platobnej karty, dátum expirácie, CVC2 kód a prejdete na „Potvrdiť platbu“. Platba kartou sa spracuje okamžite. Po zaplatení dostanete do elektronickej schránky správu s potvrdením úhrady. Bližší popis jednotlivých krokov nájdete v <a href="https://www.youtube.com/watch?v=_yVc4bil8BM">inštruktážnom videonávode...</a>

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/prikaz_na_uhradu.jpg">
</picture>

<p>Obrázok - Tlačidlo „Zaplatiť" v Príkaze na úhradu</p>',	'Dane a poplatky',	475,	'Občan'),
('6. Kde nájdem doklad o zaplatení poplatku?',	'Po zaplatení poplatku sa do elektronickej schránky doručí správa s názvom „Informácia o úhrade“, v ktorej sa nachádza tlačidlo „Uložiť účtovný doklad“ umožňujúce stiahnutie a následné vytlačenie dokladu o zaplatení.

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/uctovny_doklad.jpg">
</picture></p>

<p>Obrázok - Uložiť účtovný doklad</p>',	'Dane a poplatky',	476,	'Občan'),
('7. Prečo sa mi nedarí zaplatiť poplatok kartou? Kde môže byť problém?',	'Ak ste kartou cez internet ešte neplatili, je možné, že máte z dôvodu bezpečnosti zablokované MO/TO platby (z ang. Mail Order/Telephone Order). Ak kartou platíte cez internet pravidelne a aj tak sa vám nedarí zaplatiť, je možné, že ste prekročili nastavený denný, prípadne mesačný limit. Požadovaný limit pre vybraný typ platby a kartu je preto nutné najskôr nastaviť vo vašom internetovom bankovníctve.

<p>V prípade akýchkoľvek ďalších problémov sa môžete obrátiť na operátorov Ústredného kontaktného centra, ktorí sú vám k dispozícií na telefónnom čísle +421 2 35 803 083 počas pracovných dní, v pondelok až piatok od 8.00 do 18.00 h a v stredu od 8.00 do 21.00 h. Mimo uvedených časov, počas  štátnych sviatkov alebo v dňoch pracovného pokoja je možné nahlásiť problém cez <a href="https://helpdesk.slovensko.sk/new-incident/">kontaktný formulár</a>. Na preverenie problému je nevyhnutné uviesť číslo podania, prípadne variabilný symbol príkazu na úradu alebo znenie chybovej hlášky.</p>',	'Dane a poplatky',	477,	'Občan'),
('1. Čo je autentifikačný certifikát a na čo sa používa?',	'Autentifikačný certifikát je elektronický dokument - súbor vo formáte DER (.cer) podľa ISO/IEC 8825-1, ktorý obsahuje identifikátor osoby, ktorej bol vydaný a slúži na preukazovanie jej elektronickej identity.

<p>Autentifikačný certifikát sa používa na účely identifikácie a autentifikácie pri automatizovanom prístupe k informačnému systému alebo elektronickej komunikácii, ktoré súvisia s výkonom verejnej moci, alebo na účely prístupu do elektronickej schránky a disponovania s elektronickou schránkou.</p>

<p>Používa sa na prístup technickými alebo programovými prostriedkami, ktoré sa prihlasujú automatizovane cez aplikačné rozhrania. Neslúži na prihlasovanie na portáli slovensko.sk prostredníctvom občianskeho preukazu s čipom (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid">eID karta</a>), dokladom o pobyte s čipom alebo alternatívnym autentifikátorom.</p>

<p>Certifikát si vytvára a vydáva žiadateľ sám (certifikát podpísaný sám sebou, z angl. self-signed certificate), alebo môže o vydanie požiadať inú osobu.</p>

<p>Podmienkou použitia je úspešné zapísanie platného autentifikačného certifikátu do registra autentifikačných certifikátov na Ústrednom portáli verejnej správy (<a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>) na základe žiadosti podpísanej kvalifikovaným elektronickým podpisom alebo na základe úradne overeného podpisu.</p>',	NULL,	478,	'Občan'),
('2. Čo je technický účet a na čo sa používa?',	'Technický účet vzniká na základe žiadosti o registráciu autentifikačného certifikátu s technickým účtom. Je potrebný pre používanie autentifikačného certifikátu.

<p>Technický účet je špeciálny typ identity vytvorený interne v systéme správy identít v module IAM, pre fyzickú osobu, právnickú osobu alebo orgán verejnej moci za účelom identifikácie a autentifikácie technickým alebo programovým prostriedkom použitím autentifikačného certifikátu. Technický účet zastupuje identitu vlastníka technického účtu.</p>

<p>Technický účet v module IAM (Identity Access Management, systém správy identít na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>) resp. zastupovanie technickým účtom určuje rozsah oprávnení a disponovania s elektronickou schránkou osoby zastupovanej technickými prostriedkami prostredníctvom podporovaných komunikačných rozhraní a v prípade orgánov verejnej moci aj rozsah oprávnení pri prístupe k službám spoločných modulov <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.</p>',	NULL,	479,	'Občan'),
('3. Kto môže o zápis autentifikačného certifikátu a o vytvorenie technického účtu požiadať?',	'Žiadateľom môže byť orgán verejnej moci, fyzická osoba, podnikateľ a právnická osoba.',	NULL,	480,	'Občan'),
('4. Aké sú výhody použitia autentifikačného certifikátu?',	'Prostredníctvom technických alebo programových prostriedkov umožňuje získať automatizovaný prístup k službám spoločných modulov <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> a automatizovaný prístup do elektronickej schránky alebo disponovanie s elektronickou schránkou na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> bez nutnosti použitia občianskeho preukazu s čipom (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid">eID karta</a>). Technické a programové prostriedky môže osoba získať od tretích strán alebo vytvoriť si vlastné po splnení podmienok úspešnej integrácie na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	481,	'Občan'),
('5. Môže jeden autentifikačný certifikát pristupovať do viacerých elektronických schránok?',	'Áno, môže, v prípade, že má osoba, ku ktorej technickému účtu je autentifikačný certifikát priradený, udelené oprávnenie na prístup do viacerých elektronických schránok. V praxi to znamená, že po zaslaní formulára pre udelenie oprávnenia fyzickej alebo právnickej osobe na zastupovanie (dostupný priamo v elektronickej schránke) bude môcť takto oprávnená osoba pristupovať do elektronickej schránky aj použitím autentifikačného certifikátu. Formulár je možné zaslať aj v listinnej forme.

<p>Jeden subjekt (FO/PO/OVM) môže zastupovať neobmedzený počet iných subjektov. Pri každom takomto zastupovaní môže pre prístup využívať rovnaký autentifikačný certifikát alebo viaceré autentifikačné certifikáty, podľa vlastnej potreby.</p>

<p>K udeleniu oprávnenia na prístup a disponovanie s elektronickou schránkou odporúčame využiť až nový formulár (jeho dostupnosť bude oznámená v druhej polovici mesiaca december 2020), ktorý udelí zastupovanie len pre prístup technickým účtom s autentifikačným certifikátom (s voliteľnou možnosťou aj cez eID a pod.), čím sa zamedzí nežiadúcemu zobrazovaniu zastupovaní na prihlasovacej stránke štatutárovi zastupujúcej identity pri jeho prihlasovaní s eID. Zároveň bude pri použití nových formulárov automaticky zasielaná  správa o vytvorení zastupovania obsahujúca údaj <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> IdentityID (UUID identifikátor) zastupovanej identity potrebný pre volanie STS v zastúpení s parametrom OnBehalfOfId. Tento údaj je tiež možné zistiť v Profile identity v poli "ID identity", ktorej bolo udelené zastupovanie a tiež identity, ktorá zastupovanie udelila.</p.>',	NULL,	482,	'Občan'),
('6. Koľko autentifikačných certifikátov a technických účtov môže mať jedna identita?',	'Jedna identita môže mať zaregistrovaných viacero technických účtov a viacero autentifikačných certifikátov.

<p>Jeden autentifikačný certifikát môže byť zaregistrovaný iba jedenkrát, a teda iba na jeden technický účet. Registrácia rovnakého autentifikačného certifikátu bude zamietnutá vzhľadom na zhodu jeho digitálneho odtlačku.</p>

<p>Pre jeden technický účet môže byť zaregistrovaný neobmedzený počet autentifikačných certifikátov. (Počet nie je obmedzený, avšak v prípade potreby veľkých počtov pre jednu identitu - rádovo stoviek - je žiadúce vopred konzultovať s odborom integrácií.)</p>',	NULL,	483,	'Občan'),
('7. Koľko subjektov môže zastupovať jeden technický účet ?',	'Technický účet zastupuje jeden subjekt FO/PO/OVM – vlastníka technického účtu. Následne tento subjekt môže zastupovať ľubovoľný počet subjektov na základe udeleného oprávnenia. Príklad: Právnická osoba - spoločnosť poskytujúca určité služby pre rôzne subjekty (klientov) si môže zaregistrovať technický účet s naparovaným autentifikačným certifikátom a následne na základe udelenia oprávnení môže zastupovať ľubovoľný počet klientov.',	'Podnikanie',	484,	'Občan'),
('8. Ako sa vytvára autentifikačný certifikát?',	'Na vytvorenie autentifikačného certifikátu a privátneho kľúča je možné použiť napríklad voľne dostupný softvér OpenSSL s nasledovnými príkazmi:

<ul>
<li>penssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 730 -out certificate.pem</li>
<li>openssl x509 -outform der -in certificate.pem -out certificate.cer</li>
<li>openssl pkcs12 -export -out key.p12 -inkey key.pem -in certificate.pem</li>
</ul>

<p>Po spustení prvého príkazu si aplikácia vyžiada údaje o identite. V údajoch sa nesmie vyplniť žiadna položka okrem CN - Subject.</p>',	NULL,	485,	'Občan'),
('9.  Aké parametre musí spĺňať certifikát?',	'<ul>
<li>Certifikát môže byť vydaný samotným žiadateľom (tzv. self-signed certifikát). V prípade certifikátu vydaného certifikačnou autoritou nie je potrebné údaje o tejto autorite vydávajúcej certifikát zasielať do NASES. Register autentifikačných certifikátov obsahuje všetky informácie  o platnosti certifikátov a nijako nezohľadňuje stav autentifikačného certifikátu podľa CRL vydávajúcej certifikačnej autority. Certifikáty je potrebné rušiť zaslaním žiadosti do registra.
<li>Formát certifikátu X.509 v kódovaní DER podľa ISO/IEC 8825-1 (obvyklá prípona súboru: „.cer“)
<li>Platnosť: 2 roky (729 až 731 dní)
<li>Distinguished name (DN): Môže obsahovať výlučne Common name (CN) a nesmie obsahovať žiadne ďalšie údaje.
<li>Common name (CN):
<p>- v prípade fyzickej osoby: rc-rodné číslo (príklad: rc-8001011234 ),</p>
<p>- v prípade právnickej osoby: ico-identifikačné číslo organizácie _ suffix (príklad: ico-12345678 alebo ico-12345678_10001 alebo ico-123456789012 )
Dĺžka kľúča: 2048 bit</p></li>
<li>Algoritmus: Public Key Algorithm: RSA, Signature Algorithm - jedna z možností: sha256WithRSAEncryption, sha512WithRSAEncryption, SHA256withRSA SHA512withRSA</li>
</ul>',	NULL,	486,	'Občan'),
('21. Kedy sa odoslané formuláre spracovávajú?',	'Žiadosti k registrácii a aktualizácii poskytovateľa služieb (service provider – SP) sa spracovávajú raz za 24 hodín, ostatné žiadosti každých 5 až 10 minút (ak sa pri nich nevyžaduje manuálne spracovanie pracovníkom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, napr. v prípade anonymne podanej žiadosti a pod.).',	NULL,	681,	'Orgán verejnej moci'),
('10. Aké údaje má certifikát správne obsahovať?',	'Vygenerovaný certifikát so správnou hodnotou CN a dobou platnosti 2 roky je znázornený na Obr. 1.

<ul>
<li>Povinná hodnota CN je v tvare ico-XXXXXXXX , kde „XXXXXXXX" je IČO subjektu, pre ktorý certifikát registrujete. Ak by ste mali zriadenú organizačnú jednotku, tak sa uvádza v tvare ico-XXXXXXXX_suffix.</li>
<li>Povinná doba platnosti je aktuálne 2 roky (t. j. 729 až 731 dní).</li>
</ul>

<p>Správny tvar subjektu certifikátu, algoritmu a dĺžky kľúča je zobrazený na Obr. 2.</p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/certifikat-ukazka.png">
</picture></p>

<p>Obr. 1 - Hodnota CN bez suffixu/Hodnota CN so suffixom</p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/certifikat-ukazka4.png">
</picture></p>

<p>Obr. 2 - Správny tvar držiteľa, algoritmu a dĺžky kľúča</p>',	NULL,	487,	'Občan'),
('11. Má autentifikačný certifikát a technický účet obmedzenú platnosť ?',	'V zmysle aktuálne platného integračného manuálu IAM je platnosť autentifikačného certifikátu 2 roky. Platnosť technického účtu je neobmedzená.

<p>Žiadateľ môže obmedziť len platnosť zastupovania medzi technickým účtom a vlastníkom. „Platnosť od“ a „Platnosť do“ určuje platnosť zastupovania a tým aj oprávnenia na prístup a disponovanie s elektronickou schránkou. Koniec platnosti zastupovania nie je povinné uvádzať. Technický účet je aktívny aj po skončení platnosti autentifikačného certifikátu, ale nie je ním možné sa prihlásiť. Po zaregistrovaní platného autentifikačného certifikátu je opäť možné sa technickým účtom prihlasovať.</p>',	NULL,	488,	'Občan'),
('12. Ako sa dozviem o blížiacom sa uplynutí platnosti autentifikačného certifikátu alebo certifikátu z metadát poskytovateľa služieb (SP - service provider)?',	'Notifikačné správy o blížiacom sa uplynutí platnosti autentifikačného certifikátu alebo certifikátu poskytovateľa služieb (SP) sa zasielajú do elektronickej schránky vlastníka 30 dní, 14 dní, 7 dní, 1 deň pred uplynutím platnosti a aj posledný deň platnosti. V prípade, ak ste vyplnili kontaktné údaje v žiadosti, notifikačné správy vám budú doručené aj na vami uvedenú e-mailovú adresu.',	NULL,	489,	'Občan'),
('13. Aký formulár mám použiť, ak chcem zaregistrovať autentifikačný certifikát a zároveň vytvoriť technický účet?',	'Technický účet je technickou podmienkou používania autentifikačného certifikátu a preto prvý zápis autentifkačného certifikátu musí byť zároveň s vytvorením technického účtu.

<p>Je potrebné použiť formulár s názvom „Žiadosť o zápis autentifikačného certifikátu do registra autentifikačných certifikátov“. Formulár nájdete v časti „Profil“ po otvorení „Technické účty a certifikáty“ alebo na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“.</p>

<p>Žiadosť je možné podať aj bez prihlásenia, v takom prípade je potrebné po elektronickom odoslaní žiadosť vytlačiť, podpísať a podpis na nej úradne osvedčiť a zaslať do Národnej agentúry pre sieťové a elektronické služby.</p>',	NULL,	490,	'Občan'),
('14. Ako sa dozviem o úspešnej registrácii autentifikačného certifikátu a o vytvorení technického účtu?',	'O úspešnej registrácii autentifikačného certifikátu a o vytvorení technického účtu sa dozviete prostredníctvom informačnej správy o výsledku spracovania žiadosti zaslanej do elektronickej schránky vlastníka a na e-mailovú adresu uvedenú v žiadosti ako kontaktný údaj.',	NULL,	491,	'Občan'),
('15. Úspešne som si zaregistroval autentifikačný certifikát a vytvoril technický účet a zároveň mám integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. Ako ďalej?',	'Zaregistrovaný technický účet s naparovaným autentifikačným certifikátom môže subjekt využiť  na získanie časovo obmedzeného SAML tokenu, ktorým preukáže svoju totožnosť pri autentifikovanom prístupe k službám <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> napr. pri automatizovanom získavaní obsahu elektronickej schránky.',	NULL,	492,	'Občan'),
('16. Úspešne som si zaregistroval autentifikačný certifikát a vytvoril technický účet a nemám integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. Bude mi to fungovať?',	'Pre využívanie automatizovaného prístupu prostredníctvom autentifikačného certifikátu a technického účtu je potrebné sa najskôr integrovať na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. O potrebných krokoch sa môžete informovať prostredníctvom Ústredného kontaktného centra na tel. č. +421 2 35 803 083 alebo vyplnením <a href="https://helpdesk.slovensko.sk/new-incident/">kontaktného formulára</a>.',	NULL,	493,	'Občan'),
('17. Aký formulár mám použiť, ak potrebujem pre existujúci technický  účet upraviť rozsah oprávnenia na prístup k elektronickej schránke alebo dobu platnosti oprávnenia?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu v prístupových oprávneniach technického účtu“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom technickom účte kliknutím na tlačidlo „Upraviť“ .',	NULL,	494,	'Občan'),
('18. Aký formulár mám použiť, ak mi končí platnosť autentifikačného certifikátu k existujúcemu technickému účtu?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu zápisu autentifikačného certifikátu v registri autentifikačných certifikátov“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom autentifikačnom certifikáte kliknutím na tlačidlo „Pridať“.',	NULL,	495,	'Občan'),
('19. Aký formulár mám použiť, ak chcem zrušiť autentifikačný certifikát?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie autentifikačného certifikátu v registri autentifikačných certifikátov“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ kliknutím na názov technického účtu, ku ktorému sa autentifikačný certifikát viaže a pri konkrétnom autentifikačnom certifikáte je potrebné kliknúť na tlačidlo „Zneplatniť“.',	NULL,	496,	'Občan'),
('20. Aký formulár mám použiť, ak chcem zrušiť technický účet?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie prístupových oprávnení technického účtu (zrušenie technického účtu)“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom technickom účte kliknutím na tlačidlo „Zrušiť“.',	NULL,	497,	'Občan'),
('22. Čo potrebujem doložiť k žiadosti a ako sa žiadosť spracuje, ak odosielateľ žiadosti o registráciu autentifikačného certifikátu nie je totožný s držiteľom autentifikačného certifikátu a nemá udelené oprávnenie na prístup a disponovanie s elektronickou schránkou?',	'K žiadosti je potrebné priložiť splnomocnenie. Takáto žiadosť nie je spracovávaná automaticky, t. j. okamžite v momente odoslania žiadosti, ale podlieha manuálnej kontrole pracovníkom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	499,	'Občan'),
('23. Ak sa vo formulári nachádza povinné pole „Názov technického účtu“, ako zistím tento údaj?',	'Názov technického účtu nájdete buď v informačnej správe o výsledku spracovania žiadosti o registráciu autentifikačného certifikátu a o vytvorení technického účtu (zaslanej do elektronickej schránky vlastníka) alebo po prihlásení sa na portál slovensko.sk v časti „Profil“, „Technické účty a certifikáty“, alebo sa môžete obrátiť na operátorov nášho Ústredného kontaktného centra. V prípade, že máte integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, môžete zistiť názov technického účtu aj zavolaním požiadavky o vydanie STS tokenu v elemente Actor.ID.',	NULL,	500,	'Občan'),
('24. Môžem si zaregistrovať autentifikačný certifikát aj bez existencie technického účtu?',	'Nie, nie je to možné, autentifikačný certifikát musí byť naviazaný na technický účet.',	NULL,	501,	'Občan'),
('25. Aký formulár mám použiť, ak sa chcem zaregistrovať ako poskytovateľ služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o registráciu poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider).',	NULL,	502,	'Občan'),
('26. Aký formulár mám použiť, ak mi končí platnosť certifikátu poskytovateľa služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu údajov poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider) kliknúť na tlačidlo „Upraviť“.',	NULL,	503,	'Občan'),
('27. Aký formulár mám použiť, ak chcem zrušiť poskytovateľa služieb služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider) kliknúť na tlačidlo „Zrušiť“.',	NULL,	504,	'Občan'),
('28. Ako postupovať v prípade potreby hromadnej registrácie autentifikačných certifikátov?',	'V rámci Registra autentifikačných certifikátov nie sú možné hromadné registrácie autentifikačných certifikátov jednou žiadosťou. V prípadoch potreby hromadných registrácií musí integrovaný subjekt postupovať jednou z možností:

<ul>
<li>začať využívať volania STS služby s jedným autentifikačným certifikátom v zastúpení iných osôb (s parametrom OnBehalfOfId) namiesto samostatnej registrácie certifikátov za každý zastupovaný subjekt (túto možnosť umožňuje aj dodatok k DIZ so splnomocnením na udelenie zastupovania a na zrušenie doterajšieho autentifikačného certifikátu, na základe ktorého môžete zmigrovať svoje súčasné riešenie z množstva samostatných autentifikačných certifikátov na jeden certifikát),</li>
<li>implementovať si automatizovanú registráciu autentifikačných certifikátov prostredníctvom na to určeného elektronického formulára a zasielať žiadosti prostredníctvom integračného rozhrania,</li>
<li>manuálne registrovať každý autentifikačný certifikát zvlášť.</li>
</ul>',	NULL,	505,	'Občan'),
('1. Čo všetko budem potrebovať, ak chcem komunikovať s úradmi elektronicky?',	'V prvom rade potrebujete vlastniť občiansky preukaz s elektronickým čipom. Pri jeho preberaní si môžete zvoliť 6-miestny bezpečnostný osobný kód (BOK), ktorý vám bude automatický aktivovaný.

Ak chcete občiansky preukaz používať aj na podpisovanie kvalifikovaným elektronickým podpisom, požiadajte o nahratie kvalifikovaných certifikátov na jeho elektronický čip. <a href="https://www.slovensko.sk/sk/slovnik/detail/_bok">Bezpečnostný osobný kód</a>  a certifikáty na vytváranie kvalifikovaného elektronického podpisu si môžete vybaviť bez poplatku na ktoromkoľvek oddelení dokladov Okresného riaditeľstva Policajného zboru. <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">Kvalifikovaný elektronický podpis</a> v elektronickom svete nahrádza vlastnoručný podpis pri papierovom úradnom vybavovaní.

Ďalej budete potrebovať čítačku elektronických kariet a v počítači nainštalovaný príslušný softvér na prihlasovanie (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a>), balík aplikácií pre <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> (KEP) a ovládač na čítačku kariet. Softvér je dostupný v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.',	'Podnikanie',	506,	'Najčastejšie otázky a odpovede'),
('2. Aké čítačky kontaktných čipových kariet môžem využívať s občianskym preukazom s čipom?',	'Zoznam čítačiek, ktoré boli úspešne testované, nájdete uvedené v <a href="https://eidas.minv.sk/download/Aplikacia_EID/">používateľských príručkách k aplikácii eID klient roztriedených podľa jednotlivých operačných systémov</a>.',	'Podnikanie',	507,	'Najčastejšie otázky a odpovede'),
('3. Čo sú elektronické schránky a na čo ich môžem využívať?',	'Elektronická schránka v procese komunikácie občana a podnikateľa s úradmi slúži na elektronické doručovanie úradných rozhodnutí, notifikácií a iných správ od orgánov verejnej moci. Doručenie úradného rozhodnutia do elektronickej schránky má rovnaké právne účinky ako doručenie rozhodnutia v listinnej podobe do vlastných rúk klasickou poštou. Na to, aby vám mohol orgán verejnej moci doručiť do elektronickej schránky úradné rozhodnutie, musí byť vaša elektronická schránka aktivovaná na doručovanie.',	'Podnikanie',	508,	'Najčastejšie otázky a odpovede'),
('21. Je potrebné certifikáty so zrušenou platnosťou manuálne odstrániť? Ak áno, aký je postup?',	'Používateľom, ktorí využívajú operačný systém <b>MS Windows</b>, sa odporúča pred elektronickým podpisovaní dokumentov <b>vymazať si zo systému staré neplatné certifikáty</b> (z dôvodu neprehľadnosti pri výbere platného certifikátu). <a href="https://www.slovensko.sk/_img/CMS4/Navody/navod_na_odstranenie_certifikatov_so_zrusenou_platnostou.pdf">Návod na odstránenie certifikátov so zrušenou platnosťou...</a> [.pdf, 552.8 kB].

Používateľom, ktorí využívajú operačné systémy <b>GNU/Linux</b> a <b>macOS</b>, sa certifikáty automaticky neukladajú, preto ich <b>nemusia odstraňovať</b>.',	'Podnikanie',	526,	'Najčastejšie otázky a odpovede'),
('4. Ako si nastavím notifikácie na prijaté správy v elektronickej schránke?',	'Nastavenie notifikácie na prijaté správy do elektronickej schránky je možné nastaviť tak, že po prihlásení sa do elektronickej schránky kliknete na Nastavenia (symbol ozubeného kolieska), a následne na Nastavenia oznámení. V tabuľke si potom vyberiete priečinok, pre ktorý chcete nastaviť notifikácie (oznámenia) a zadáte údaje, kam sa notifikácie budú zasielať (ak máte vyplnené údaje v Profile, automaticky sa prednastavia). Konkrétny postup nájdete vo <a href="https://www.youtube.com/watch?v=4CizEEoX6ko">videonávode</a>.

Notifikácie je možné nastaviť:

- pri doručení novej správy do priečinku,
- pri presune správy do priečinku (v rozšírených nastaveniach),
- alebo obidve možnosti (v rozšírených nastaveniach).

Pri každej z možností môže byť notifikácia zaslaná prostredníctvom notifikačného modulu (uprednostnený kanál SMS/alebo e-mail, ktorý máte zvolený v sekcii „Profil“) alebo na inú emailovú adresu, ktorú si definujete. Pri druhej možnosti, je potrebné e-mailovú adresu vpísať do zoznamu adries.',	'Podnikanie',	509,	'Najčastejšie otázky a odpovede'),
('5. Ako si môžem vyhľadať elektronické služby?',	'Všetky úrady, na ktoré je možné odoslať elektronickú žiadosť sú dostupné v sekcii <a href="https://www.slovensko.sk/sk/najst-sluzbu">Nájsť službu</a>. Vyhľadávanie je fulltextové, do pola názov elektronickej služby stačí napísať kľúčové slovo a následne sa zobrazí zoznam registrovaných služieb. V prípade ak chcete adresovať žiadosť na konkrétny úrad vyhľadáte si ho v poli „Názov inštitúcie alebo úradu“. Elektronickú službu si môžete vyhľadať aj prostredníctvom navigácie podľa životných situácií umiestnenej na titulnej stránke. ',	'Podnikanie',	510,	'Najčastejšie otázky a odpovede'),
('6. Aké operačné systémy sú podporované na prihlásenie sa do elektronickej schránky a využívanie služieb portálu www.slovensko.sk?',	'<b> Prihlásenie do elektronickej schránky:</b>

<ul>
<li>Windows XP, 7, 8, 10</li>
<li>MAC OSX 10.x.x</li>
<li>Linux (Mint, Ubuntu, Debian)</li>
</ul>

<b>Podanie na Obchodný register SR:</b>

<ul>
<li>Windows XP, 7, 8, 10</li>
<li>MAC OSX 10.x.x</li>
<li>Linux (Mint, Ubuntu, Debian)</li>
</ul>

<b>Služba Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a>, ostatné služby:</b>

<ul>
<li>Windows XP, 7, 8, 10</li>
<li>MAC OSX 10.x.x</li>
<li>Linux (Mint, Ubuntu, Debian)</li>
</ul>

<b>Aplikácia <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a>:</b>

<ul>
<li>Windows XP SP3, Vista, 7, 8, 8.1, 10</li>
<li>Mac OS X 10.8/10.9/10.10.2/10.10.3/10.11</li>
<li>Linux (Mint 13/17 32-bit/64-bit, Ubuntu 12.04/14.04 32-bit/64-bit, Debian 7.0 32-bit/64-bit)</li>
</ul>

Pre tieto verzie operačných systémov Ministerstvo vnútra SR garantuje úplnú funkčnosť aplikácie <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a>.',	'Podnikanie',	511,	'Najčastejšie otázky a odpovede'),
('7. Ako si aktivujem elektronickú schránku na doručovanie?',	'Elektronickú schránku si aktivujete na doručovanie cez tlačidlo „Aktivovať schránku“. Tlačidlo sa nachádza v schránke vpravo hore vedľa mena majiteľa schránky. Po kliknutí na tlačidlo sa vám zobrazí samotná žiadosť o aktiváciu, ktorú je potrebné odoslať. Po jej úspešnom odoslaní budete mať elektronickú schránku aktivovanú na doručovanie a to ku dňu, ktorý ste uviedli v žiadosti, ale najskôr na tretí pracovný deň po jej doručení.

<b>Upozornenie:</b> Ak v žiadosti uvediete deň aktivácie, ktorý je rovnaký s dňom odoslania žiadosti, bude vám schránka aktivovaná následne <b>až o 3 pracovné dni.</b>',	'Podnikanie',	512,	'Najčastejšie otázky a odpovede'),
('8. Ako vytvorím <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> a čo na to potrebujem?',	'<a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">Kvalifikovaný elektronický podpis</a> vytvoríte aplikáciou na podpisovanie. Na ústrednom portáli sú na podpisovanie voľne dostupné aplikácie v sekciii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>. Pre systém MS Windows je k dispozícii aplikácia <a href="https://www.slovensko.sk/sk/na-stiahnutie">D.Signer/XAdES</a>, ako súčasť balíka D.Suite/<a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a>. (V prípade systémov Mac OS X a GNU/Linux sa Java verzia aplikácie D.Signer/XAdES automaticky stiahne a spustí prostredníctvom aplikácie D.Launcher, ktorú je potrebné v týchto systémoch nainštalovať.)',	'Podnikanie',	513,	'Najčastejšie otázky a odpovede'),
('9. Ako odstránim problém pri elektronickom podpisovaní?',	'V drvivej väčšine prípadov dokážete problém s elektronickým podpísaním podaní alebo dokumentov odstrániť rýchlo a jednoducho reštartovaním alebo aktualizáciou softvéru či počítača. Z uvedeného dôvodu vás prosíme, aby ste vyskúšali nižšie uvedené kroky v chronologickom poradí:

<ol>
<li> vypnite a zapnite Aplikáciu pre eID, ak problém pretrváva,</li>
<li>pripojte čítačku čipových kariet do iného USB vstupu, ak problém pretrváva,</li>
<li>vyskúšajte použiť iný internetový prehliadač, ak problém pretrváva,</>li
<li>reštartujte si počítač, ak problém pretrváva,</li>
<li>nainštalujte si najnovšiu verziu Aplikácie <a href="https://www.slovensko.sk/sk/na-stiahnutie">D.Suite/D.Launcher</a> pre  <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> a reštartujte si počítač, ak problém pretrváva,</li>
<li>nainštalujte si najnovšiu verziu  <a href="https://www.slovensko.sk/sk/na-stiahnutie">Aplikácie pre eID</a> na prihlásenie a reštartujte si počítač, ak problém pretrváva,</li>
<li>aktualizujte si <a href="https://dotnet.microsoft.com/en-us/download/dotnet-framework">.NET Framework</a> (ak používate operačný systém Windows) a reštartujte si počítač.</li>
</ol>',	'Podnikanie',	514,	'Najčastejšie otázky a odpovede'),
('10. Služby živnostenského registra - ako vytvorím  <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> pri podaniach na <a href="https://www.slovensko.sk/sk/slovnik/detail/_jkm">Jednotné kontaktné miesto</a> (JKM)?',	'Ak chcete podpísať podanie pri elektronických službách živnosteského registra na <a href="https://www.slovensko.sk/sk/slovnik/detail/_jkm">Jednotné kontaktné miesto</a> kvalifikovaným elektronickým podpisom, je potrebné sa prihlásiť na portál cez internetový prehliadač <b>Internet Explorer</b> v operačnom systéme MS Windows. Samotné podanie podpíšete kvalifikovaným elektronickým podpisom (KEP)  cez aplikáciu D.Signer/XAdES, ktorá je k dispozícii v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>. Prílohy, ktoré sú súčasťou podania, môžete podpísať aplikáciami QSign, Disig Desktop Signer alebo cez online aplikáciu http://zep.disig.sk.
Služby Jednotného kontaktného miesta sú v pôsobnosti Ministerstva vnútra SR.',	'Podnikanie',	515,	'Najčastejšie otázky a odpovede'),
('11. Služby obchodného registra - ako vytvorím <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> pri podaniach na Obchodný register SR?',	'Pri podpisovaní podania na obchodný register elektronický formulár vypísaný <a href="https://www.justice.gov.sk/sluzby/obchodny-register/">na stránke Ministerstva spravodlivosti SR</a> uložte do počítača vo formáte XML a podpíšte ho kvalifikovaným elektronickým podpisom alebo viacnásobným kvalifikovaným elektronickým podpisom vo formáte XAdES. Výstupom je ASiC kontajner (prípona súboru .asics, .asice, .scs, .sce). <i>Aktuálne je ešte podporovaný aj formát XAdES_ZEP EPES – výstupom je XML súbor s príponou .zepx</i>.

Prílohy k podaniu (napr. spoločenskú zmluvu, zakladateľskú zmluvu a pod.) naskenujte vo formáte PDF (preferovaný formát) alebo TIFF a podpíšte kvalifikovaným elektronickým podpisom alebo viacnásobným kvalifikovaným elektronickým podpisom vo formáte CAdES alebo XAdES.  Výstupom je ASiC kontajner (prípona súboru .asics, .asice, .scs, .sce).  Text na dokumentoch musí byť čitateľný. Nie sú podporované dokumenty vytvorené zaručenou konverziou. <i>Aktuálne je ešte podporovaný aj formát CMS – CAdES EPES – výstupom je dokument s príponou súboru .zep a formát XAdES_ZEP prípona súboru .zepx</i>.

Kvalifikované elektronické podpisy môžete vytvárať bezplatnými (napr. <a href="https://qesportal.sk/Portal/sk">ZEP.disig.sk</a>) alebo komerčnými aplikáciami <a href="https://www.qsign.sk/">QSign</a>, <a href="https://www.disig.sk/">Disig Desktop Signer</a>, <a href="https://www.podpisuj.sk/">Podpisuj.sk</a>, <a href="https://www.dstore.sk/shop/product/d-bulk-signer-standard-444?category=22#attr=442">D.Bulk Signer – Standard</a>. V prípade, že disponujete podpísanými súbormi s príponou .xzep a potrebujete ich priložiť k podaniu na obchodný register, premenujte príponu súboru na .zepx. (Pozn.: Formát podpisu XAdES_ZEP nemá predpísanú príponu a v praxi sa rovnocenne používajú .xzep aj .zepx, avšak pre podania do obchodného registra Ministerstvo spravodlivosti vyžaduje príponu .zepx).

Prílohy môžete do formátu .xzep podpisovať aj na <a href="https://obcan.justice.sk/podpisovanie-dokumentov">portáli Ministerstva spravodlivosti</a> alebo priložením prílohy a jej následným stiahnutím po podpísaní vo <a href="https://www.slovensko.sk/sk/detail-sluzby?externalCode=App.GeneralAgenda">všeobecnej agende</a>.

Služby Obchodného registra SR vypublikované na <a href="https://www.slovensko.sk/sk/titulna-stranka">www.slovensko.sk</a> v časti „Podnikateľ“, „Začiatok podnikania“, „Registrácia právnickej osoby“  sú v pôsobnosti Ministerstva spravodlivosti SR.',	'Podnikanie',	516,	'Najčastejšie otázky a odpovede'),
('12. Akú aplikáciu mám použiť na vytvorenie kvalifikovaného elektronického podpisu na portáli, ak nevyužívam kvalifikovaný certifikát na eID karte?',	'Aj v tomto prípade použite aplikáciu D.Signer/XAdES, ktorá je súčasťou balíka D.Suite/<a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> alebo aplikáciu D.Launcher, ktoré sú dostupné v sekciii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>. Pri inštalácii odporúčame postupovať podľa príslušnej <a href="https://www.slovensko.sk/static/zep/docs/Pouzivatelska_dokumentacia_pre_verzie_4_.NET_aplikacii_pre_ZEP/GOV_ZEP.252.2.170523.Instalacna_prirucka_D.Suite-eIDAS.v1.0.pdf">inštalačnej príručky</a> dostupnej v rovnakej sekcii.',	'Podnikanie',	517,	'Najčastejšie otázky a odpovede'),
('13. Existujú videonávody ako sa orientovať v elektronickej schránke ?',	'Áno. Na portáli sú zverejnené inštruktážne videá, ktoré jednoduchým spôsobom zobrazujú základné situácie, ktoré môžu nastať pri práci na portáli, s elektronickou schránkou či pri inštalácii základných aplikácií a programov. Jednotlivé na seba nadväzujúce videá nájdete v novovytvorenej sekcii s názvom <a href="https://www.slovensko.sk/sk/navody/videonavody">Videonávody</a>. ',	'Podnikanie',	518,	'Najčastejšie otázky a odpovede'),
('14. Aké prípony majú názvy elektronicky podpísaných súborov (.asice, .xzep, .pdf, ...) ?',	'Súbory obsahujúce elektronické podpisy alebo pečate môžu v názve súboru používať rôzne prípony, avšak samotná prípona súboru nijako negarantuje, že súbor je skutočne podpísaný. 

Pre zistenie, či je súbor autorizovaný platným kvalifikovaným elektronickým podpisom alebo kvalifikovanou elektronickou pečaťou, je potrebné využiť službu overenia podpisov. Pre informatívne overenie je k dispozícii <a href="https://www.slovensko.sk/sk/e-sluzby/sluzba-overenia-zep">služba na slovensko.sk</a>.

V prípade súborov obsahujúcich elektronické podpisy môže ísť o:

<ul>
<li>​podpisové kontajnery, ktoré obvykle obsahujú samostatné elektronické dokumenty a samostatné podpisy alebo pečate.</li>
<li>podpisy obsahujúce nimi podpisované dokumenty ako svoju súčasť.</li>
<li>podpisované elektronické dokumenty, ktoré obsahujú podpisy ako svoju súčasť.</li>
</ul>

Podpisové kontajnery vytvorené v súlade s platnou legislatívou účinnou od 1. júla 2016 - Vykonávacie rozhodnutie Komisie (EÚ) č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a>:

<ul>
<li>podpisové kontajnery ASiC-E používajú prípony: <b>.asice, .sce, .zip</b></li>
<li>podpisové kontajnery ASiC-S používajú prípony: <b>.asics, .scs, .zip</b></li>
</ul>

Podpisové kontajnery vytvorené na základe slovenských pravidiel účinných do 30. júna 2016 alebo po tomto dátume v prípade vzájomnej dohody všetkých strán príslušnej komunikácie:

<ul>
<li>podpisové kontajnery ZEPf obvykle používajú príponu: <b>.zep</b></li>
<li>podpisové kontajnery a podpisy XAdES_ZEP používajú obvykle prípony: <b>.xzep, .zepx</b> (nesprávne sa niekedy používa prípona .xml alebo .zep)</li>
</ul>

Elektronické dokumenty, ktoré obsahujú podpisy ako svoju súčasť:

<ul>
<li>PDF súbory obsahujúce podpis PAdES používajú príponu: <b>.pdf</b></li>
<li>XML súbory obsahujúce podpis XAdES enveloped používajú príponu: <b>.xml (alebo inú)</b> (Tieto podpisy nie sú v súčasnosti v Centrálnej elektronickej podateľni podporované.)</li>
</ul>

Elektronické podpisy, ktoré obsahujú nimi podpisované elektronické dokumenty ako svoju súčasť:
(Tieto podpisy nie sú v súčasnosti v Centrálnej elektronickej podateľni podporované.)

<ul>
<li>podpisy CAdES (enveloping) používajú príponu: <b>.p7m</b></li>
<li>podpisy XAdES enveloping používajú príponu: <b>.xml</b></li>
</ul>

Elektronické podpisy oddelené od podpísaných elektronických dokumentov:
(Tieto podpisy nie sú v súčasnosti v Centrálnej elektronickej podateľni samostatne podporované ako samostatné, musia sa nachádzať v podpisovom kontajneri.)

<ul>
<li>podpisy CAdES "detached" používajú príponu: <b>.p7s</b></li>
<li>podpisy XAdES "detached" používajú príponu: .xml</li>
</ul>

Časové pečiatky oddelené od elektronických dokumentov na ktoré sa vzťahujú:

<ul>
<li>používajú príponu: <b>.tst</b></li>
</ul>

Elektronické dokumenty, ktoré sú podpísané alebo zapečatené v podpisových kontajneroch alebo v elektronických podpisoch, môžu mať rôzne formáty, napríklad .pdf, .txt, .png. Orgány verejnej moci sú <a href="https://www.slovensko.sk/sk/navody/videonavody">povinné prijímať a vytvárať formáty elektronických dokumentov predpísané vo Výnose č. 55/2014 Z.z</a> o štandardoch pre informačné systémy verejnej správy SR.

Overovanie elektronických podpisov a pečatí XAdES enveloping (.xml), XAdES enveloped (.xml), CAdES enveloping (.p7m) a samostatných časových pečiatok dokumentov (.tst) nie sú na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v súčasnosti plne podporované.

Pre tieto formáty je preto potrebné použiť inú službu overenia podpisov. Podpisy "detached" oddelené od podpísaných dokumentov (.p7s, .xml) je možné na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v súčasnosti spracúvať a  overovať len v podpisovom kontajneri.

Podrobnosti o podporovaných formátoch podpisov na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> môžete nájsť <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">v dokumentácii funkčnosti centrálnej elektronickej podateľne</a>.',	'Podnikanie',	519,	'Najčastejšie otázky a odpovede'),
('15. Aké formáty elektronických podpisov musia orgány verejnej moci prijímať a vytvárať? ',	'Povinné formáty kvalifikovaných elektronických podpisov a pečatí ako aj povinné formáty podpisových kontajnerov <a href="https://www.nbu.gov.sk/wp-content/uploads/doveryhodne-sluzby/docs/Povinne-formatyQESpre-subjekt-verejneho-sektora.pdf">sú uvedené v osobitnom dokumente NBÚ</a> a vyplývajú z nariadenia Európskeho parlamentu a Rady (EÚ) č. <a href="https://eur-lex.europa.eu/legal-content/SK/ALL/?uri=CELEX%3A32014R0910">910/2014</a> a z Vykonávacieho rozhodnutia Komisie (EÚ) č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a>. Ide o formáty XAdES, CAdES, PAdES a ASiC, ktorých obvyklé prípony sú uvedené v predošlej otázke. 

Pred nadobudnutím účinnosti tejto legislatívy boli v Slovenskej republike definované aj formáty XAdES_ZEP (.xzep, .zepx) a ZEPf (.zep), ktoré boli informatívne uvedené aj <a href="http://www.nbusr.sk/wp-content/uploads/doveryhodne-sluzby/docs/formaty_zep.pdf">v štandardoch NBÚ</a> účinných do 30.6.2016.
Po tomto dátume nie sú orgány verejnej moci povinné v zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/20210623.html#paragraf-47.odsek-1.pismeno-c">§ 47 písm. c) Vyhlášky č. 78/2020 Z. z. o štandardoch pre IT VS</a> a tiež v zmysle <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> prijímať formát XAdES_ZEP (.xzep, .zepx), nakoľko požiadavky tohto formátu sú nad rámec požiadaviek prílohy Vykonávacieho rozhodnutia Komisie (EÚ) č. 2015/1506. Formát XAdES_ZEP je podľa NBÚ možné zaradiť medzi alternatívne formáty validované podľa konkrétnych referenčných metód pre zdokonalený elektronický podpis podľa vykonávacieho rozhodnutia Komisie č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a>.
Z formátu ZEPf (.zep) sú orgány verejnej moci podľa <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> povinné prijímať podpis CAdES (prípadne XAdES), nakoľko tento je v súlade s prílohou Vykonávacieho rozhodnutia Komisie (EÚ) č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a> a je ho možné validovať ako samostatný podpis súboru .eml (obsahujúci base64 kódované súbory) alebo vložiť do ASiC a validovať ako ASiC v súlade s nariadením Európskeho parlamentu a Rady č. <a href="https://eur-lex.europa.eu/legal-content/SK/ALL/?uri=CELEX%3A32014R0910">910/2014</a>.

Formát XAdES_ZEP (.xzep, .zepx) a kontajnery ZEPf (.zep) sa v zmysle platnej legislatívy už nemajú vytvárať. Za vytvorenie podpisu alebo pečate vo formáte, ktoré nie sú v súlade s Vykonávacím rozhodnutím Komisie (EÚ) č. 2015/1506, sa v zmysle § 14 ods. 3 zákona č. 272/2016 Z.z. môže orgánu verejnej moci udeľovať sankcia.

Zároveň sa v zmysle zákona č. 95/2019 Z. z. môže dotknutému orgánu verejnej moci udeliť sankcia za porušovanie štandardov pre vytváranie podpisových kontajnerov predpísaných vo Vyhláške č. 78/2020 Z. z. o štandardoch pre IT VS.',	'Podnikanie',	520,	'Najčastejšie otázky a odpovede'),
('16. Ako zistím, či je súbor elektronicky podpísaný? ',	'Súbor podpísaný kvalifikovaným elektronickým podpisom alebo opatrený kvalifikovanou elektronickou pečaťou nemusí obsahovať písomnú podobu vlastnoručného podpisu alebo pečiatky.

Pre overenie, či je súbor elektronicky podpísaný, je potrebné použiť aplikáciu alebo službu určenú na spracovanie a overovanie elektronických podpisov.

Funkcia informatívneho overovania podpisov je dostupná pre dokumenty v elektronických správach v rámci funkcií elektronických schránok. Pre informatívne overenie podpisov je možné využiť aj verejnú <a href="https://www.slovensko.sk/sk/e-sluzby/sluzba-overenia-zep">službu overovania podpisov</a>.

Stránka <a href="https://www.slovensko.sk/sk/titulna-stranka">slovensko.sk</a> podporuje informatívne overovanie podpisov elektronických dokumentov len v <a href="https://www.slovensko.sk/sk/faq/_vykon-verejnej-moci-organy-ve#neplatnost">niektorých formátoch</a>. Pre overenie podpisov pre iné formáty súborov odporúčame využiť iné dostupné certifikované nástroje.

<b>Akým spôsobom je možné získať záväzné overenie platnosti kvalifikovaného elektronického podpisu?</b>

Na Ústrednom portáli verejnej správy sa používa výlučne informatívne overenie podpisov a pečatí. Rovnako aj ďalšie verejne poskytované služby majú obvykle iba status informatívneho overenia.

Skutočnosť, že výsledok overenia podpisov je informatívny, neznamená, že výsledok overenia je nespoľahlivý alebo nedôveryhodný. Znamená to, že daná služba nemá štatút kvalifikovanej dôveryhodnej služby v zmysle článku 33 a 40 Nariadenia Európskeho parlamentu a Rady EÚ č. 910/2014. V zmysle uvedeného právneho predpisu nie je povinnosť poskytovať kvalifikovanú službu validácie a preto sa v súčasnosti nemusí používať ani na ústrednom portáli. Takúto službu na ústrednom portáli verejnej správy však do budúcna pripravujeme.

Zoznam poskytovateľov služieb, ktoré majú štatút kvalifikovanej služby je možné nájsť v <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/home">dôveryhodných zoznamoch zverejňovaných Európskou komisiou</a>, pričom sú označené ako "Qualified validation service...".',	'Podnikanie',	521,	'Najčastejšie otázky a odpovede'),
('17. Ako môžem otvoriť elektronicky podpísané dokumenty?',	'Elektronicky podpísané dokumenty sa prenášajú najmä v špecifických formátoch podpisových kontajnerov alebo podpisov, pre ktorých otvorenie je potrebný špecifický softvér.

Elektronické schránky na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> priamo umožňujú stiahnuť podpísaný elektronický dokument v jeho podpísanej pôvodnej forme (obvykle v podpisovom kontajneri), ale aj uložiť z podporovaného podpisového kontajnera samotný elektronický dokument. Je na to možné využiť funkcie "Stiahnuť", "Stiahnuť nepodpísaný obsah" alebo funkciu "Zobraziť" po kliknutí na súbor v elektronickej správe. V prípade použitia funkcie uloženia nepodpísaného obsahu však výsledný súbor neobsahuje podpis.

<p style="color:red;">Aplikácia D.Viewer bola z menu v novej elektronickej schránke vypustená, nahradili ju pokročilé funkcie s detailmi o podpisoch a kontajneroch. D. Viewer je naďalej použiteľný po stiahnutí a otvorení podpísaného súboru v počítači. V aplikácii D.Viewer sa nachádzajú informácie o podpisoch vo väzbe na dokumenty, nie je však možné overenie podpisov a zobrazenie údajov vyplnených podľa elektronického formulára je obmedzené len na malú časť existujúcich formulárov.</p>

Pre zobrazenie súborov bez použitia funkcie elektronickej schránky je možné použiť aj samostatnú aplikáciu D.Viewer pre MS Windows dostupnú na stránke "Na stiahnutie" alebo jej <a href="https://www.slovensko.sk/static/zep/java_apps/dviewer_standalone_2.0.jnlp">Java verziu pre MS Windows, MacOS X a GNU/Linux</a>, prípadne iné aplikácie od iných výrobcov ako napríklad <a href="https://qes.webnode.sk/na-stiahnutie/">QES</a> aplikáciu (postup je uvedený na druhej strane <a href="https://qes.webnode.sk/">úvodnej stránky QES</a>) alebo bezplatnú aplikáciu <a href="https://www.dstore.sk/blks">D.Bulk Signer – Start</a>, <a href="https://www.disig.sk/sk/produkty/elektronicky-podpis/disig-desktop-signer/">Disig Desktop Signer</a> či <a href="https://www.qsign.sk/">Ardaco QSign</a>.

Formáty XAdES_ZEP (.xzep, zepx) a ZEPf (.zep), ktoré vznikli v Slovenskej republike pred účinnosťou Nariadenia č. 910/2014 nie sú používané mimo SR a nemusia byť ani akceptované členskými štátmi EÚ. Formát ZEP je možné po otvorení v bezplatnej <a href="https://qes.webnode.sk/na-stiahnutie/">QES</a> aplikácii uložiť do ASiC-S kontajnera.

Podpisové kontajnery ASiC obsahujúce podpísané súbory PDF, TXT alebo PNG je v prípade technicky znalejších používateľov možné otvoriť aj pomocou aplikácie pre otváranie ZIP súborov, keďže formát ASiC bol vytvorený aj z formátu ZIP. Používateľ môže ASiC súbor priamo otvoriť v aplikácii pre otváranie ZIP súborov alebo súbor pre účely takéhoto otvorenia dočasne premenovať z ".asice" / ".asics" na ".zip" a priamo otvoriť príslušnou aplikáciou.

Do budúcna Národná agentúra pre sieťové a elektronické služby pripravuje verejne dostupnú aplikáciu podporujúcu zobrazovanie všetkých vyplnených formulárov. Dovtedy je bezplatná podpora pre zobrazovanie údajov vyplnených podľa všetkých elektronických formulárov zverejnených v module elektronických formulárov len v elektronickej schránke.',	'Podnikanie',	522,	'Najčastejšie otázky a odpovede'),
('18. Ktorý údaj je pre použitie dokumentu na právne úkony smerodajný? Platnosť podpisového certifikátu elektronického podpisu/elektronickej pečate alebo časovej pečiatky?',	'Zákon č. 305/2013 Z. z. o e-Governmente uvádza v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20170301#paragraf-23.odsek-1">§ 23 ods. 1</a> pravidlá pri výkone verejnej moci pre používanie časovej pečiatky a platného podpisu bez časovej pečiatky. Pri výkone verejnej moci je potrebné rozlišovať, či je náležitosťou právneho úkonu:

<ul>
<li>iba vlastnoručný podpis (pre ktorý sa v listinnom svete nevyžaduje úradné osvedčenie, a teda v elektronickom svete v čase platnosti certifikátu podpisu nie je potrebná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>) alebo</li>
<li>úradne osvedčený vlastnoručný podpis, kde sa <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> zahrnie do autorizácie (pričom sa zároveň odporúča pripájať časovú pečiatku aj k podpisu, pokiaľ je potrebné preukazovať čas, kedy autorizácia nastala. Viac informácií nájdete v <a href="https://www.mirri.gov.sk/sekcie/informatizacia/governance-a-standardy/zakon-o-e-governmente/vykladove-stanoviska-a-usmernenia/index.html">Usmernení k § 23 ods. 1 písm. b) zákona o e-Governmente</a> Úradu podpredsedu vlády SR pre investície a informatizáciu (dnes Ministerstvo investícií, regionálneho rozvoja a informatizácie).</li>
</ul>

Pre platnosť kvalifikovaných časových pečiatok je rozhodujúci stav "granted" uvedený v <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/home">dôveryhodnom zozname</a> pri príslušnej službe časových pečiatok. Podrobnosti o platnosti časových pečiatok je možné nájsť v <a href="https://www.slovensko.sk/sk/faq/faq-najcastejsie-otazky#akajeplatnost">otázke č. 20</a>.

Z uvedeného vyplýva nasledovné:

<ul>
<li>ak pre daný právny úkon netreba úradné osvedčenie podpisu a certifikát podpisu je platný, nezáleží na tom, či časová
pečiatka je alebo nie je platná (rovnako ako je jedno, či <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> je alebo nie je).</li>
<li>ak pre daný právny úkon netreba úradné osvedčenie podpisu a certifikát podpisu je neplatný, avšak
<a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> podpisu je platná a bola vyhotovená v čase platnosti podpisu, tak je dôležitá platnosť časovej pečiatky.</li>
<li>ak pre daný právny úkon treba úradné osvedčenie podpisu, pričom certifikát podpisu je neplatný ale <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>
podpisu platná je, tak je kľúčová práve <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>, ak bola vytvorená ešte v čase platnosti certifikátu podpisu.</li>
</ul>

Podrobnosti o platnosti časových pečiatok a čase dopĺňania časových pečiatok sú uvedené v <a href="https://www.slovensko.sk/sk/faq/faq-najcastejsie-otazky#akajeplatnost">otázke č. 20</a>.
Národný bezpečnostný úrad Slovenskej republiky vydal <a href="http://tl.nbu.gov.sk/kca/tsl/SchemaDohladu.pdf">Schému dohľadu kvalifikovaných dôveryhodných služieb</a> (vychádzajúca z vykonávajúceho rozhodnutia Komisie EÚ k <a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> č. <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/?uri=OJ:JOL_2015_235_R_0005">2015/1505</a>), ktorá definuje povinnosť v prípade, ak ide o kvalifikovanú dôveryhodnú službu uchovávania kvalifikovaných elektronických podpisov a kvalifikovaných elektronických pečatí, aby:

<ul>
<li>bolo dodržiavané pravidlo <b>dopĺňania kvalifikovanej elektronickej časovej pečiatky</b> do podpisu alebo pečate alebo</li>
<li>bolo dodržiavané pravidlo <b>dopĺňania samostatnej kvalifikovanej elektronickej časovej pečiatky</b> v čase platnosti predchádzajúcej
kvalifikovanej elektronickej časovej pečiatky, ktorá zahŕňa položky podpisu, pečate, elektronických časových pečiatok a dokumentov, ktoré boli podpísané alebo zapečatené.</li>
</ul>

Tzn., že platnosť podpisu sa dá predlžovať prepečiatkovaním časovými pečiatkami, pričom:

<ul>
<li>prvá <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> musí byť pripojená k podpisu ešte v čase platnosti podpisu,</li>
<li>ďalšie časové pečiatky musia byť použité na poslednú časovú pečiatku ešte v čase platnosti poslednej časovej pečiatky a tak ďalej.</li>
</ul>',	'Podnikanie',	523,	'Najčastejšie otázky a odpovede'),
('19. Zabezpečí elektronická schránka platnosť podpisov počas celej doby uloženia správy v schránke?',	'Elektronická schránka nezabezpečuje dlhodobú platnosť autorizačných prostriedkov (podpisov/pečatí/časových pečiatok) v elektronických správach uložených v elektronickej schránke. Ak si správy necháte uložené v elektronickej schránke a budú obsahovať podpisy alebo pečate bez časovej pečiatky, dátumom konca platnosti podpisového certifikátu nebude možné  podpisy/pečate automatizovanými prostriedkami overiť ako platné.

Ak platné podpisy/pečate obsahujú kvalifikovanú časovú pečiatku pridanú v čase platnosti podpisového certifikátu, bude ich možné overiť ako platné počas doby, kedy je certifikát časovej pečiatky zverejnený v <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/home">dôveryhodnom zozname</a> so stavom "Granted". Kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> teda môže zabezpečiť dlhodobú platnosť, napríklad aj viac ako 10 rokov. Čas platnosti nie je vopred určený a je potrebné ho určovať na základe analýzy rizík. Podrobnejšie informácie k tejto problematike sú zverejnené napríklad v odpovediach na otázky na nasledujúcich webových stránkach:

<ul>
<li><a href="https://www.mirri.gov.sk/wp-content/uploads/2018/10/5.3..pdf">vicepremier.gov.sk</a> (často kladené otázky k zákonu o e-Governmente)</li>

<li><a href="https://www.slovensko.sk/sk/faq/_najcastejsie-otazky-a-odpovede#akajeplatnost">slovensko.sk</a> (otázka „Aká je platnosť podpisov vyhotovených certifikátmi, ktorých platnosť bola zrušená?“)</li>
</ul>

Pokiaľ podpis obsahuje kvalifikovanú časovú pečiatku pridanú v čase platnosti podpisu/pečate, môže dosiahnuť výrazne dlhší čas ako je limit pre bezplatné ukladanie dokumentov v module dlhodobého uchovávania.
V grafickom prostredí elektronickej schránky je možné pre jednotlivé elektronické správy využiť funkciu „Vložiť záznam do MDU“, pre ich uloženie do modulu dlhodobého uchovávania, v ktorom sa pre podpisy bez časovej pečiatky automaticky pripojí kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>, ak to bude technicky možné. Jednotlivé podpisy sú v module dlhodobého uchovávania chránené integritným podpisom počas celej doby ich uloženia (predvolene na 1 rok), pričom po automatickom ukončení uloženia budú vrátené do elektronickej schránky v stave, v akom boli do modulu dlhodobého uchovávania vložené a podpisy, ktoré pri vkladaní do modulu dlhodobého uchovávania časovú pečiatku neobsahovali, budú doplnené o kvalifikovanú časovú pečiatku.

Orgány verejnej moci, právnické osoby a fyzické osoby podnikatelia integrovaní na služby <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> majú možnosť pre zabezpečenie dlhodobej automatizovanej overiteľnosti platnosti podpisov/pečatí využiť služby poskytovateľov komerčných služieb alebo modul dlhodobého uchovávania <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> a predlžovať v ňom dobu uloženia záznamov aj na viac rokov za podmienok, ktoré sa dohodnú v dohode o integračnom zámere.',	'Podnikanie',	524,	'Najčastejšie otázky a odpovede'),
('20. Aká je platnosť podpisov vyhotovených certifikátmi, ktorých platnosť bola zrušená? ',	'V prípade, že ku kvalifikovanému elektronickému podpisu bola pred zrušením platnosti kvalifikovaného certifikátu podpisovateľa pripojená kvalifikovaná elektronická <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> podpisu, podpis je možné validovať ako platný počas celej doby platnosti tejto časovej pečiatky. Platnosť sa v zmysle <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> určuje podľa stavu platnosti časovej pečiatky v dôveryhodnom zozname zverejňovanom NBÚ. Pre platnosť kvalifikovaných časových pečiatok je rozhodujúci stav "granted" uvedený v <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/home">dôveryhodnom zozname</a> pri príslušnej službe časových pečiatok. Dátum konca platnosti uvedený v certifikáte kvalifikovanej časovej pečiatky nemá vplyv na platnosť časových pečiatok vytvorených do tohto dátumu a obmedzuje iba poskytovateľa služby vo vytváraní nových časových pečiatok súkromným kľúčom s týmto certifikátom (napr. <a href="https://www.etsi.org/deliver/etsi_ts/119300_119399/119312/01.02.01_60/ts_119312v010201p.pdf">kapitola 9.4 technickej špecifikácie ETSI TS 119 312 V1.2.1 - 2017-05</a>). Čas, kedy je možné očakávať zrušenie stavu dôveryhodnosti služby, (t.j. napr. na stav "withdrawn") nie je určený. Služba má kvalifikovaný štatút aj po čase, kedy sa už <a href="https://www.slovensko.sk/sk/slovnik/detail/_sukromny-kluc">súkromný kľúč</a> služby používaný na vytváranie podpisov, vrátane podpisov časových pečiatok nesmie použiť a v tomto období poskytuje informácie o stave vydaných certifikátov, pečiatok alebo iných výstupov svojej služby pre dlhodobé použitie a minimálne vedie tieto informácie 10 rokov aj po ukončení použitia súkromného kľúča.

Potrebu opätovne pečiatkovať údaje kvalifikovanými časovými pečiatkami je potrebné v zmysle <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> určovať na základe analýzy rizík. Tá môže zahŕňať napríklad odolnosť algoritmov a funkcií, riziká a informácie o ukončení služby overenia platnosti zo strany poskytovateľa a pod. Reťazenie časových pečiatok je potrebné v čase, kedy je malé bezpečnostné riziko že aktuálna <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> by mohla byť oslabená prelomením algoritmov, zabezpečenia, kompromitovaním poskytovateľa či iným rizikom.

V elektronických podateľniach sa platnosť podpisov overuje pri doručovaní resp. spracovaní elektronických dokumentov, kedy sa môže chýbajúca kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> podpisu doplniť, alebo sa pomocou kvalifikovanej časovej pečiatky vyhotoví externá evidencia existencie jedného alebo viacerých podpisov a pri validácii podpisov sa vychádza z tejto evidencie v ďalšom konaní.

Ak bol platný <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> vyhotovený bez kvalifikovanej elektronickej časovej pečiatky podpisu pred zrušením kvalifikovaného certifikátu podpisovateľa a v príslušnej podateľni nebola vyhotovená dôveryhodná evidencia do času zrušenia certifikátu, napr. pomocou kvalifikovanej časovej pečiatky, nie je už možná automatizovaná validácia platnosti podpisu, platnosť takéhoto podpisu je možné validovať manuálne, kedy sa predloží dôkaz, že podpis existoval, alebo bol vyhotovený, pred zrušením platnosti kvalifikovaného certifikátu podpisovateľa. Podrobnosti o postupe validácie nájdete v <a href="https://www.nbu.gov.sk/doveryhodne-sluzby/dohlad/index.html">schéme dohľadu NBÚ</a>.',	'Podnikanie',	525,	'Najčastejšie otázky a odpovede'),
('22. Kedy sa elektronická úradná správa považuje za doručenú?',	'Podľa zákona o e-Governmente sa elektronická úradná správa považuje za doručenú:

<ul>
<li><b>uložením elektronickej úradnej správy</b> (okamih, odkedy je elektronická úradná správa objektívne dostupná prijímateľovi v elektronickej schránke) - ak je adresátom orgán verejnej moci,</li>
<li><b>deň bezprostredne nasledujúci po uložení elektronickej úradnej správy</b> - ak nie je adresátom orgán verejnej moci a nedoručuje sa do vlastných rúk,</li>
<li><b>dňom, hodinou, minútou a sekundou uvedenými na elektronickej doručenke alebo márnym uplynutím úložnej lehoty podľa toho, ktorá skutočnosť nastane skôr, a to aj vtedy, ak sa adresát o tom nedozvedel</b> - ak nie je adresátom orgán verejnej moci a doručuje sa do vlastných rúk</li>
</ul>',	'Podnikanie',	527,	'Najčastejšie otázky a odpovede'),
('23. Aký dátum a čas obsahuje elektronická doručenka?',	'Elektronická doručenka obsahuje <b>údaje o dátume a čase, kedy bola elektronická úradná správa (rozhodnutie) doručená</b>.

<ul>
<li>Údaje sa automaticky generujú po úspešnej autorizácii a po uložení doručovanej správy do elektronickej schránky.</li>
<li>Následne sa adresátovi obsah elektronickej úradnej správy fyzicky sprístupní v jeho elektronickej schránke v priečinku „Prijaté".</li>
<li>V prípade preťaženia systému, výpadku alebo inej poruchy sa však elektronická úradná správa doručí až po odstránení vzniknutého problému.</li>
</ul>',	'Podnikanie',	528,	'Najčastejšie otázky a odpovede'),
('24. Čo mám robiť, ak nemôžem z objektívnych dôvodov elektronický úradný dokument prevziať a oboznámiť sa s jeho obsahom?',	'Zákonodarca pamätal aj na situácie, keď si z objektívnych príčin bez vlastného pričinenia (napr. z dôvodu hospitalizácie a pod.) nemôžete doručené elektronické úradné dokumenty prevziať a oboznámiť sa s ich obsahom. Na tento účel bol v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180401.html#paragraf-33.odsek-1">§ 33 ods. 1</a> zákona o e-Governmente ustanovený inštitút neúčinnosti elektronického doručenia. Ako postupovať pri návrhu na neúčinnosť doručenia nájdete v sekcii <a href="https://www.slovensko.sk/sk/navody">Návody</a>, v časti určenej pre fyzické alebo právnické osoby, v návode s názvom <a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/postup_neucinnost_dorucovania.pdf">Postup pri návrhu na neúčinnosť doručovania</a>.',	'Podnikanie',	529,	'Najčastejšie otázky a odpovede'),
('25. Ako postupovať po zobrazení chybovej hlášky pri elektronickom udeľovaní oprávnenia na prístup a disponovanie s elektronickou schránkou právnickej osoby? ',	'Právnická osoba (ďalej len „PO“), ktorej bola zriadená elektronická schránka, je jej majiteľom a je oprávnená disponovať s ňou v súlade a spôsobom ustanoveným zákonom o e-Governmente. Pristupovať a disponovať s elektronickou schránkou PO môže automaticky zo zákona <b>štatutárny orgán alebo člen štatutárneho orgánu PO</b>, ktorej bola elektronická schránka zriadená, alebo <b>osoba, ktorej sa udelilo oprávnenie</b>.

Plné alebo čiastočné oprávnenie na prístup a disponovanie s elektronickou schránkou je možné udeliť a zmenu tohto oprávnenia vykonať prostredníctvom listinnej žiadosti dostupnej na portáli slovensko.sk v sekcii „<a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">Tlačivá</a>“ alebo cez určenú funkciu priamo v elektronickej schránke. Viac informácií nájdete v <a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/udelenie_opravnenia_FO.pdf">návode</a>...

Majiteľ elektronickej schránky (v tomto prípade spoločnosť) môže poveriť inú spoločnosť správou elektronickej schránky, to znamená, že jej môže dať povolenie na jednotlivé úkony v schránke alebo na plnú manipuláciu s touto elektronickou schránkou.

UPOZORNENIE: Nižšie uvedený postup, prosím, aplikujte iba v prípade, ak môžete postupovať oprávnenie na ďalšie osoby a ak sa vám pri elektronickom udeľovaní oprávnenia cez funkciu elektronickej schránky zobrazila chybová hláška. V praxi sme uvedený problém zaznamenali v prípade viacstupňového udeľovania oprávnení medzi právnickými osobami. <i>Príklad: štatutár s.r.o. udelí oprávnenie s možnosťou jeho postúpenia inej s.r.o. a tá následne oprávni komanditnú spoločnosť, ktorej komplementárom je ďalšia právnická osoba.</i>

<ol>
<li>Ak máte oprávnenie na prístup a disponovanie s elektronickou schránkou PO a na postúpenie tohto oprávnenia, prihláste sa na stránke <a href="https://www.slovensko.sk/sk/titulna-stranka">www.slovensko.sk</a> v mene PO a na úvodnej stránke portálu kliknite na „<b>Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a></b>“.</li>
<li>Vyberte poskytovateľa služby – <b>Národnú agentúru pre sieťové a elektronické služby</b>.</li>
<li>V predmete správy uveďte: <b>Žiadosť o udelenie oprávnenia na prístup a disponovanie s elektronickou schránkou – elektronicky</b>.</li>
<li>Do správy uveďte stručný popis žiadosti , teda že sa žiadate o udelenie oprávnenia na prístup a disponovanie s elektronickou schránkou, no napriek tomu, že môžete postúpiť oprávnenie na ďalšiu osobu, sa vám ho nepodarilo urobiť elektronicky (t.j. pri zobrazení chybovej hlášky pri elektronickom udeľovaní oprávnenia na prístup a disponovanie s elektronickou schránkou).</li>
<li><b>Priložte vyplnenú žiadosť</b>, ktorá obsahuje základné údaje o tom, kto komu udeľuje oprávnenie (meno, priezvisko, rodné číslo, prípadne IČO), dobu platnosti oprávnenia (odkedy dokedy), rozsah oprávnenia (úplný alebo čiastočný prístup). Uvedená žiadosť je dostupná vo formáte PDF na portáli slovensko.sk, konkrétne v sekcii „<a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">Tlačivá</a>“.</li>
<li><b>Správu podpíšte platným kvalifikovaným elektronickým podpisom (KEP) osoby</b>, ktorá má možnosť postúpiť oprávnenie.</li>
<li>Správu odošlite.</li>
<li>Do elektronickej schránky vám bude následne doručená informačná správa o postúpení oprávnenia.</li>
</ol>',	'Podnikanie',	530,	'Najčastejšie otázky a odpovede'),
('26. Čo znamená informácia o nevalidnom PDF formáte vo výsledku overenia podpisov?',	'Ide iba o informatívny výsledok validácie PDF súboru voči formátu PDF/A-1a v špecifickom validátore používanom na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, ktorý v niektorých prípadoch nesprávne vyhodnocuje vlastnosti formátu súboru. Tento výsledok nemá vplyv na platnosť autorizácie.

Vo výsledku overenia podpisov je vždy dôležité, či je platná autorizácia. Výsledok validácie objektu uvedeného až v nižšej časti výsledku overenia nemá vplyv na platnosť autorizácie.

Podľa účinného Výnosu o štandardoch pre ISVS č. 55/2014 z.Z., je verejná správa od marca 2018 povinná akceptovať podpísané PDF súbory aj v iných verziách než je PDF/A-1a. Zároveň je povinná v prípade odosielania a zverejňovania podpísaných PDF súborov používať formát PDF/A-1 alebo PDF/A-2.

Validácia objektu je v súčasnosti vykonávaná len voči špecifikácii PDF/A-1a, <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> zatiaľ nepodporuje validáciu voči PDF/A-2. V minulosti bola verejná správa povinná akceptovať a vyhotovovať len PDF/A-1a, ak išlo o autorizované súbory.',	'Podnikanie',	531,	'Najčastejšie otázky a odpovede'),
('27. Ako je možné získať kvalifikovanú časovú pečiatku?',	'Pri vytváraní kvalifikovaného elektronického podpisu (<a href="https://www.slovensko.sk/sk/faq/faq-najcastejsie-otazky#ako4">Vytvorenie kvalifikovaného elektronického podpisu</a>) prostredníctvom portálu slovensko.sk v tzv. konštruktore správy (po potvrdení úspešného podpísania v aplikácii D.Signer/XAdES) sa automaticky k podpisu pripojí aj kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>.

V prípade, ak používateľ pripojí do prílohy podania už podpísaný elektronický dokument, ktorý v podpise časovú pečiatku neobsahuje, portál kvalifikovanú časovú pečiatku do takéhoto podpisu nepripája. Ak pre autorizáciu daného dokumentu v zmysle zákona nepostačuje vlastnoručný podpis a vyžaduje sa úradne osvedčený podpis a používateľ disponuje už podpísaným dokumentom bez kvalifikovanej časovej pečiatky, môže kvalifikovanú časovú pečiatku podpisu získať vytvorením podpisu na portáli alebo pre doplnenie kvalifikovanej časovej pečiatky využiť služby iného poskytovateľa služieb.',	'Podnikanie',	532,	'Najčastejšie otázky a odpovede'),
('28. Čo je to Web SSO (Single Sign-On)?',	'Modul IAM (Identity and Access Management) poskytuje funkcionalitu overenia identity používateľa a odovzdáva identifikačné údaje (federáciu identity) ostatným zapojeným systémom. Výhodou použitia jednotného prihlásenia je to, že používateľ môže prechádzať celým prostredím na poskytovanie služieb bez nutnosti znova zadávať svoje identifikačné údaje. Z pohľadu používateľa je jedno, v ktorom systéme svoje prihlásenie realizuje, žiadny z partnerských systémov (Service Provider Portál) už od neho opätovne prihlásenie nepožaduje.

Modul IAM funguje na princípe Single Sign-On (SSO), čo znamená „jednotné prihlásenie sa“. Používateľ sa prihlási prostredníctvom prihlasovacej webovej stránky s využitím autentifikačného prostriedku, čim preukaze svoju totožnosť.

<a href="https://www.slovensko.sk/sk/sluzba-web-sso">Viac o možnostiach služby Web Single Sign-On...</a>

V prípade otázok alebo nejasností môžete zatelefonovať na Ústredné kontaktné centrum. Jeho pracovníci vám radi poradia na telefónnom čísle +421235803083 od pondelka do piatka v čase od 8.00 h do 18.00 h, v stredu až do 21.00 h. Mimo uvedeného času môžete svoje otázky zaslať prostredníctvom <a href="https://helpdesk.slovensko.sk/new-incident/">elektronického kontaktného formulára</a>.',	'Podnikanie',	533,	'Najčastejšie otázky a odpovede'),
('8. Ako sa vytvára autentifikačný certifikát?',	'Na vytvorenie autentifikačného certifikátu a privátneho kľúča je možné použiť napríklad voľne dostupný softvér OpenSSL s nasledovnými príkazmi:

<ul>
<li>penssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 730 -out certificate.pem</li>
<li>openssl x509 -outform der -in certificate.pem -out certificate.cer</li>
<li>openssl pkcs12 -export -out key.p12 -inkey key.pem -in certificate.pem</li>
</ul>

<p>Po spustení prvého príkazu si aplikácia vyžiada údaje o identite. V údajoch sa nesmie vyplniť žiadna položka okrem CN - Subject.</p>',	'Podnikanie',	582,	'Register autentifikačných certifikátov'),
('29. Môže sa občan inej krajiny EÚ prihlásiť na slovenské portály? Môže Slovák využívať elektronické služby v iných krajinách EÚ?',	'Na portáli slovensko.sk je možné prihlásiť sa pomocou <a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> Node. Prihlásenie je určené pre zahraničné fyzické osoby, ktoré sú držiteľmi zahraničného prihlasovacieho prostriedku vydaného v niektorej z krajín EÚ. <a href="https://www.slovensko.sk/sk/eidas/informacie-o-prihlaseni-cez-ei">Viac informácií...</a>

Držitelia slovenských občianskych preukazov s čipom (eID) alebo slovenských dokladov o pobyte cudzinca s čipom už môžu využívať elektronické služby verejného sektora  na portáli Európskej komisie, na podporu európskych občianskych iniciatív a na portáloch Česka, Belgicka, Portugalska, Španielska a Talianska. Do 18. decembra 2020 majú všetky členské štáty EÚ povinnosť sprístupniť svoje elektronické služby občanom Slovenskej republiky a cudzincom s pobytom v Slovenskej republike.

Ďalšie užitočné informácie nájdete aj v <a href="https://www.slovensko.sk/_img/CMS4/eIDAS/FAQ_eIDAS.pdf">často kladených otázkach k elektronickej identifikácii na základe eIDAS</a>.',	'Podnikanie',	534,	'Najčastejšie otázky a odpovede'),
('30. Prečo a ako si môžem pred podpisom skontrolovať verzie PDF?',	'Technológia PDF (z angličtiny Portable Document Format) umožňuje vytvoriť dokument s viacerými prekrývajúcimi sa vrstvami. Dokument s typom podpisu PADES tak môže v niektorej vrstve obsahovať text, s ktorým by ste nemali možnosť sa oboznámiť. Preto odporúčame, aby ste si PDF dokument najskôr stiahli a otvorili v programe, ktorý umožňuje sledovanie vrstiev (napríklad Adobe Reader) a až následne po preštudovaní jeho kompletného obsahu ho podpísali.',	'Podnikanie',	535,	'Najčastejšie otázky a odpovede'),
('1. Na čo slúži elektronická schránka?',	'Orgány verejnej moci prijímajú do schránky elektronické podania (žiadosti) od občanov, podnikateľov a iných inštitúcií. Schránka občanov a podnikateľov je určená na prijímanie elektronických úradných dokumentov (rozhodnutí) od orgánov verejnej moci. Komunikácia prostredníctvom elektronickej schránky nahrádza klasický spôsob komunikácie s verejnou správou a je ekvivalentná k podaniam a doručovaniu dokumentov v listinnej podobe.
Prostredníctvom schránky je ďalej možné prijímať správy, notifikácie o odoslaní a doručení a zisťovať stav odoslaných podaní.',	'Podnikanie',	536,	'Elektronické schránky'),
('2. Aké základné zásady bezpečnosti treba pri práci s elektronickou schránkou dodržiavať?',	'Pri práci s elektronickou schránkou a eID používateľ pracuje s citlivými údajmi, a preto by nikdy nemal po prihlásení do svojej schránky umožniť prístup neoprávneným osobám k otvorenému webovému prehliadaču, resp. aplikácii, v ktorej sa do schránky prihlásil. Neodporúča sa prihlasovať sa do schránky a na portál použitím eID na zdieľaných počítačoch, v ktorých používateľ nemá žiadnu kontrolu nad nainštalovaným softvérom a hardvérom. Po odhlásení zo schránky sa odporúča skontrolovať, či odhlásenie prebehlo úspešne a následne zatvoriť webový prehliadač.',	NULL,	537,	'Elektronické schránky'),
('3. Komu sa elektronická schránka zriaďuje?',	'Podľa zákona č. 305/2013 Z. z. o e-Governmente sa elektronická schránka zriaďuje pre fyzické osoby, podnikateľov, právnické osoby, orgány verejnej moci a pre subjekty medzinárodného práva. Elektronické schránky sa zriaďujú na portáli Ústrednom portáli verejnej správy na adrese www.slovensko.sk.',	'Podnikanie',	538,	'Elektronické schránky'),
('4. Ako požiadam o zriadenie elektronickej schránky?',	'<b>Ak ste občan SR, elektronická schránka sa vám zriadi automaticky po dovŕšení 18. roku života</b>. Elektronické schránky fyzických osôb – podnikateľov a právnických osôb sa zriaďujú priebežne od 31. januára 2014 v nadväznosti na registráciu subjektu v príslušnom registri. V týchto prípadoch nie je rovnako potrebné o zriadenie elektronickej schránky žiadať.

Orgány verejnej moci žiadajú o zriadenie elektronickej schránky podľa Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2019/438/">438/2019 Z. z.</a>, ktorou sa vykonávajú niektoré ustanovenia zákona o e-Governmente zaslaním listinného alebo elektronického formulára pre nahlásenie údajov na účely zriadenia elektronickej schránky orgánu verejnej moci.',	'Podnikanie',	539,	'Elektronické schránky'),
('5. Musím svoju elektronickú schránku využívať? Musím sa do nej pravidelne prihlasovať?',	'Nie, ak ste fyzická osoba, nemusíte. Avšak v prípade, že si ju aktivujete na doručovanie, vám do nej môže orgán verejnej moci doručiť úradné rozhodnutie elektronicky. Takéto rozhodnutie je rovnocenné s tým, ktoré by vám zaslal v listinnej forme. Či si schránku aktivujete na doručovanie, alebo nie, je vaším rozhodnutím.',	NULL,	540,	'Elektronické schránky'),
('6. Čo potrebujem na prihlásenie sa do elektronickej schránky podľa zákona o e-Governmente na ústrednom portáli?',	'Na to, aby ste sa úspešne prihlásili na portál a mohli vstúpiť do elektronickej schránky,  je  potrebné vlastniť občiansky preukaz s elektronickým čipom (tzv. eID kartu). Občiansky preukaz musí mať aktivovanú Online eID funkciu, to znamená, že ste si k nemu definovali  bezpečnostný osobný kód (BOK).
Ďalej je nevyhnutné vlastniť čítačku kariet, mať inštalovaný príslušný softvér – aplikáciu <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a> (slúži na prihlasovanie) a ovládače k čítačke kariet, ktoré sú k dispozícii v časti <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.',	NULL,	541,	'Elektronické schránky'),
('7. Ako  mám postupovať pri prihlásení sa do elektronickej schránky?',	'Pred samotným prihlásením je potrebné, aby ste mali:

<ul>
<li>občiansky preukaz s elektronickým čipom a definovaným bezpečnostným osobným kódom,</li>
<li>čítačku elektronických kariet,</li>
<li>na počítači nainštalovaný softvér na prihlasovanie (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a>) a ovládače k čítačke kariet.</li>
</ul>

Do elektronickej schránky sa prihlásite cez funkciu „Prihlásiť sa na portál“, ktorá sa nachádza na prihlasovacom paneli v pravom hornom rohu obrazovky titulnej stránky www.slovensko.sk.
Ďalej postupujte podľa <a href="https://www.slovensko.sk/_img/CMS4/Navody/postup_prihlasenie_na_portal.pdf">Návodu na prihlásenie sa na portál a do elektronickej schránky</a> [.pdf, 704.6 kB].

Prvým krokom na prihlásenie je vaša úspešná autentifikácia na portáli, následne sa do vašej elektronickej schránky dostanete kliknutím na ikonu obálky (Schránka) v prihlasovacom paneli v pravom hornom rohu obrazovky.
V prípade, že ste oprávnenou osobou a konáte v mene iného subjektu (fyzickej osoby, právnickej osoby, orgánu verejnej moci), po úspešnej autentifikácii si vyberte z ponúkaného rozbaľovacieho menu tú identitu, v mene ktorej sa chcete prihlásiť.',	NULL,	542,	'Elektronické schránky'),
('8. Neviem sa prihlásiť do elektronickej schránky, čo mám urobiť?',	'V prípade, že prihlásenie do vašej elektronickej schránky zlyhalo, skontrolujte, prosím, či boli splnené nasledujúce podmienky:

<ul>
<li>Ste držiteľom občianskeho preukazu s čipom vydaného po 1. 12. 2013 a máte na ňom aktivovaný elektronický čip a aktivovaný bezpečnostný osobný kód.</li>
<li>Máte nainštalované príslušné softvérové vybavenie (aplikáciu <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a> a príslušné ovládače pre čítačky kariet, ktoré sú dostupné v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>).</li>
<li>Postupovali ste podľa <a href="https://www.slovensko.sk/_img/CMS4/Navody/postup_prihlasenie_na_portal.pdf">návodu na prihlásenie sa do elektronickej schránky</a>.</li>
</ul>

Ak sa vám napriek dodržaniu všetkých spomínaných podmienok a krokov nepodarilo do elektronickej schránky prihlásiť, kontaktujte Ústredné kontaktné centrum na telefónnom čísle  02/35 803 083 v pracovných dňoch, pondelok až piatok, od 8.00 do 18.00 h, v stredu do 21.00 h alebo prostredníctvom <a href="https://helpdesk.slovensko.sk/new-incident/">kontaktného formulára</a>.',	NULL,	543,	'Elektronické schránky'),
('9. Na čo slúži aktivácia elektronickej schránky na doručovanie?',	'V prípade, že si elektronickú schránku aktivujete na doručovanie, sprístupníte ju na doručovanie elektronických úradných dokumentov (úradných rozhodnutí). Úradné rozhodnutia vám môžu zasielať do elektronickej schránky iba orgány verejnej moci.

Odosielanie elektronických podaní prostredníctvom ústredného portálu nesúvisí s aktiváciou vašej elektronickej schránky. To znamená, že <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a> môžete odoslať či už je vaša schránka aktivovaná na doručovanie alebo nie. Rozdiel je len v tom, že do aktivovanej schránky vám orgán verejnej moci môže doručiť elektronické úradné rozhodnutie, ale v prípade, že schránku aktivovanú na doručovanie nemáte, rozhodnutie vám orgán musí doručiť listinne.

<i><b>Poznámka:</b> Na podanie návrhu na vykonanie exekúcie musí mať oprávnený (alebo jeho zástupca) elektronickú schránku aktivovanú na doručovanie, v opačnom prípade podáva návrh prostredníctvom ktoréhokoľvek exekútora (<a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/1995/233/20190101#paragraf-48.odsek-8">§ 48 ods. 8</a> zákona č. 233/1995 Z. z. o súdnych exekútoroch a exekučnej činnosti).</i>',	NULL,	544,	'Elektronické schránky'),
('10. Ako si svoju schránku aktivujem na doručovanie?',	'Elektronickú schránku si môžete aktivovať na doručovanie prostredníctvom Žiadosti o aktiváciu elektronickej schránky, ktorá je dostupná vo vašej schránke prostredníctvom tlačidla „Aktivovať“.

Elektronickú schránku budete mať aktivovanú na doručovanie ku dňu, ktorý uvediete v žiadosti, <b>najskôr na tretí pracovný deň po jej doručení</b>. Viac informácií o postupe aktivácie schránky na doručovanie nájdete v <a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/navod_aktivacia_na_dorucovanie.pdf">návode na aktiváciu elektronickej schránky na doručovanie</a>.

Informácie spojené s procesom povinnej aktivácie schránok právnických osôb a organizačných zložiek so sídlom v SR si prečítajte v <a href="https://www.slovensko.sk/sk/faq/faq-aktivacia-po/_povinna-aktivacia-schranok-pra">najčastejších otázkach a odpovediach týkajúcich sa povinnej aktivácie</a>.',	NULL,	545,	'Elektronické schránky'),
('11. Ak je moja elektronická schránka aktivovaná na doručovanie, musím komunikovať s orgánmi verejnej moci elektronicky?',	'Ak máte svoju elektronickú schránku aktivovanú na doručovanie, predpokladá sa, že preferujete elektronickú komunikáciu s verejnou správou. Stále však môžete svoje podania uskutočniť aj v klasickej listinnej forme.',	NULL,	546,	'Elektronické schránky'),
('12. Ako splnomocniť niekoho na prístup do svojej elektronickej schránky?',	'Splnomocnenie alebo oprávnenie určenej fyzickej, resp. právnickej osoby je možné vykonať prostredníctvom žiadosti Udelenie oprávnenia fyzickej/právnickej osobe na zastupovanie subjektu, ktorá je sprístupnená vo vašej elektornickej schránke v časti Vytvorenie žiadosti (pôvodná verzia schránky) alebo v sekcii Nastavenia v časti Oprávnenia osôb (nová verzia schránky). Po schválení žiadosti je možné vybrať rozsah oprávnení pre splnomocnenú osobu pomocou funkcie elektronickej schránky. Viac informácií, ako postupovať nájdete v sekcii <a href="https://www.slovensko.sk/sk/navody">Návody</a>.

Žiadosť o udelenie prístupu do elektronickej schránky môžete poslať aj listinne vyplnením príslušného tlačiva, ktoré nájdete v sekcii <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">tlačivá</a>.',	'Podnikanie',	547,	'Elektronické schránky'),
('13. Sme zahraničná osoba/subjekt, ako si zriadime elektronickú schránku a ako sa do nej prihlásime?',	'Na prihlasovanie sa do elektronických schránok zriadených podľa zákona o e-Governmente je možné použiť na účely autentifikácie (procesu overenia identity, ktorá sa prihlasuje) iba občiansky preukaz s čipom a bezpečnostným osobným kódom, doklad o pobyte s elektronickým čipom a bezpečnostným osobným kódom alebo alternatívny autentifikátor.

Ak ide o cudzinca alebo o štatutára zahraničnej právnickej osoby, títo nemajú možnosť získať občiansky preukaz s čipom, ktorého vydanie sa viaže na slovenské štátne občianstvo a trvalý pobyt na území SR. V súlade so zákonom č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2011/404/20170501">404/2011 Z. z.</a> o pobyte cudzincov môžu na príslušnom policajnom útvare SR požiadať o vydanie dokladu o pobyte s čipom.
<b>Od 1. marca 2017</b> môže zahraničný štatutár, ktorý nemá nárok na vydanie dokladu o pobyte s čipom, v zmysle vyhlášky Ministerstva vnútra Slovenskej republiky požiadať o vydanie <a href="https://www.slovensko.sk/sk/oznamy/detail/_alternativny-autentifikator-pr">alternatívneho autentifikátora</a>. Viac informácií k <a href="https://www.slovensko.sk/sk/agendy/agenda/_zahranicny-statutar/">zahraničným štatutárom</a>...',	'Podnikanie',	548,	'Elektronické schránky'),
('9.  Aké parametre musí spĺňať certifikát?',	'<ul>
<li>Certifikát môže byť vydaný samotným žiadateľom (tzv. self-signed certifikát). V prípade certifikátu vydaného certifikačnou autoritou nie je potrebné údaje o tejto autorite vydávajúcej certifikát zasielať do NASES. Register autentifikačných certifikátov obsahuje všetky informácie  o platnosti certifikátov a nijako nezohľadňuje stav autentifikačného certifikátu podľa CRL vydávajúcej certifikačnej autority. Certifikáty je potrebné rušiť zaslaním žiadosti do registra.
<li>Formát certifikátu X.509 v kódovaní DER podľa ISO/IEC 8825-1 (obvyklá prípona súboru: „.cer“)
<li>Platnosť: 2 roky (729 až 731 dní)
<li>Distinguished name (DN): Môže obsahovať výlučne Common name (CN) a nesmie obsahovať žiadne ďalšie údaje.
<li>Common name (CN):
<p>- v prípade fyzickej osoby: rc-rodné číslo (príklad: rc-8001011234 ),</p>
<p>- v prípade právnickej osoby: ico-identifikačné číslo organizácie _ suffix (príklad: ico-12345678 alebo ico-12345678_10001 alebo ico-123456789012 )
Dĺžka kľúča: 2048 bit</p></li>
<li>Algoritmus: Public Key Algorithm: RSA, Signature Algorithm - jedna z možností: sha256WithRSAEncryption, sha512WithRSAEncryption, SHA256withRSA SHA512withRSA</li>
</ul>',	'Podnikanie',	583,	'Register autentifikačných certifikátov'),
('14. Ako si mám deaktivovať doručovanie do schránky?',	'Elektronickú schránku si môžu v súčasnosti deaktivovať iba fyzické osoby a fyzické osoby podnikatelia (prípadne právnické osoby nezapísané v Obchodnom registri SR do 1. júna 2020 - t. j. do ich povinnej aktvácie zo zákona o e-Governmente) prostredníctvom elektronickej žiadosti, ktorá je dostupná priamo v ich elektronickej schránke v sekcii „Nastavenia" v časti „Informácie o schránke". Pri položke „Stav schránky“ je možnosť „Deaktivovať schránku“ . V Žiadosti o deaktiváciu elektronickej schránky na doručovanie stačí zvoliť požadovaný dátum deaktivácie a správu odoslať.  V prípade zadania aktuálneho dátumu, bude schránka deaktivovaná ku dňu uvedenému v žiadosti, najskôr na tretí pracovný deň po doručení žiadosti.  O deaktiváciu elektronickej schránky je možné požiadať aj listinne (napr. osoby vo výkone trestu odňatia slobody alebo vo väzbe, ktoré nemajú prístup k počítaču a pod.). Tlačivo je dostupné v sekcii <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/4f6a8f60-ad8a-4e5e-83a5-a5f500b5eab5">Tlačivá</a>.

<b>Upozornenie!</b>
Orgány verejnej moci a právnické osoby so sídlom v SR zapísané do Obchodného registra SR si nemôžu schránku deaktivovať z vlastnej vôle, lebo im bola aktivovaná na doručovanie priamo zo zákona o e-Governmente.',	'Podnikanie',	549,	'Elektronické schránky'),
('15. Môžem svoju elektronickú schránku zrušiť?',	'Elektronická schránka sa aktom vôle zrušiť nedá. Schránka bude zrušená a jej obsah vymazaný iba v prípade smrti jej majiteľa, resp. zániku právnickej osoby alebo orgánu verejnej moci, a to po uplynutí 3 rokov odo dňa, keď sa o tejto skutočnosti dozvie zriaďovateľ z príslušného referenčného registra.',	'Podnikanie',	550,	'Elektronické schránky'),
('16. Ako získam ako dedič prístup do elektronickej schránky zosnulého živnostníka?',	'Ak živnostník zomrie, môžu v živnosti až do skončenia dedičského konania pokračovať dedičia, pozostalý manžel, aj keď nie je dedičom, ak je spoluvlastníkom majetku používaného na prevádzkovanie živnosti a ak v živnosti nepokračujú dedičia alebo správca dedičstva, ak ho ustanovil súd.

<b>Pokračovanie v živnosti musia však tieto osoby samé oznámiť živnostenskému úradu</b>, a to v lehote jedného mesiaca od úmrtia živnostníka, správca dedičstva do jedného mesiaca od ustanovenia do funkcie. Po oznámení týchto skutočností príde automaticky Národnej agentúre pre sieťové a elektronické služby (<a href="https://www.slovensko.sk/sk/slovnik/detail/_nases">NASES</a>) aktualizovaná dávka údajov zo živnostenského registra a následne sa umožní prístup takejto osoby do elektronickej schránky zosnulého živnostníka.',	'Podnikanie',	551,	'Elektronické schránky'),
('17. Doplňujúce najčastejšie otázky a odpovede',	'Pokiaľ ste v predchádzajúcom článku nenašli riešenie svojho problému týkajúceho sa elektronických schránok, vypracovali sme pre vás doplňujúce <a href="https://www.slovensko.sk/sk/faq/_doplnujuce-otazky-a-odpovede-t">otázky a odpovede</a>, v ktorých nájdete bližšie informácie.',	'Podnikanie',	552,	'Elektronické schránky'),
('1. Aké elektronické služby môžem využívať prostredníctvom ústredného portálu?',	'Sprístupnené elektronické služby pre občanov a podnikateľov nájdete v sekcii <a href="https://www.slovensko.sk/sk/najst-sluzbu">Nájsť službu</a>. V nej si službu vyberiete zadaním kľúčových slov do vyhľadávacích polí, ktorými sú názov elektronickej služby, názov úradu alebo inštitúcie alebo výberom zo zoznamu životných situácií.
Elektronické služby si môžete vyhľadať aj prostredníctvom navigácie podľa jednotlivých životných situácií.

Elektronické služby si zverejňujú na ústrednom portáli samotné orgány verejnej moci. Takýmito službami sú napr. služby obchodného a živnostenského registra, katastra nehnuteľností, Úradu pre verejné obstarávanie, služby Centrálnej ohlasovne alebo evidencie vozidla.
Popri týchto službách má každý orgán verejnej moci automaticky pridelenú aj službu Všeobecnej agendy. Prostredníctvom tejto služby môžete orgánu verejnej moci doručiť <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a> do jeho elektronickej schránky zriadenej na ústrednom portáli, ktoré nemá špecifickú formu a náležitosti predpísané právnymi normami.

Zoznam služieb sa priebežne rozširuje so sprístupňovaním elektronických služieb jednotlivých rezortov verejnej správy. Prehľad jednotlivých služieb spolu s názvom orgánu verejnej moci, ktorý je aktualizovaný týždenne, nájdete v <a href="https://www.slovensko.sk/sk/zoznam-zverejnenych-sluzieb">zozname zverejnených služieb</a>.',	'Podnikanie',	553,	'Elektronické podania'),
('2. Odkedy je možné urobiť podanie do elektronických schránok zriadených podľa zákona o e-Governmente?',	'Podania do elektronických schránok zriadených podľa zákona o e-Governmente a prihlasovanie k elektronickým službám ústredného portálu prostredníctvom občianskeho preukazu s čipom je sprístupnené od 3. februára 2014.',	'Podnikanie',	554,	'Elektronické podania'),
('3. Aké formáty môže mať príloha, ktorá je súčasťou elektronického podania?',	'Konkrétne požiadavky na prílohy k elektronickému podaniu, ak sú vyžadované, by mali byť špecifikované pri každej elektronickej službe samotným orgánom verejnej moci, ktorý je adresátom podania. Formáty elektronických dokumentov, ktoré sú povinné osoby podľa zákona č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2019/95/">95/2019 Z.z.</a> povinné prijímať a čítať, sú predpísané vo Vyhláške č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch pre informačné technológie verejnej správy.

<b>Príklady požiadaviek na prílohy:</b>

<b>Služba Obchodného registra SR - Návrh na zápis, zmenu a výmaz údajov v obchodnom registri</b> -  naskenované prílohy k návrhu musia byť vo formáte PDF (preferovaný formát) alebo TIFF podpísané kvalifikovaným elektronickým podpisom. Je nutné, aby skenovaný dokument bol v odtieňoch sivej s rozlíšením najviac 200 dpi (dots per inch/počet bodov na jeden palec).

<b>Služba Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a></b> - prílohy k podaniu Všeobecnej agendy môžu byť v akomkoľvek formáte, avšak podpísať kvalifikovaným elektronickým podpisom sa na portáli môžu iba prílohy vo formáte .pdf, .xml (vo formáte elektronického formulára registrovaného na ústrednom portáli), .txt a .png. Na podpisovanie je určený balík aplikácií D.Suite/<a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> alebo aplikácia D.Launcher, ktoré sú k dispozícii v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.

<h2>Povinne prijímané formáty elektronických dokumentov</h2>
<b>Podpísané elektronické dokumenty</b>

V zmysle Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch pre informačné technológie verejnej správy platí povinnosť prijímať a čítať nasledovné formáty elektronických dokumentov podpísaných elektronickým podpisom alebo opatrených elektronickou pečaťou:

<ul>
<li>Portable Document Format (.pdf) vo verzii A-1 (PDF/A-1), A-2 (PDF/A-2), A-3 (PDF/A-3),</li>
<li>Portable Document Format (.pdf) minimálne vo verzii 1.3 a maximálne vo verzii 2.0 v súlade s <a href="LINK">SLOVO</a>§ 19 písm. a) bod 2,</li>
<li>Plain Text Format v kódovaní UTF-8 (.txt),</li>
<li>Portable Network Graphics (.png),</li>
<li>XMLDataContainer (.xml) - kontajner XML údajov podľa prílohy č. 7 Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch alebo</li>
<li>v iných formátoch elektronických dokumentov, ak sa na tom zasielateľ a prijímateľ dohodnú.</li>
</ul>

Elektronické dokumenty musia byť obvykle spolu s elektronickým podpisom alebo elektronickou pečaťou, ktorými sa dokumenty autorizujú, vložené:

<ul>
<li>v podpisovom kontajneri ASiC (.asics, .scs, .asice, .sce) alebo</li>
<li>v inom podpisovom kontajneri, ak sa na tom zasielateľ a prijímateľ dohodnú (napríklad .zep, .xzep).</li>
</ul>

V prípade elektronických dokumentov vo formáte PDF môžu byť elektronický podpis alebo elektronická pečať, ktorými sa dokumenty autorizujú, pripojené ako súčasť súboru vo formáte PDF (.pdf), a preto nemusia byť vložené v podpisovom kontajneri. V takomto prípade ide o takzvaný PAdES podpis.

Formáty podpisov, ktoré sú orgány verejnej moci povinné prijímať, sú uvedené v <a href="https://www.slovensko.sk/sk/faq/_vykon-verejnej-moci-organy-ve#formaty">samostatnej otázke</a>.

<b>Poznámka:</b>
Povinné osoby môžu podpisovať iné ako povinné formáty len ak sa na tom všetky strany príslušnej komunikácie dohodnú, s vedomím možných škôd a nezrovnalostí v ďalšom konaní vyplývajúcich z takého postupu. Povinné osoby môžu v prípade formátu PDF podpisovať len PDF/A-1, PDF/A-2 a PDF/A-3.

<b>Čo znamená informácia o nevalidnom PDF formáte vo výsledku overenia podpisov?</b>
Vo výsledku overenia podpisov je dôležité, či je platná autorizácia. Výsledok validácie objektu uvedeného až v nižšej časti výsledku overenia nemá vplyv na platnosť autorizácie. <a href="https://www.slovensko.sk/sk/faq/_najcastejsie-otazky-a-odpovede#nevalidnyformatpdf">Viac...</a>

<b>Nepodpísané elektronické dokumenty</b>

V zmysle Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch platí povinnosť prijímať a čítať aj nepodpísané elektronické dokumenty, ak možnosť podávania nepodpísaných elektronických dokumentov príslušné konanie pripúšťa. Medzi povinne prijímané formáty nepodpísaných elektronických dokumentov uvedené v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/20220101.html#paragraf-18">§ 18 až § 25</a> Vyhlášky č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">78/2020 Z. z.</a> o štandardoch patria napríklad:

Textové súbory vo formátoch:

<ul>
<li>Hypertext Markup Language (.html, .htm) alebo Extensible Hypertext Markup Language (.xhtml),</li>
<li>Portable Document Format (.pdf) minimálne vo verzii 1.3 a maximálne vo verzii 2.0, ak neobsahujú dynamický obsah uvedený v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/20220101.html#paragraf-19">§ 19</a> Vyhlášky o štandardoch,</li>
<li>Plain Text Format v kódovaní UTF-8 (.txt), alebo</li>
<li>v iných formátoch, ak vopred súhlasia všetky zúčastnené strany a technické podmienky to umožňujú.</li>
</ul>

Grafické súbory pre rastrovú grafiku vo formátoch:

<ul>
<li>Graphics Interchange Format (.gif),</li>
<li>Portable Network Graphics (.png),</li>
<li>Joint Photographic Experts Group (.jpg, .jpeg, .jpe, .jfif, .jfi, .jif),</li>
<li>Tagged Image File Format (.tif, .tiff) vo verzii 6.0, najmä jednostránkové Baseline TIFF, alebo</li>
<li>v iných formátoch, ak vopred súhlasia všetky zúčastnené strany a technické podmienky to umožňujú.</li>
</ul>

Grafické súbory pre vektorovú grafiku vo formátoch:

<ul>
<li>Scalable Vector Graphics (.svg), alebo</li>
<li>v iných formátoch, ak vopred súhlasia všetky zúčastnené strany a technické podmienky to umožňujú.</li>
</ul>',	'Podnikanie',	555,	'Elektronické podania'),
('4. Musím <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a>, ktoré zasielam orgánu verejnej moci, podpísať kvalifikovaným elektronickým podpisom?',	'Kvalifikovaný elektronický podpis je ekvivalentom vlastnoručného podpisu. Vlastnoručným podpisom sa potvrdzujú právne úkony v listinnej podobe.
To znamená, že tie konania (žiadosti, podnety, návrhy a pod.), ktoré vyžadujú od občana vlastnoručný podpis pri listinnom vybavovaní, je potrebné v elektronickej podobe podpísať kvalifikovaným elektronickým podpisom.
Je preto dôležité si pred odoslaním samotného podania prečítať návod na vyplnenie formulára (služby), v ktorom orgány verejnej moci uvádzajú povinné náležitosti podania.',	'Podnikanie',	556,	'Elektronické podania'),
('5. Môžem používať už v minulosti zakúpený a platný kvalifikovaný certifikát na tvorbu elektronického podpisu pri podaniach na ústrednom portáli?',	'Áno, na tvorbu kvalifikovaného elektronického podpisu na portáli môžete využívať už v minulosti zakúpený platný kvalifikovaný certifikát, ktorý vlastníte napríklad na USB nosiči.',	'Podnikanie',	557,	'Elektronické podania'),
('10. Aké údaje má certifikát správne obsahovať?',	'Vygenerovaný certifikát so správnou hodnotou CN a dobou platnosti 2 roky je znázornený na Obr. 1.

<ul>
<li>Povinná hodnota CN je v tvare ico-XXXXXXXX , kde „XXXXXXXX" je IČO subjektu, pre ktorý certifikát registrujete. Ak by ste mali zriadenú organizačnú jednotku, tak sa uvádza v tvare ico-XXXXXXXX_suffix.</li>
<li>Povinná doba platnosti je aktuálne 2 roky (t. j. 729 až 731 dní).</li>
</ul>

<p>Správny tvar subjektu certifikátu, algoritmu a dĺžky kľúča je zobrazený na Obr. 2.</p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/certifikat-ukazka.png">
</picture></p>

<p>Obr. 1 - Hodnota CN bez suffixu/Hodnota CN so suffixom</p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/certifikat-ukazka4.png">
</picture></p>

<p>Obr. 2 - Správny tvar držiteľa, algoritmu a dĺžky kľúča</p>',	'Podnikanie',	584,	'Register autentifikačných certifikátov'),
('6. Čo znamená elektronické doručovanie a <a href="https://www.slovensko.sk/sk/slovnik/detail/_fikcia-dorucenia">fikcia doručenia</a>?',	'Doručovanie v tomto prípade znamená doručovanie elektronického podania alebo elektronického dokumentu elektronicky, a to do schránky, ktorá je aktivovaná na doručovanie.

Doručovať do elektronickej schránky je možné v zmysle zákona o e-Governmente nie do vlastných rúk (obyčajne) alebo do vlastných rúk s fikciou doručenia. Ak ide o doručovanie do vlastných rúk s fikciou doručenia, adresátovi (ak nie je orgánom verejnej moci) sa sprístupní obsah správy až po potvrdení notifikácie o doručení (zadaním BOK kódu).  Elektronická správa sa považuje za doručenú <b>buď márnym uplynutím úložnej lehoty, alebo potvrdením notifikácie o doručení</b>. Úložná lehota je podľa zákona o e-Governmente 15 dní a plynie odo dňa nasledujúceho po dni uloženia elektronickej správy. Uložením elektronickej správy sa rozumie okamih, odkedy je správa objektívne dostupná v elektronickej schránke adresáta.
Uplatnenie fikcie doručenia teda znamená, že ak v úložnej lehote nepotvrdíte notifikáciu o doručení, rozhodnutie <b>sa bude považovať márnym uplynutím tejto lehoty za doručené, t. j. nastanú jeho právne účinky</b>.

Osobitné predpisy môžu upraviť spôsoby doručovania elektronickými prostriedkami inak.',	'Podnikanie',	558,	'Elektronické podania'),
('7. Ako sa dozviem o tom, že moje <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicke-podanie">elektronické podanie</a> bolo doručené na orgán verejnej moci?',	'Zákon č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20170301">305/2013 Z. z.</a> o e-Governmente definuje na tento účel doručenku. Telo správy doručenky obsahuje stručný text, ktorý prijímateľa prehľadne informuje o dátume a čase doručenia elektronického dokumentu. V detaile správy sú dostupné bližšie informácie, ktoré sa prijímateľovi elektronickej správy zobrazia  po kliknutí na „Podrobné informácie“. V prípade záujmu si tak môžete pozrieť napr. kto je odosielateľom správy, prijímateľ správy, dátum doručenia, identifikátor správy alebo elektronického dokumentu a iné. Táto funkcionalita je funkčná vo všetkých typoch internetových prehliadačov okrem Internet Explorer.
Vzor doručenky pri službe Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a> je zobrazený na obrázku.

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/dorucenka.png">
</picture>

Obrázok - Vzor doručenky pri službe Všeobecná <a href="https://www.slovensko.sk/sk/slovnik/detail/_agenda">agenda</a>',	'Podnikanie',	559,	'Elektronické podania'),
('8. Čo znamená, keď mi do schránky príde Potvrdenie o odoslaní elektronického podania?',	'Potvrdenie o odoslaní elektronického podania je notifikačná správa, ktorá slúži na účely preukázania presného momentu odoslania elektronického podania, ktoré má význam najmä z pohľadu počítania a zachovávania niektorých (procesnoprávnych) lehôt ustanovených právnymi predpismi. Odosielateľom tejto informácie je Ministerstvo investícií, regionálneho rozvoja a informatizácie SR, ktoré je správcom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, a preto sa vám v časti odosielateľ zobrazí text „Ústredný portál verejnej správy“. Potvrdenie sa zasiela odosielateľovi aj adresátovi (orgánu verejnej moci) a obsahuje údaje o odosielateľovi a prijímateľovi podania, časový údaj o prijatí podania modulom G2G na spracovanie, identifikátor a predmet správy a môže obsahovať aj doplnkové informácie uvedené v definícii dátovej štruktúry.

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/potvrdenie_o_odoslani.jpg">
</picture>

Obrázok - Vzor potvrdenia o odoslaní',	'Podnikanie',	560,	'Elektronické podania'),
('9. Do elektronickej schránky mi prišla ,,Notifikácia o doručení k...", čo to znamená a ako mám postupovať?',	'Ak vám orgán verejnej moci doručuje do elektronickej schránky úradné rozhodnutie do vlastných rúk, zobrazí sa vám v schránke najskôr „Notifikácia o doručení k...". Na to, aby sa vám sprístupnil obsah rozhodnutia, musíte v zmysle zákona o e-Governmente najprv potvrdiť prijatie tejto notifikácie o doručení cez funkciu „Prevziať", zadaním bezpečnostného osobného kódu (BOK). <b>Po prevzatí notifikácie o doručení sa vám obratom zobrazí príslušné úradné rozhodnutie (aj s prílohami), ktoré bude zároveň uložené v priečinku „Prijaté správy".</b> Vzor notifikácie o doručení je zobrazený na obrázku.

<p><i>Poznámka: ak vám notifikácia o doručení nejde prevziať, vyskúšajte najskôr <a href="https://www.slovensko.sk/sk/navody/nekorektne-zobrazenie-stranky/_ako-postupovat-nekorektne-zobrazenie/">vymazať pamäť vášho internetového prehliadača</a>.</i></p>

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/notifikacia%20o%20doru%C4%8Den%C3%AD%20-%20nov%C3%A1.PNG">
</picture>

Obrázok - Vzor notifikácie o doručení',	'Podnikanie',	561,	'Elektronické podania'),
('10. Kedy sa prihlásenie do schránky považuje za bezdôvodné odopretie prijatia doručovaného úradného dokumentu?',	'Od 1. januára 2017 bolo do zákona o súdoch doplnené <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2004/757/20170701#paragraf-82l.odsek-1">osobitné ustanovenie o elektronickom výkone verejnej moci na súdoch</a>. V konaniach pred súdmi sa teda prihlásenie do elektronickej schránky bez potvrdenia doručenky počas úložnej lehoty pri doručovaní do vlastných rúk, ak je vylúčené náhradné doručenie, považuje za bezdôvodné odopretie prijatia doručovaného úradného dokumentu. Úradný dokument sa v takomto prípade považuje za doručený dňom nasledujúcim po uplynutí úložnej lehoty.',	'Podnikanie',	562,	'Elektronické podania'),
('11. Môže sa elektronický úradný dokument (rozhodnutie), ktorý je podpísaný kvalifikovaným elektronickým podpisom a zaslaný do elektronickej schránky, použiť na právne účely?',	'Áno, dokument podpísaný kvalifikovaným elektronickým podpisom (KEP) nahrádza dokument v tlačenej a podpísanej podobe.',	'Podnikanie',	563,	'Elektronické podania'),
('12. Aká je maximálna veľkosť podania?',	'Vzhľadom na štandardne používané kódovanie base 64, celková veľkosť všetkých objektov vložených do elektronickej správy v závislosti od jej ďalšieho obsahu všeobecne nemôže presiahnuť 33 MB.',	'Podnikanie',	564,	'Elektronické podania'),
('11. Má autentifikačný certifikát a technický účet obmedzenú platnosť ?',	'V zmysle aktuálne platného integračného manuálu IAM je platnosť autentifikačného certifikátu 2 roky. Platnosť technického účtu je neobmedzená.

<p>Žiadateľ môže obmedziť len platnosť zastupovania medzi technickým účtom a vlastníkom. „Platnosť od“ a „Platnosť do“ určuje platnosť zastupovania a tým aj oprávnenia na prístup a disponovanie s elektronickou schránkou. Koniec platnosti zastupovania nie je povinné uvádzať. Technický účet je aktívny aj po skončení platnosti autentifikačného certifikátu, ale nie je ním možné sa prihlásiť. Po zaregistrovaní platného autentifikačného certifikátu je opäť možné sa technickým účtom prihlasovať.</p>',	'Podnikanie',	585,	'Register autentifikačných certifikátov'),
('13. Ako počítať a zachovávať lehoty?',	'<p>Na počítanie lehôt je rozhodujúci právny stav, ktorý určujú osobitné právne predpisy, resp. či má ísť v konkrétnom konaní o zachovanie procesnoprávnej alebo hmotnoprávnej lehoty. Všeobecne sa hmotnoprávna lehota považuje za zachovanú, pokiaľ je adresátovi určitý úkon v stanovenej lehote aj reálne doručený. Na zachovanie procesnoprávnej lehoty postačí, ak sa posledný deň lehoty podanie odovzdá orgánu, ktorý má povinnosť ho doručiť (napr. pošta). </p>

<p>Potvrdenie o  odoslaní v zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180401#paragraf-25.odsek-1">§ 25 ods. 1</a> zákona o e-Governmente má význam najmä z pohľadu počítania a zachovávania procesnoprávnych lehôt. Elektronické podanie je podané jeho odoslaním do elektronickej schránky orgánu verejnej moci. Na účely preukázania momentu odoslania sa použijú údaje z potvrdenia podľa <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180401#paragraf-5.odsek-8">§ 5 ods. 8</a> zákona o e-Governmente. V súčasnosti sa toto potvrdenie vyhotovuje automatizovane, do 31. mája 2018 sa vyhotovovalo individuálne na požiadanie odosielateľa.<p>

<p>Z pohľadu počítania a zachovávania hmotnoprávnych lehôt je rozhodujúce, kedy prišlo k doručeniu podania. V zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180401#paragraf-32.odsek-5">§ 32 ods. 5</a> zákona o e-Governmente sa elektronická úradná správa, vrátane všetkých elektronických dokumentov, považuje za doručenú,</p>

<ul>
<li>ak je adresátom orgán verejnej moci, uložením elektronickej úradnej správy (okamih, odkedy je elektronická úradná správa objektívne dostupná v elektronickej schránke adresáta),</li>
<li>ak nie je adresátom orgán verejnej moci a doručuje sa do vlastných rúk, dňom, hodinou, minútou a sekundou uvedenými na elektronickej doručenke alebo márnym uplynutím úložnej lehoty podľa toho, ktorá skutočnosť nastane skôr, a to aj vtedy, ak sa adresát o tom nedozvedel,</li>
<li>ak nie je adresátom orgán verejnej moci a nedoručuje sa do vlastných rúk, deň bezprostredne nasledujúci po uložení elektronickej úradnej správy.</li>
</ul>',	'Podnikanie',	565,	'Elektronické podania'),
('14. Aké sú požiadavky na názvy súborov pripájaných do elektronických podaní alebo do elektronických úradných dokumentov? ',	'Odporúčanou požiadavkou je nepoužívať v názvoch súborov špeciálne znaky ako „/“, „\“, „:“, „*“, „”, “|”, „?“, „!“, „NULL“ a podobne. Odporúča sa skracovať názvy súborov na dĺžku do 64 znakov. ',	'Podnikanie',	566,	'Elektronické podania'),
('15. Ako otvoriť súbor bez prípony, ktorý sa nachádza v ASiC alebo v elektronickej správe? ',	'<p>V grafickom rozhraní elektronickej schránky na Ústrednom portáli verejnej správy sa automaticky dopĺňa v názve súboru prípona pre tie súbory, ktoré nemajú v názve príponu alebo majú uvedenú nesprávnu príponu. Prípona sa dopĺňa podľa princípov uvedených v <a href="https://www.slovensko.sk/sk/o-portali/technicke-informacie-o-upvs">technických informáciách o funkčnosti portálu</a>.</p>

<p>V prípade využitia aplikácie D.Viewer na otváranie alebo ukladanie podpísaného súboru bez prípony sa automaticky dopĺňa prípona súboru len pre základné formáty súborov na základe hodnoty mimetype.</p>

<p>Pravidlá technickej funkčnosti elektronickej schránky sú uvedené v dokumente <a href="https://www.slovensko.sk/_img/CMS4/eDESK/Dokumentacia_funkcnosti_eDesk.pdf">Dokumentácia funkčnosti elektronickej schránky</a> [.pdf, 494.9 kB]</p>',	'Podnikanie',	567,	'Elektronické podania'),
('1. Akými spôsobmi môžem zaplatiť za elektronické služby spoplatnené správnym alebo súdnym poplatkom?',	'Najrýchlejším spôsobom úhrady poplatku je platba kartou priamo cez nový dizajn elektronickej schránky. Ďalej je na výber platba bankovým prevodom cez internet banking alebo Pay by square naskenovaním QR kódu, platba na kiosku cez mobilnú alebo webovú aplikáciu eKolok či platba poštovým poukazom. Viac o spôsoboch platby sa dozviete v <a href="https://www.slovensko.sk/sk/platba-online">súvisiacom článku...</a>',	'Podnikanie',	568,	'Platba kartou'),
('2. Ktorý zo spôsobov platby sa odporúča?',	'Uvedené spôsoby platby sa od seba navzájom líšia najmä ich časovou náročnosťou a požadovaným technologickým vybavením žiadateľa. Kým platbu bankovým prevodom systém spracuje do 72 hodín, platba kartou sa uskutoční okamžite, nie je potrebný prístup do internet bankingu alebo nainštalovaná mobilná aplikácia banky, špeciálny mobilný telefón a ani osobná návšteva pošty, a preto sa poplatok odporúča zaplatiť práve kartou.',	'Podnikanie',	569,	'Platba kartou'),
('3. Môžem zaplatiť kartou za všetky elektronické služby?',	'Momentálne je možné uhradiť kartou iba vybrané spoplatnené elektronické služby <b>Generálnej Prokuratúry SR, Ministerstva vnútra SR, Ministerstva dopravy a výstavby SR, Ministerstva spravodlivosti SR</b> a poplatok za žiadosť o opätovnú aktiváciu elektronickej schránky na doručovanie.

<p>Zoznam vybraných elektronických služieb generálnej prokuratúry:</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/detail-sluzby?externalCode=sluzba_egov_807">Poskytovanie výpisu a odpisu z registra trestov</a></li>
</ul>

<p>Zoznam vybraných elektronických služieb ministerstva vnútra:</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-pri-trvalo/">Získanie potvrdenia o trvalom pobyte</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-pri-trvalo/">Získanie potvrdenia o ohlásení "trvalého" pobytu v zahraničí</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-pri-precho/">Získanie potvrdenia o prechodnom pobyte</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-pri-precho/">Získanie potvrdenia o ohlásení prechodného pobytu v zahraničí</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_ziadosti-o-uradne-vypisy/">Podanie žiadosti o vydanie úmrtného listu s pôvodným menom</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_ziadosti-o-uradne-vypisy/">Vydanie úradného výpisu (duplikátu) matričného dokladu</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_ziadosti-o-uradne-vypisy/">Vyhotovenie potvrdenia o údajoch zapísaných v matričnej knihe</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-suvisiace1/">Podanie žiadosti o vydanie občianskeho preukazu s čipom</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zmenu údajov po prisťahovaní držiteľa z iného okresu</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o výmenu tabuľky s evidenčným číslom vozidla (za klasickú, voliteľnú alebo plastovú)</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o odhlásenie vozidla do cudziny</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o výmenu tabuľky s evidenčným číslom za duplikát (z dôvodu straty, odcudzenia alebo poškodenia)</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o objednanie tabuľky s evidenčným číslom na nosič bicyklov</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o obnovenie osvedčenia o evidencii vozidla po strate alebo odcudzení</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o výmenu osvedčenia, osvedčení o evidencii vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zrušenie prevodu držby vozidla na inú osobu</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o vykonanie zmeny v dokladoch vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zmenu vlastníctva vozidla po ukončení leasingu vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zápis vlastníka vozidla po oznámení ukončenia predchádzajúceho vlastníctva</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o prvé prihlásenie vozidla do evidencie</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o zápis nového držiteľa vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o priamy prevod držby alebo vlastníctva vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_elektronicke-sluzby-evidencie/">Žiadosť o vyradenie vozidla z evidencie</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_pristup-k-elektronickym-archiv">Podanie žiadosti o nahliadnutie do matriky</a></li>
<li><a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_pristup-k-elektronickym-archiv">Podanie žiadosti o poskytnutie správnej informácie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Ohlasovanie+vo%c4%benej%2c+remeselnej+a+viazanej+%c5%beivnosti+-+fyzick%c3%a1+osoba">Ohlasovanie voľnej, remeselnej a viazanej živnosti - fyzická osoba</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Ohlasovanie+vo%c4%benej%2c+remeselnej+a+viazanej+%c5%beivnosti+%e2%80%93+pr%c3%a1vnick%c3%a1+osoba">Ohlasovanie voľnej, remeselnej a viazanej živnosti - právnická osoba</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Oznamovanie+pozastavenia+prev%c3%a1dzkovania+%c5%beivnosti">Oznamovanie pozastavenia prevádzkovania živnosti</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+v%c3%bdpisu+z+verejnej+%c4%8dasti+%c5%beivnostensk%c3%a9ho+registra">Poskytovanie výpisu z verejnej časti živnostenského registra</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%c3%a1vanie+%c5%beiadosti+o+vydanie+potvrdenia+o+tom%2c+%c5%bee+poskytovanie+slu%c5%beieb+na+z%c3%a1klade+%c5%beivnostensk%c3%a9ho+opr%c3%a1vnenia+nie+je+obmedzen%c3%a9+alebo+zak%c3%a1zan%c3%a9">Podávanie žiadosti o vydanie potvrdenia o tom, že poskytovanie služieb na základe živnostenského oprávnenia nie je obmedzené alebo zakázané</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+opr%c3%a1vnenia+na+podnikanie+pod%c4%bea+osobitn%c3%bdch+predpisov-Fyzick%c3%a1+osoba+tuzemsk%c3%a1">Poskytovanie oprávnenia na podnikanie podľa osobitných predpisov - Fyzická osoba tuzemská</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+opr%c3%a1vnenia+na+podnikanie+pod%c4%bea+osobitn%c3%bdch+predpisov-Fyzick%c3%a1+osoba+zahrani%c4%8dn%c3%a1">Poskytovanie oprávnenia na podnikanie podľa osobitných predpisov - Fyzická osoba zahraničná</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+opr%c3%a1vnenia+na+podnikanie+pod%c4%bea+osobitn%c3%bdch+predpisov-Pr%c3%a1vnick%c3%a1+osoba+tuzemsk%c3%a1">Poskytovanie oprávnenia na podnikanie podľa osobitných predpisov - Právnická osoba tuzemská</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+opr%c3%a1vnenia+na+podnikanie+pod%c4%bea+osobitn%c3%bdch+predpisov-Pr%c3%a1vnick%c3%a1+osoba+zahrani%c4%8dn%c3%a1">Poskytovanie oprávnenia na podnikanie podľa osobitných predpisov - Právnická osoba zahraničná</a></li>
</ul>

<p>Zoznam vybraných elektronických služieb ministerstva dopravy a výstavby:</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%c3%a1vanie+%c5%beiadosti+o+vydanie+osved%c4%8denia+ADR+o+%c5%a1kolen%c3%ad+vodi%c4%8da+-+prv%c3%a9+vydanie">Podávanie žiadosti o vydanie osvedčenia ADR o školení vodiča – prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+ADR+o+%C5%A1kolen%C3%AD+vodi%C4%8Da+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia ADR o školení vodiča - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+ADR+o+%C5%A1kolen%C3%AD+vodi%C4%8Da+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie ADR osvedčenia o školení vodiča - duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+bezpe%C4%8Dnostn%C3%A9ho+poradcu+na+prepravu+nebezpe%C4%8Dn%C3%BDch+vec%C3%AD+-+prv%C3%A9+vydanie&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti bezpečnostného poradcu na prepravu nebezpečných vecí – prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+bezpe%C4%8Dnostn%C3%A9ho+poradcu+na+prepravu+nebezpe%C4%8Dn%C3%BDch+vec%C3%AD+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti bezpečnostného poradcu na prepravu nebezpečných vecí - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+bezpe%C4%8Dnostn%C3%A9ho+poradcu+na+prepravu+nebezpe%C4%8Dn%C3%BDch+vec%C3%AD+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti bezpečnostného poradcu na prepravu nebezpečných vecí - duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+bezpe%C4%8Dnostn%C3%A9ho+poradcu+na+prepravu+nebezpe%C4%8Dn%C3%BDch+vec%C3%AD+-+pred%C4%BA%C5%BEenie+platnosti&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti bezpečnostného poradcu na prepravu nebezpečných vecí - predĺženie platnosti</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+poverenie+pr%C3%A1vnickej+osoby+odbornou+pr%C3%ADpravou+bezpe%C4%8Dnostn%C3%BDch+poradcov+a+vodi%C4%8Dov+vozidiel+prepravuj%C3%BAcich+nebezpe%C4%8Dn%C3%A9+veci&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o poverenie právnickej osoby odbornou prípravou bezpečnostných poradcov a vodičov vozidiel prepravujúcich nebezpečné veci</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+od%C5%88atie+poverenia+pr%C3%A1vnickej+osoby+odbornou+pr%C3%ADpravou+bezpe%C4%8Dnostn%C3%BDch+poradcov+a+vodi%C4%8Dov+vozidiel+prepravuj%C3%BAcich+nebezpe%C4%8Dn%C3%A9+veci&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o odňatie poverenia právnickej osoby odbornou prípravou bezpečnostných poradcov a vodičov vozidiel prepravujúcich nebezpečné veci</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+poverenia+pr%C3%A1vnickej+osoby+odbornou+pr%C3%ADpravou+bezpe%C4%8Dnostn%C3%BDch+poradcov+a+vodi%C4%8Dov+vozidiel+prepravuj%C3%BAcich+nebezpe%C4%8Dn%C3%A9+veci&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu poverenia právnickej osoby odbornou prípravou bezpečnostných poradcov a vodičov vozidiel prepravujúcich nebezpečné veci</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+in%C5%A1truktorsk%C3%A9ho+preukazu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie inštruktorského preukazu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+pred%C4%BA%C5%BEenie+platnosti+in%C5%A1truktorsk%C3%A9ho+preukazu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o predĺženie platnosti inštruktorského preukazu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+udelenie+osved%C4%8Denia+technika+technickej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o udelenie osvedčenia technika technickej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+pred%C4%BA%C5%BEenie+platnosti+osved%C4%8Denia+technika+technickej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o predĺženie platnosti osvedčenia technika technickej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+zmenu+rozsahu+osved%C4%8Denia+technika+technickej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o zmenu rozsahu osvedčenia technika technickej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+udelenie+osved%C4%8Denia+technika+emisnej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o udelenie osvedčenia technika emisnej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+pred%C4%BA%C5%BEenie+platnosti+osved%C4%8Denia+technika+emisnej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o predĺženie platnosti osvedčenia technika emisnej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+zmenu+rozsahu+osved%C4%8Denia+technika+emisnej+kontroly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o zmenu rozsahu osvedčenia technika emisnej kontroly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+udelenie+osved%C4%8Denia+technika+kontroly+originality&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o udelenie osvedčenia technika kontroly originality</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+pred%C4%BA%C5%BEenie+platnosti+osved%C4%8Denia+technika+kontroly+originality&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o predĺženie platnosti osvedčenia technika kontroly originality</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+zmenu+rozsahu+osved%C4%8Denia+technika+kontroly+originality&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o zmenu rozsahu osvedčenia technika kontroly originality</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+udelenie+osved%C4%8Denia+technika+mont%C3%A1%C5%BEe+plynov%C3%BDch+zariaden%C3%AD&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o udelenie osvedčenia technika montáže plynových zariadení</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+pred%C4%BA%C5%BEenie+platnosti+osved%C4%8Denia+technika+mont%C3%A1%C5%BEe+plynov%C3%BDch+zariaden%C3%AD&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o predĺženie platnosti osvedčenia technika montáže plynových zariadení</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+o+zmenu+rozsahu+osved%C4%8Denia+technika+mont%C3%A1%C5%BEe+plynov%C3%BDch+zariaden%C3%AD&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu o zmenu rozsahu osvedčenia technika montáže plynových zariadení</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+na+vykon%C3%A1vanie+taxislu%C5%BEby+-+prv%C3%A9+vydanie&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti na vykonávanie taxislužby - prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+na+vykon%C3%A1vanie+taxislu%C5%BEby+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti na vykonávanie taxislužby - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+o+odbornej+sp%C3%B4sobilosti+na+vykon%C3%A1vanie+taxislu%C5%BEby+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia o odbornej spôsobilosti na vykonávanie taxislužby - duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+prihl%C3%A1%C5%A1ky+na+sk%C3%BA%C5%A1ku+z+odbornej+sp%C3%B4sobilosti+v+taxislu%C5%BEbe&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie prihlášky na skúšku z odbornej spôsobilosti v taxislužbe</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+udelenie+koncesie+na+taxislu%C5%BEbu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o udelenie koncesie na taxislužbu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+koncesie+na+taxislu%C5%BEbu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu koncesie na taxislužbu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+od%C5%88atie+koncesie+na+taxislu%C5%BEbu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o odňatie koncesie na taxislužbu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+preukazu+vodi%C4%8Da+vozidla+taxislu%C5%BEby+-+prv%C3%A9+vydanie&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie preukazu vodiča vozidla taxislužby – prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+preukazu+vodi%C4%8Da+vozidla+taxislu%C5%BEby+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie preukazu vodiča vozidla taxislužby - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+preukazu+vodi%C4%8Da+vozidla+taxislu%C5%BEby+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie preukazu vodiča vozidla taxislužby duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+odbornej+sp%C3%B4sobilosti+v+cestnej+doprave+-+prv%C3%A9+vydanie&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia odbornej spôsobilosti v cestnej doprave – prvé vydanie</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+odbornej+sp%C3%B4sobilosti+v+cestnej+doprave+-+zmena+osobn%C3%BDch+%C3%BAdajov&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia odbornej spôsobilosti v cestnej doprave - zmena osobných údajov</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+vydanie+osved%C4%8Denia+odbornej+sp%C3%B4sobilosti+v+cestnej+doprave+-+duplik%C3%A1t&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o vydanie osvedčenia odbornej spôsobilosti v cestnej doprave - duplikát</a></li>
<li><a href="https://www.slovensko.sk/sk/faq/$https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+udelenie+povolenia+na+v%C3%BDkon+povolania+prev%C3%A1dzkovate%C4%BEa+cestnej+dopravy&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o udelenie povolenia na výkon povolania prevádzkovateľa cestnej dopravy</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+povolenia+na+v%C3%BDkon+povolania+prev%C3%A1dzkovate%C4%BEa+cestnej+dopravy&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu povolenia na výkon povolania prevádzkovateľa cestnej dopravy</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+od%C5%88atie+povolenia+na+v%C3%BDkon+povolania+prev%C3%A1dzkovate%C4%BEa+cestnej+dopravy&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o odňatie povolenia na výkon povolania prevádzkovateľa cestnej dopravy</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+udelenie+licencie+spolo%C4%8Denstva&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o udelenie licencie spoločenstva</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+licencie+spolo%C4%8Denstva&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu licencie spoločenstva</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+registr%C3%A1ciu+%C5%A1koliaceho+strediska&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o registráciu školiaceho strediska</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+registr%C3%A1cie+%C5%A1koliaceho+strediska&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu registrácie školiaceho strediska</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+povolenie+prestavby+jednotliv%C3%A9ho+vozidla&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na povolenie prestavby jednotlivého vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+schv%C3%A1lenie+prestavby+jednotliv%C3%A9ho+vozidla&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na schválenie prestavby jednotlivého vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+povolenie+hromadnej+prestavby+typu+vozidla&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o povolenie hromadnej prestavby typu vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+schv%C3%A1lenie+hromadnej+prestavby+typu+vozidla&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o schválenie hromadnej prestavby typu vozidla</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+jednotliv%C3%A9+uznanie+typov%C3%A9ho+schv%C3%A1lenia+E%C3%9A+jednotlivo+dovezen%C3%A9ho+vozidla+z+%C4%8Dlensk%C3%A9ho+%C5%A1t%C3%A1tu+alebo+zmluvn%C3%A9ho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na jednotlivé uznanie typového schválenia EÚ jednotlivo dovezeného vozidla z členského štátu alebo zmluvného štátu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+jednotliv%C3%A9+uznanie+schv%C3%A1lenia+jednotlivo+dovezen%C3%A9ho+vozidla+z+%C4%8Dlensk%C3%A9ho+%C5%A1t%C3%A1tu+alebo+zmluvn%C3%A9ho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na jednotlivé uznanie schválenia jednotlivo dovezeného vozidla z členského štátu alebo zmluvného štátu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+vn%C3%BAtro%C5%A1t%C3%A1tne+jednotliv%C3%A9+schv%C3%A1lenie+jednotlivo+dovezen%C3%A9ho+vozidla+z+tretieho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na vnútroštátne jednotlivé schválenie jednotlivo dovezeného vozidla z členského štátu alebo zmluvného štátu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+vn%C3%BAtro%C5%A1t%C3%A1tne+jednotliv%C3%A9+schv%C3%A1lenie+jednotlivo+dovezen%C3%A9ho+vozidla+z+tretieho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na vnútroštátne jednotlivé schválenie jednotlivo dovezeného vozidla z tretieho štátu</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+jednotliv%C3%A9+uznanie+typov%C3%A9ho+schv%C3%A1lenia+E%C3%9A+jednotlivo+dovezen%C3%A9ho+vozidla+z+tretieho+%C5%A1t%C3%A1tu&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na jednotlivé uznanie typového schválenia EÚ jednotlivo dovezeného vozidla z tretieho štátu</a></li>
<a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+registr%C3%A1ciu+auto%C5%A1koly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o registráciu autoškoly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+zmenu+registra%C4%8Dn%C3%BDch+%C3%BAdajov+auto%C5%A1koly&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zmenu registračných údajov autoškoly</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+povolenie+evidencie%2c+uvedenie+na+trh+alebo+do+prev%C3%A1dzky+v+prem%C3%A1vke+na+pozemn%C3%BDch+komunik%C3%A1ci%C3%A1ch&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o povolenie evidencie, uvedenie na trh alebo do prevádzky v premávke na pozemných komunikáciách</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+n%C3%A1vrhu+na+op%C3%A4tovn%C3%A9+schv%C3%A1lenie+jednotliv%C3%A9ho+vozidla+na+prev%C3%A1dzku+v+cestnej+prem%C3%A1vke&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie návrhu na opätovné schválenie jednotlivého vozidla na prevádzku v cestnej premávke</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%C3%A1vanie+%C5%BEiadosti+o+z%C3%A1pis+zmeny+%C3%BAdajov+v+osved%C4%8Den%C3%AD+o+evidencii+vozidla+(OEII)+%2f+technick%C3%A9ho+osved%C4%8Denia+vozidla+(TOV)&InstitutionName=Ministerstvo+dopravy+a+v%C3%BDstavby+Slovenskej+republiky">Podávanie žiadosti o zápis zmeny údajov v osvedčení o evidencii vozidla (OEII)/technického osvedčenia vozidla (TOV)</a></li>
</ul>

<p>Zoznam vybraných elektronických služieb ministerstva spravodlivosti:</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%c3%a1vanie+n%c3%a1vrhov+a+s%c3%bavisiacich+p%c3%adsomnost%c3%ad+na+s%c3%badne+konanie">Podávanie návrhov a súvisiacich písomností na súdne konanie (elektronické služby Ministerstva spravodlivosti SR týkajúce sa exekučného a upomínacieho konania)</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Pod%c3%a1vanie+n%c3%a1vrhu+na+z%c3%a1pis%2c+zmenu+a+v%c3%bdmaz+%c3%badajov+v+obchodnom+registri">Podávanie návrhu na zápis, zmenu a výmaz údajov v obchodnom registri</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Po%c5%beiadanie+o+vyhotovenie+k%c3%b3pie+listiny+ulo%c5%beenej+v+zbierke+list%c3%adn+v+tla%c4%8denej+podobe">Požiadanie o vyhotovenie kópie listiny uloženej v zbierke listín v tlačenej podobe</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Poskytovanie+v%c3%bdpisu+z+obchodn%c3%a9ho+registra+v+tla%c4%8denej+podobe">Poskytovanie výpisu z obchodného registra v tlačenej podobe</a></li>
<li><a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=Po%c5%beiadanie+o+vystavenie+potvrdenia+o+tom%2c+%c5%bee+listina+nie+je+ulo%c5%been%c3%a1+v+zbierke+list%c3%adn+v+tla%c4%8denej+podobe">Požiadanie o vystavenie potvrdenia o tom, že listina nie je uložená v zbierke listín v tlačenej podobe</a></li>
</ul>',	'Podnikanie',	570,	'Platba kartou'),
('4. Akým spôsobom sa dozviem údaje potrebné na vykonanie úhrady?',	'Po odoslaní podania k vybranej spoplatnenej elektronickej službe dochádza k jeho spracovaniu, ktoré môže trvať niekoľko hodín. Následne sa vám do elektronickej schránky doručí správa s názvom „Príkaz na úhradu“, v ktorej sú všetky potrebné informácie k zaplateniu poplatku (lehota na zaplatenie, suma, číslo účtu v tvare IBAN, variabilný symbol a podobne).',	'Podnikanie',	571,	'Platba kartou'),
('5. Ako mám postupovať, ak chcem uhradiť poplatok kartou?',	'Priamo v elektronickej schránke v príslušnom príkaze na úhradu nájdete zelené tlačidlo „Zaplatiť“, následne si vyberiete možnosť platby kartou a kliknete na „Zaplatiť kartou“, čím sa dostanete do virtuálneho kiosku. Vyplníte meno vlastníka karty, číslo platobnej karty, dátum expirácie, CVC2 kód a prejdete na „Potvrdiť platbu“. Platba kartou sa spracuje okamžite. Po zaplatení dostanete do elektronickej schránky správu s potvrdením úhrady. Bližší popis jednotlivých krokov nájdete v <a href="https://www.youtube.com/watch?v=_yVc4bil8BM">inštruktážnom videonávode...</a>

<picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/prikaz_na_uhradu.jpg">
</picture>

<p>Obrázok - Tlačidlo „Zaplatiť" v Príkaze na úhradu</p>',	'Podnikanie',	572,	'Platba kartou'),
('6. Kde nájdem doklad o zaplatení poplatku?',	'Po zaplatení poplatku sa do elektronickej schránky doručí správa s názvom „Informácia o úhrade“, v ktorej sa nachádza tlačidlo „Uložiť účtovný doklad“ umožňujúce stiahnutie a následné vytlačenie dokladu o zaplatení.

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/faq/uctovny_doklad.jpg">
</picture></p>

<p>Obrázok - Uložiť účtovný doklad</p>',	'Podnikanie',	573,	'Platba kartou'),
('7. Prečo sa mi nedarí zaplatiť poplatok kartou? Kde môže byť problém?',	'Ak ste kartou cez internet ešte neplatili, je možné, že máte z dôvodu bezpečnosti zablokované MO/TO platby (z ang. Mail Order/Telephone Order). Ak kartou platíte cez internet pravidelne a aj tak sa vám nedarí zaplatiť, je možné, že ste prekročili nastavený denný, prípadne mesačný limit. Požadovaný limit pre vybraný typ platby a kartu je preto nutné najskôr nastaviť vo vašom internetovom bankovníctve.

<p>V prípade akýchkoľvek ďalších problémov sa môžete obrátiť na operátorov Ústredného kontaktného centra, ktorí sú vám k dispozícií na telefónnom čísle +421 2 35 803 083 počas pracovných dní, v pondelok až piatok od 8.00 do 18.00 h a v stredu od 8.00 do 21.00 h. Mimo uvedených časov, počas  štátnych sviatkov alebo v dňoch pracovného pokoja je možné nahlásiť problém cez <a href="https://helpdesk.slovensko.sk/new-incident/">kontaktný formulár</a>. Na preverenie problému je nevyhnutné uviesť číslo podania, prípadne variabilný symbol príkazu na úradu alebo znenie chybovej hlášky.</p>',	'Podnikanie',	574,	'Platba kartou'),
('22. Čo potrebujem doložiť k žiadosti a ako sa žiadosť spracuje, ak odosielateľ žiadosti o registráciu autentifikačného certifikátu nie je totožný s držiteľom autentifikačného certifikátu a nemá udelené oprávnenie na prístup a disponovanie s elektronickou schránkou?',	'K žiadosti je potrebné priložiť splnomocnenie. Takáto žiadosť nie je spracovávaná automaticky, t. j. okamžite v momente odoslania žiadosti, ale podlieha manuálnej kontrole pracovníkom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	682,	'Orgán verejnej moci'),
('1. Čo je autentifikačný certifikát a na čo sa používa?',	'Autentifikačný certifikát je elektronický dokument - súbor vo formáte DER (.cer) podľa ISO/IEC 8825-1, ktorý obsahuje identifikátor osoby, ktorej bol vydaný a slúži na preukazovanie jej elektronickej identity.

<p>Autentifikačný certifikát sa používa na účely identifikácie a autentifikácie pri automatizovanom prístupe k informačnému systému alebo elektronickej komunikácii, ktoré súvisia s výkonom verejnej moci, alebo na účely prístupu do elektronickej schránky a disponovania s elektronickou schránkou.</p>

<p>Používa sa na prístup technickými alebo programovými prostriedkami, ktoré sa prihlasujú automatizovane cez aplikačné rozhrania. Neslúži na prihlasovanie na portáli slovensko.sk prostredníctvom občianskeho preukazu s čipom (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid">eID karta</a>), dokladom o pobyte s čipom alebo alternatívnym autentifikátorom.</p>

<p>Certifikát si vytvára a vydáva žiadateľ sám (certifikát podpísaný sám sebou, z angl. self-signed certificate), alebo môže o vydanie požiadať inú osobu.</p>

<p>Podmienkou použitia je úspešné zapísanie platného autentifikačného certifikátu do registra autentifikačných certifikátov na Ústrednom portáli verejnej správy (<a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>) na základe žiadosti podpísanej kvalifikovaným elektronickým podpisom alebo na základe úradne overeného podpisu.</p>',	'Podnikanie',	575,	'Register autentifikačných certifikátov'),
('2. Čo je technický účet a na čo sa používa?',	'Technický účet vzniká na základe žiadosti o registráciu autentifikačného certifikátu s technickým účtom. Je potrebný pre používanie autentifikačného certifikátu.

<p>Technický účet je špeciálny typ identity vytvorený interne v systéme správy identít v module IAM, pre fyzickú osobu, právnickú osobu alebo orgán verejnej moci za účelom identifikácie a autentifikácie technickým alebo programovým prostriedkom použitím autentifikačného certifikátu. Technický účet zastupuje identitu vlastníka technického účtu.</p>

<p>Technický účet v module IAM (Identity Access Management, systém správy identít na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>) resp. zastupovanie technickým účtom určuje rozsah oprávnení a disponovania s elektronickou schránkou osoby zastupovanej technickými prostriedkami prostredníctvom podporovaných komunikačných rozhraní a v prípade orgánov verejnej moci aj rozsah oprávnení pri prístupe k službám spoločných modulov <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.</p>',	'Podnikanie',	576,	'Register autentifikačných certifikátov'),
('3. Kto môže o zápis autentifikačného certifikátu a o vytvorenie technického účtu požiadať?',	'Žiadateľom môže byť orgán verejnej moci, fyzická osoba, podnikateľ a právnická osoba.',	'Podnikanie',	577,	'Register autentifikačných certifikátov'),
('4. Aké sú výhody použitia autentifikačného certifikátu?',	'Prostredníctvom technických alebo programových prostriedkov umožňuje získať automatizovaný prístup k službám spoločných modulov <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> a automatizovaný prístup do elektronickej schránky alebo disponovanie s elektronickou schránkou na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> bez nutnosti použitia občianskeho preukazu s čipom (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid">eID karta</a>). Technické a programové prostriedky môže osoba získať od tretích strán alebo vytvoriť si vlastné po splnení podmienok úspešnej integrácie na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	'Podnikanie',	578,	'Register autentifikačných certifikátov'),
('5. Môže jeden autentifikačný certifikát pristupovať do viacerých elektronických schránok?',	'Áno, môže, v prípade, že má osoba, ku ktorej technickému účtu je autentifikačný certifikát priradený, udelené oprávnenie na prístup do viacerých elektronických schránok. V praxi to znamená, že po zaslaní formulára pre udelenie oprávnenia fyzickej alebo právnickej osobe na zastupovanie (dostupný priamo v elektronickej schránke) bude môcť takto oprávnená osoba pristupovať do elektronickej schránky aj použitím autentifikačného certifikátu. Formulár je možné zaslať aj v listinnej forme.

<p>Jeden subjekt (FO/PO/OVM) môže zastupovať neobmedzený počet iných subjektov. Pri každom takomto zastupovaní môže pre prístup využívať rovnaký autentifikačný certifikát alebo viaceré autentifikačné certifikáty, podľa vlastnej potreby.</p>

<p>K udeleniu oprávnenia na prístup a disponovanie s elektronickou schránkou odporúčame využiť až nový formulár (jeho dostupnosť bude oznámená v druhej polovici mesiaca december 2020), ktorý udelí zastupovanie len pre prístup technickým účtom s autentifikačným certifikátom (s voliteľnou možnosťou aj cez eID a pod.), čím sa zamedzí nežiadúcemu zobrazovaniu zastupovaní na prihlasovacej stránke štatutárovi zastupujúcej identity pri jeho prihlasovaní s eID. Zároveň bude pri použití nových formulárov automaticky zasielaná  správa o vytvorení zastupovania obsahujúca údaj <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> IdentityID (UUID identifikátor) zastupovanej identity potrebný pre volanie STS v zastúpení s parametrom OnBehalfOfId. Tento údaj je tiež možné zistiť v Profile identity v poli "ID identity", ktorej bolo udelené zastupovanie a tiež identity, ktorá zastupovanie udelila.</p.>',	'Podnikanie',	579,	'Register autentifikačných certifikátov'),
('6. Koľko autentifikačných certifikátov a technických účtov môže mať jedna identita?',	'Jedna identita môže mať zaregistrovaných viacero technických účtov a viacero autentifikačných certifikátov.

<p>Jeden autentifikačný certifikát môže byť zaregistrovaný iba jedenkrát, a teda iba na jeden technický účet. Registrácia rovnakého autentifikačného certifikátu bude zamietnutá vzhľadom na zhodu jeho digitálneho odtlačku.</p>

<p>Pre jeden technický účet môže byť zaregistrovaný neobmedzený počet autentifikačných certifikátov. (Počet nie je obmedzený, avšak v prípade potreby veľkých počtov pre jednu identitu - rádovo stoviek - je žiadúce vopred konzultovať s odborom integrácií.)</p>',	'Podnikanie',	580,	'Register autentifikačných certifikátov'),
('7. Koľko subjektov môže zastupovať jeden technický účet ?',	'Technický účet zastupuje jeden subjekt FO/PO/OVM – vlastníka technického účtu. Následne tento subjekt môže zastupovať ľubovoľný počet subjektov na základe udeleného oprávnenia. Príklad: Právnická osoba - spoločnosť poskytujúca určité služby pre rôzne subjekty (klientov) si môže zaregistrovať technický účet s naparovaným autentifikačným certifikátom a následne na základe udelenia oprávnení môže zastupovať ľubovoľný počet klientov.',	'Podnikanie',	581,	'Register autentifikačných certifikátov'),
('12. Ako sa dozviem o blížiacom sa uplynutí platnosti autentifikačného certifikátu alebo certifikátu z metadát poskytovateľa služieb (SP - service provider)?',	'Notifikačné správy o blížiacom sa uplynutí platnosti autentifikačného certifikátu alebo certifikátu poskytovateľa služieb (SP) sa zasielajú do elektronickej schránky vlastníka 30 dní, 14 dní, 7 dní, 1 deň pred uplynutím platnosti a aj posledný deň platnosti. V prípade, ak ste vyplnili kontaktné údaje v žiadosti, notifikačné správy vám budú doručené aj na vami uvedenú e-mailovú adresu.',	'Podnikanie',	586,	'Register autentifikačných certifikátov'),
('13. Aký formulár mám použiť, ak chcem zaregistrovať autentifikačný certifikát a zároveň vytvoriť technický účet?',	'Technický účet je technickou podmienkou používania autentifikačného certifikátu a preto prvý zápis autentifkačného certifikátu musí byť zároveň s vytvorením technického účtu.

<p>Je potrebné použiť formulár s názvom „Žiadosť o zápis autentifikačného certifikátu do registra autentifikačných certifikátov“. Formulár nájdete v časti „Profil“ po otvorení „Technické účty a certifikáty“ alebo na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“.</p>

<p>Žiadosť je možné podať aj bez prihlásenia, v takom prípade je potrebné po elektronickom odoslaní žiadosť vytlačiť, podpísať a podpis na nej úradne osvedčiť a zaslať do Národnej agentúry pre sieťové a elektronické služby.</p>',	'Podnikanie',	587,	'Register autentifikačných certifikátov'),
('14. Ako sa dozviem o úspešnej registrácii autentifikačného certifikátu a o vytvorení technického účtu?',	'O úspešnej registrácii autentifikačného certifikátu a o vytvorení technického účtu sa dozviete prostredníctvom informačnej správy o výsledku spracovania žiadosti zaslanej do elektronickej schránky vlastníka a na e-mailovú adresu uvedenú v žiadosti ako kontaktný údaj.',	'Podnikanie',	588,	'Register autentifikačných certifikátov'),
('15. Úspešne som si zaregistroval autentifikačný certifikát a vytvoril technický účet a zároveň mám integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. Ako ďalej?',	'Zaregistrovaný technický účet s naparovaným autentifikačným certifikátom môže subjekt využiť  na získanie časovo obmedzeného SAML tokenu, ktorým preukáže svoju totožnosť pri autentifikovanom prístupe k službám <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> napr. pri automatizovanom získavaní obsahu elektronickej schránky.',	'Podnikanie',	589,	'Register autentifikačných certifikátov'),
('16. Úspešne som si zaregistroval autentifikačný certifikát a vytvoril technický účet a nemám integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. Bude mi to fungovať?',	'Pre využívanie automatizovaného prístupu prostredníctvom autentifikačného certifikátu a technického účtu je potrebné sa najskôr integrovať na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. O potrebných krokoch sa môžete informovať prostredníctvom Ústredného kontaktného centra na tel. č. +421 2 35 803 083 alebo vyplnením <a href="https://helpdesk.slovensko.sk/new-incident/">kontaktného formulára</a>.',	'Podnikanie',	590,	'Register autentifikačných certifikátov'),
('17. Aký formulár mám použiť, ak potrebujem pre existujúci technický  účet upraviť rozsah oprávnenia na prístup k elektronickej schránke alebo dobu platnosti oprávnenia?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu v prístupových oprávneniach technického účtu“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom technickom účte kliknutím na tlačidlo „Upraviť“ .',	'Podnikanie',	591,	'Register autentifikačných certifikátov'),
('18. Aký formulár mám použiť, ak mi končí platnosť autentifikačného certifikátu k existujúcemu technickému účtu?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu zápisu autentifikačného certifikátu v registri autentifikačných certifikátov“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom autentifikačnom certifikáte kliknutím na tlačidlo „Pridať“.',	'Podnikanie',	592,	'Register autentifikačných certifikátov'),
('19. Aký formulár mám použiť, ak chcem zrušiť autentifikačný certifikát?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie autentifikačného certifikátu v registri autentifikačných certifikátov“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ kliknutím na názov technického účtu, ku ktorému sa autentifikačný certifikát viaže a pri konkrétnom autentifikačnom certifikáte je potrebné kliknúť na tlačidlo „Zneplatniť“.',	'Podnikanie',	593,	'Register autentifikačných certifikátov'),
('20. Aký formulár mám použiť, ak chcem zrušiť technický účet?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie prístupových oprávnení technického účtu (zrušenie technického účtu)“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom technickom účte kliknutím na tlačidlo „Zrušiť“.',	'Podnikanie',	594,	'Register autentifikačných certifikátov'),
('21. Kedy sa odoslané formuláre spracovávajú?',	'Žiadosti k registrácii a aktualizácii poskytovateľa služieb (service provider – SP) sa spracovávajú raz za 24 hodín, ostatné žiadosti každých 5 až 10 minút (ak sa pri nich nevyžaduje manuálne spracovanie pracovníkom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, napr. v prípade anonymne podanej žiadosti a pod.).',	'Podnikanie',	595,	'Register autentifikačných certifikátov'),
('22. Čo potrebujem doložiť k žiadosti a ako sa žiadosť spracuje, ak odosielateľ žiadosti o registráciu autentifikačného certifikátu nie je totožný s držiteľom autentifikačného certifikátu a nemá udelené oprávnenie na prístup a disponovanie s elektronickou schránkou?',	'K žiadosti je potrebné priložiť splnomocnenie. Takáto žiadosť nie je spracovávaná automaticky, t. j. okamžite v momente odoslania žiadosti, ale podlieha manuálnej kontrole pracovníkom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	'Podnikanie',	596,	'Register autentifikačných certifikátov'),
('23. Ak sa vo formulári nachádza povinné pole „Názov technického účtu“, ako zistím tento údaj?',	'Názov technického účtu nájdete buď v informačnej správe o výsledku spracovania žiadosti o registráciu autentifikačného certifikátu a o vytvorení technického účtu (zaslanej do elektronickej schránky vlastníka) alebo po prihlásení sa na portál slovensko.sk v časti „Profil“, „Technické účty a certifikáty“, alebo sa môžete obrátiť na operátorov nášho Ústredného kontaktného centra. V prípade, že máte integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, môžete zistiť názov technického účtu aj zavolaním požiadavky o vydanie STS tokenu v elemente Actor.ID.',	'Podnikanie',	597,	'Register autentifikačných certifikátov'),
('24. Môžem si zaregistrovať autentifikačný certifikát aj bez existencie technického účtu?',	'Nie, nie je to možné, autentifikačný certifikát musí byť naviazaný na technický účet.',	'Podnikanie',	598,	'Register autentifikačných certifikátov'),
('25. Aký formulár mám použiť, ak sa chcem zaregistrovať ako poskytovateľ služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o registráciu poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider).',	'Podnikanie',	599,	'Register autentifikačných certifikátov'),
('26. Aký formulár mám použiť, ak mi končí platnosť certifikátu poskytovateľa služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu údajov poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider) kliknúť na tlačidlo „Upraviť“.',	'Podnikanie',	600,	'Register autentifikačných certifikátov'),
('27. Aký formulár mám použiť, ak chcem zrušiť poskytovateľa služieb služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider) kliknúť na tlačidlo „Zrušiť“.',	'Podnikanie',	601,	'Register autentifikačných certifikátov'),
('28. Ako postupovať v prípade potreby hromadnej registrácie autentifikačných certifikátov?',	'V rámci Registra autentifikačných certifikátov nie sú možné hromadné registrácie autentifikačných certifikátov jednou žiadosťou. V prípadoch potreby hromadných registrácií musí integrovaný subjekt postupovať jednou z možností:

<ul>
<li>začať využívať volania STS služby s jedným autentifikačným certifikátom v zastúpení iných osôb (s parametrom OnBehalfOfId) namiesto samostatnej registrácie certifikátov za každý zastupovaný subjekt (túto možnosť umožňuje aj dodatok k DIZ so splnomocnením na udelenie zastupovania a na zrušenie doterajšieho autentifikačného certifikátu, na základe ktorého môžete zmigrovať svoje súčasné riešenie z množstva samostatných autentifikačných certifikátov na jeden certifikát),</li>
<li>implementovať si automatizovanú registráciu autentifikačných certifikátov prostredníctvom na to určeného elektronického formulára a zasielať žiadosti prostredníctvom integračného rozhrania,</li>
<li>manuálne registrovať každý autentifikačný certifikát zvlášť.</li>
</ul>',	'Podnikanie',	602,	'Register autentifikačných certifikátov'),
('1. Čo všetko potrebujem, ak sa chcem prihlásiť do elektronickej schránky právnickej osoby?',	'Na úspešné prihlásenie a vstup do elektronickej schránky je potrebné vlastniť občiansky preukaz s elektronickým čipom a bezpečnostný osobný kód (BOK).

Ďalej je nevyhnutné vlastniť čítačku kariet, mať inštalovaný príslušný softvér – aplikáciu <a href="https://www.slovensko.sk/sk/slovnik/detail/_eid-klient">eID klient</a> (slúži na prihlasovanie) a ovládače k čítačke kariet, ktoré sú k dispozícii v časti <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a>.',	'Podnikanie',	603,	'Aktivácia schránok právnických osôb na doručovanie'),
('2. Kde si môžem vybaviť všetky potrebné veci na vstup do elektronickej schránky?',	'Občiansky preukaz s elektronickým čipom si vybavíte na ktoromkoľvek Okresnom riaditeľstve Policajného zboru.

Na pracovisku polície vám vydajú aj bezpečnostný osobný kód (BOK) a rovnako si tam môžete požiadať aj o <b>vydanie kvalifikovaného certifikátu na tvorbu kvalifikovaného elektronického podpisu (KEP)</b>. Spolu s občianskym preukazom dostanete aj čítačku kariet (do vyčerpania zásob). Softvér potrebný na prihlasovanie je dostupný v sekcii <a href="https://www.slovensko.sk/sk/na-stiahnutie">Na stiahnutie</a> a na portáli <a href="https://www.minv.sk/">ministerstva vnútra</a>.',	'Podnikanie',	604,	'Aktivácia schránok právnických osôb na doručovanie'),
('3. Koľko ma to bude stáť?',	'<b>Zriadenie</b> elektronickej schránky právnickej osoby <b>a jej aktivácia na doručovanie je bezplatná</b>. Spoplatnené je vydanie občianskeho preukazu, a to správnym poplatkom 4,50 eura.',	'Podnikanie',	605,	'Aktivácia schránok právnických osôb na doručovanie'),
('4. Čo pre mňa znamená, že mám vytvorenú a aktivovanú elektronickú schránku právnickej osoby?',	'Elektronické schránky právnických osôb sa zriaďujú na portáli priebežne od 31. januára 2014 v nadväznosti na registráciu subjektu v príslušnom registri (napr. obchodný register).

<p>Aktivácia elektronickej schránky je proces, ktorý umožní jej využívanie na elektronické doručovanie od orgánov verejnej moci. V praxi to znamená, že prostredníctvom aktivovanej elektronickej schránky je možné od orgánov verejnej moci prijímať elektronické rozhodnutia, ktoré majú rovnaký právny účinok ako keby boli doručené v listinnej forme.</p>

<p>Platná právna úprava rozlišuje dva termíny povinnej aktivácie elektronických schránok právnických osôb a to v závislosti od toho, či právnické osoby:</p>

<ul>
<li>sú zapísané do obchodného registra alebo</li>
<li>nie sú zapísané do obchodného registra.</li>
</ul>

<p><b>Právnickej osobe so sídlom na území Slovenskej republiky a zapísanej do obchodného registra bude</b> elektronická schránka automaticky <b>aktivovaná na doručovanie pri prvom vstupe oprávnenej osoby do elektronickej schránky, najneskôr však uplynutím desiateho dňa odo dňa vykonania úkonu správcu modulu elektronických schránok.</b> Celý proces aktivácie elektronických schránok právnických osôb a zapísaných organizačných zložiek bude prebiehať postupne v tzv. prechodnom období od 1. 8. 2016 do 1. 7. 2017. Schránka právnickej osoby <b>zapísanej do obchodného registra sa aktivuje na doručovanie buď prvým prístupom osoby oprávnenej do elektronickej schránky</b> (resp.do desať dní odo dňa vykonania úkonu správcu modulu elektronických schránok), <b>alebo najneskôr 1. júla 2017</b>, a to v prípade, že sa v období do 1. júla 2017 do schránky právnickej osoby nikto neprihlási.</p>

<p><b>Aktivácia elektronických schránok na doručovanie sa v prípade právnických osôb, ktoré nemajú dobrovoľne aktivovanú elektronickú schránku a nie sú zapísané v obchodnom registri, začne 1. júna 2020.</b>
Od 1. júna budú aktivované na doručovanie elektronické schránky nadáciám, neinvestičným fondom, neziskovým organizáciám poskytujúcim verejnoprospešné služby, občianskym združeniam, odborovým a zamestnávateľským organizáciám, politickým stranám a hnutiam, záujmovým združeniam právnických osôb a organizáciám s medzinárodným prvkom. <a href="https://www.slovensko.sk/_img/CMS4/zoznam_nezapisanych_PO.pdf">Zoznam právnych foriem z preberaných registrov, ktoré sa nezapisujú do obchodného registra ...</a></p>

<p>Po dokončení priebežného čistenia, dopĺňania a aktualizácie údajov v ďalších zdrojových registroch, štát postupne aktivuje na doručovanie aj elektronické schránky ostatných právnických osôb - organizácie z registra poľovníckych organizácií, škôl regionálneho školstva, pozemkových spoločenstiev, záujmových združení fyzických osôb bez právnej spôsobilosti, miestnych jednotiek bez právnej spôsobilosti a verejných výskumných inštitúcií, ako aj elektronické schránky spoločenstiev vlastníkov bytov a nebytových priestorov, cirkví a pod. Presný dátum bude vopred avizovaný. <a href="https://www.slovensko.sk/_img/CMS4/zoznam_nezapisanych_PO_vsetky.pdf">Zoznam všetkých právnych foriem, ktoré sa nezapisujú do obchodného registra...</a></p>',	'Podnikanie',	606,	'Aktivácia schránok právnických osôb na doručovanie'),
('5. Kto mi do schránky bude môcť posielať poštu?',	'V prípade, že je elektronická schránka aktivovaná na doručovanie, môžu do nej doručovať poštu - <b>elektronické úradné rozhodnutia, orgány verejnej moci</b>. Doručené elektronické rozhodnutie do schránky má rovnaký právny účinok ako by bolo doručované v listinnej forme. Orgány verejnej moci doručujú rozhodnutia spravidla v režime do vlastných rúk s fikciou doručenia (15 dní).

<p><b><i>Poznámka:</i></b> Verejnú moc vykonáva štát predovšetkým prostredníctvom orgánov moci zákonodarnej, výkonnej a súdnej a za určitých podmienok ju môže vykonávať aj prostredníctvom ďalších subjektov. Kritériom na určenie či iný subjekt koná ako orgán verejnej moci, je skutočnosť, či konkrétny subjekt rozhoduje o právach a povinnostiach iných osôb a tieto rozhodnutia sú štátnou mocou vynútiteľné, či môže štát do týchto práv a povinností zasahovať.</p>',	'Podnikanie',	607,	'Aktivácia schránok právnických osôb na doručovanie'),
('6. Ako môžem oprávniť ďalšiu osobu na vstup do elektronickej schránky právnickej osoby?',	'Oprávniť určenú fyzickú resp. právnickú osobu na vstup do elektronickej schránky je možné prostredníctvom žiadosti „Udelenie oprávnenia fyzickej/právnickej osobe na zastupovanie subjektu“, ktorá je sprístupnená vo vašej elektronickej schránke v časti  „Nastavenia“ (ozubené koliesko) v záložke „Vytvorenie žiadosti“. Viac informácií ako postupovať, nájdete v sekcii <a href="https://www.slovensko.sk/sk/navody">Návody</a>.

<p>Žiadosť o udelenie prístupu do elektronickej schránky môžete poslať aj listinne vyplnením príslušného tlačiva, ktoré nájdete v sekcii <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">tlačivá</a>.</p>

<p>Ak je oprávnenou osobou fyzická osoba, musí mať 18 rokov a musí byť majiteľom občianskeho preukazu s čipom a BOK-u.</p>',	'Podnikanie',	608,	'Aktivácia schránok právnických osôb na doručovanie'),
('7. Som konateľ zahraničná osoba. Ako sa môžem prihlásiť do svojej elektronickej schránky právnickej osoby?',	'Na prihlasovanie sa do elektronických schránok je možné použiť na účely autentifikácie (procesu overenia identity, ktorá sa prihlasuje):

<ul>
<li><b>občiansky preukaz s čipom a bezpečnostný osobný kód,</b></li>
<li><b>doklad o pobyte s elektronickým čipom a bezpečnostný osobný kód</b></li>
<li>alebo alternatívny autentifikátor.</li>
</ul>

Ak ide o zahraničnú fyzickú osobu alebo právnickú osobu, táto nemá možnosť získať občiansky preukaz s čipom, ktorý je viazaný na občianstvo SR. Vydanie dokladu o pobyte pre cudzincov upravuje zákon č. 404/2011 Z. z. o pobyte cudzincov. Súčasťou dokladu je na požiadanie aj elektronický čip a bezpečnostný osobný kód, ktorý vydáva príslušný policajný útvar SR.

<b>Štatutárny zástupca právnickej osoby, ktorý nie je občanom SR, môže na prístup do elektronickej schránky právnickej osoby udeliť oprávnenie fyzickej osobe (občanovi SR, ktorý má občiansky preukaz s elektronickým čipom a BOK)</b>. Majiteľ elektronickej schránky môže udeliť oprávnenie na prístup a možnosť disponovať so schránkou aj inej osobe. Žiadosť môže udeliť prostredníctvom na to určenej funkcie elektronickej schránky, alebo dokumentom v listinnej podobe, s úradne osvedčeným podpisom na adresu: <i>Ministerstvo investícií, regionálneho rozvoja a informatizácie SR, Národná agentúra pre sieťové a elektronické služby, Trnavská cesta 100/II, 821 01 Bratislava</i>. Listinná žiadosť musí byť v prípade úradného osvedčovania podpisu majiteľa elektronickej schránky mimo územia SR doplnená o tzv. apostilu alebo superlegalizáciu. Od 16. februára 2019 sa uplatňuje voľný pohyb vybraných verejných listín a ich osvedčených kópií (vzťahuje sa aj na elektronické dokumenty) predkladaných orgánom iného členského štátu v rámci EÚ bez Apostille alebo superlegalizácie a zavádzajú sa viacjazyčné štandardné formuláre (ako pomôcka pri preklade) v zmysle nariadenia <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/?uri=CELEX:32016R1191">2016/1191</a>.

<ul>
<li><a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/udelenie_opravnenia_FO.pdf">Návod k udeleniu oprávnenia elektronicky...</a></li>
<li><a href="https://www.slovensko.sk/sk/oznamy/detail/_vyhody-elektronickeho-udelenia">Výhody elektronického udelenia oprávnenia...</a></li>
<li><a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">Listinná žiadosť...</a></li>
</ul>

<p><b>Od 1. marca 2017</b> môže zahraničný štatutár v zmysle vyhlášky Ministerstva vnútra Slovenskej republiky požiadať o vydanie <a href="https://www.slovensko.sk/sk/oznamy/detail/_alternativny-autentifikator-pr">alternatívneho autentifikátora</a>. Viac informácií si môžete prečítať v agende <a href="https://www.slovensko.sk/sk/agendy/agenda/_zahranicny-statutar/">Zahraničný štatutár</a>.</p>',	'Podnikanie',	609,	'Aktivácia schránok právnických osôb na doručovanie'),
('8. Je možné oprávniť aj inú právnickú osobu na vstup do elektronickej schránky právnickej osoby?',	'Áno. Oprávniť určenú právnickú osobu na vstup do elektronickej schránky je možné prostredníctvom žiadosti „Udelenie oprávnenia právnickej osobe na zastupovanie subjektu“, ktorá je sprístupnená vo vašej elektronickej schránke v časti „Nastavenia“ (ozubené koliesko) v záložke „Oprávnenia osôb“. <a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/udelenie_opravnenia_FO.pdf">Návod k udeleniu oprávnenia elektronicky...</a> Oprávnenie je možné udeliť aj <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/0bfcb661-1bcd-4c91-90dd-a5f500b64b53">listinne</a>.',	'Podnikanie',	610,	'Aktivácia schránok právnických osôb na doručovanie'),
('9. Čo robiť, ak som nedostal čítačku čipových kariet?',	'Čítačky čipových kariet dostávajú občania pri aktivácii bezpečnostného osobného kódu na okresnom riaditeľstve Policajného zboru, avšak len do ich vyčerpania zásob. Preto vám odporúčame, aby ste sa o dostupnosti čítačiek informovali na príslušnom oddelení. V prípade, že okresné riaditeľstvo čítačky neposkytne, je na občanovi, aby si zabezpečil kompatibilnú čítačku sám. <a href="https://eidas.minv.sk/download/Aplikacia_EID/">Návod</a>, ktoré čítačky sú kompatibilné nájdete v jednotlivých používateľských príručkách.',	'Podnikanie',	611,	'Aktivácia schránok právnických osôb na doručovanie'),
('1. Čo znamená výkon verejnej moci elektronicky v zmysle zákona č. 305/2013 Z. z. o eGovernmente?',	'Zákon <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180101">č. 305/2013 Z. z.</a> zákon o eGovernmente  (ďalej len „zákon o eGovernmente“) definuje výkon verejnej moci ako konanie o právach, právom chránených záujmoch a povinnostiach osôb. Zjednodušene ide o také postupy (činnosti), kde je jasný vzťah nadradeného a podradeného účastníka. Teda nie je otázkou, či je niekto orgánom verejnej moci, ale či v danom konaní vystupuje v tomto postavení.

<p>Príkladom môžu byť konania podľa Stavebného zákona, v ktorých obec vystupuje ako stavebný úrad. Ak je výsledkom jej konania napríklad územnoplánovacia dokumentácia, obec nevystupuje ako nadradený účastník, nemá postavenie orgánu verejnej moci, a teda nemá povinnosť postupovať podľa zákona o eGovernmente. Naopak, ak je výsledkom konania napr. rozhodnutie o umiestnení stavby (individuálny právny akt ukladajúci právo či povinnosť konkrétnej osobe), v tomto prípade obec vystupuje ako orgán verejnej moci a má povinnosť postupovať podľa zákona o eGovernmente.</p>',	NULL,	612,	'Orgán verejnej moci'),
('2. Kto je orgánom verejnej moci?',	'Ucelený zoznam orgánov verejnej moci neexistuje, ale platí, že postavenie orgánu verejnej moci majú:

<ul>
<li>štátne orgány (ministerstvá, úrady),</li>
<li>obce a mestá, VÚC (ich orgány),</li>
<li>verejnoprávne inštitúcie (Sociálna poisťovňa, školy, zdravotné poisťovne),</li>
<li>niektoré fyzické osoby (notári, exekútori) a právnické osoby (profesijné komory).</li>
</ul>

<h2>Štátne orgány</h2>

<ul>
<li>Ústredné a ostatné ústredné orgány štátnej správy, súdy, prokuratúra, Národná rada SR, výbory NR SR.</li>
</ul>

<h2>Obce/Mestá/VÚC</h2>

<ul>
<li>Orgány, ktoré vykonávajú prenesený výkon štátnej správy (matričné veci, stavebné konanie).</li>
<li>Orgány, ktoré vykonávajú originálne kompetencie (miestne dane).</li>
</ul>

<h2>Verejnoprávne inštitúcie</h2>

<ul>
<li>Škola rozhoduje o prijatí a neprijatí študenta na štúdium, a teda má povinnosť postupovať podľa zákona o eGovernmente.</li>
<li>Sociálna poisťovňa priznáva poskytnutie sociálnej dávky, a teda má povinnosť postupovať podľa zákona o eGovernmente.</li>
<li>RTVS nerozhoduje v žiadnom postupe, a teda nie je povinnou postupovať podľa zákona o eGovernmente.</li>
</ul>

<h2>Fyzická osoba</h2>

Celý výkon notárskej a exekútorskej činnosti je zákonom (exekučný a notársky poriadok) stanovený ako výkon verejnej moci, a teda notári a exekútori sú povinní postupovať podľa zákona o eGovernmente.

<h2>Právnická osoba</h2>

Komory (notárska, exekútorská, advokátska, lekárska, zdravotnícka) rozhodujú o pridelení „licencií“ na základe zákonom stanovených podmienok (napr. exekučný a notársky poriadok), a teda sú povinné postupovať podľa zákona o eGovernmente.

<p>Viac informácií nájdete aj v článku <a href="https://www.slovensko.sk/sk/agendy/agenda/_organy-verejnej-moci/">Orgány verejnej moci...</a></p>',	NULL,	613,	'Orgán verejnej moci'),
('3. Sú školy orgány verejnej moci?',	'<b>Školy sú orgánmi verejnej moci</b>. Zákon <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2003/596/20170901">č. 596/2003 Z. z.</a> o štátnej správe v školstve a školskej samospráve zveruje a rozdeľuje právomoci v oblasti výkonu štátnej správy v školstve medzi niekoľko osôb vrátane riaditeľa školy. <b>Školy sú orgánmi verejnej moci v rozsahu, v ktorom vykonávajú prenesenú štátnu správu zverenú im zákonom.</b>

<p><b>V prípade škôl s právnou subjektivitou (škola má samostatné IČO odlišné od zriaďovateľa)</b> odporúčame, aby mala <b>škola zriadenú svoju vlastnú elektronickú schránku</b>. Štatutárom je v tomto prípade riaditeľ školy.</p>

<p><b>V prípade škôl bez právnej subjektivity (škola nemá samostatné IČO)</b> odporúčame aplikovať ustanovenie § 12 ods. 6 zákona <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180101">č. 305/2013 Z. z.</a> o eGovernmente, a teda elektronickú schránku školy <b>zriadiť ako elektronickú schránku organizačnej zložky</b>. V prípade zriadenia elektronickej schránky školy ako elektronickej schránky organizačnej zložky, má do schránky automatický prístup štatutár (starosta obce či primátor mesta). Štatutár požiada o zriadenie elektronickej schránky organizačnej zložky a v žiadosti riaditeľovi školy udelí do schránky prístup.</p>

<p><b>Ak zriaďovateľ škole vlastnú schránku nezriadi</b>, má možnosť vytvoriť si vo svojej schránke podpriečinok, do ktorého bude mať riaditeľ prístup.</p>

<p>V súvislosti s elektronickou schránkou dávame do pozornosti § 11, § 12 nasl. zákona <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180101">č. 305/2013 Z. z.</a> o e-Govermente, ktoré hovoria o <a href="https://www.slovensko.sk/_img/CMS4/Navody/postup_zriadenie_es_organizacna_zlozka_ovm.pdf">zriadení elektronickej schránky</a>. Ďalšie informácie nájdete na portáli <a href="https://www.slovensko.sk/sk/titulna-stranka">www.slovensko.sk</a>, kde sú uverejnené aj <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/5556b9af-9cac-49a7-8d8d-a3fb00fe238e">príslušné formuláre</a> – žiadosť na zriadenie elektronickej schránky, ako aj žiadosť o udelenie oprávnenia na prístup a disponovanie s elektronickou schránkou.</p>

<p><a href="https://www.slovensko.sk/sk/faq/_najcastejsie-otazky-a-odpovede1">Najčastejšie otázky a odpovede týkajúce sa škôl a školských zariadení</a></p>',	NULL,	614,	'Orgán verejnej moci'),
('4. Koľko elektronických schránok má orgán verejnej moci, ak má zároveň v iných činnostiach iné právne postavenie?',	'Každému je možné zriadiť len jednu elektronickú schránku pre jedno právne postavenie. Ak je majiteľ elektronickej schránky súčasne vo viacerých právnych postaveniach, mal by mať zriadenú elektronickú schránku pre každé z týchto právnych postavení.

<p><b><i>Poznámka:</b> Národná agentúra pre sieťové a elektronické služby nemá kompetencie posudzovať, či niekto má alebo nemá postavenie orgánu verejnej moci. K nahláseniu údajov na účely zriadenia elektronickej schránky orgánu verejnej moci je potrebné požiadať cez <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/5556b9af-9cac-49a7-8d8d-a3fb00fe238e">formulár</a> v zmysle vyhlášky <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2019/438/">č. 438/2019 Z. z.</a></i></p>

Ak je orgán verejnej moci:

<ul>
<li><b>štátny orgán/obec/mesto/VÚC,</b> zriaďuje sa mu len jedna elektronická schránka,</li>
<li><b>verejnoprávna inštitúcia,</b> zriaďujú sa jej dve elektronické schránky, jedna ako orgánu verejnej moci a druhá ako právnickej osobe,</li>
<li>fyzická osoba,</b> zriaďujú sa jej dve elektronické schránky, jedna ako orgánu verejnej moci a druhá ako fyzickej osobe.</li>
</ul>

<b><u>Príklady:</u></b>

<h2>Štátny orgán/obec/mesto/VÚC</h2>

Ministerstvo financií SR (MF SR) je orgánom verejnej moci v konaní, v ktorom vykonáva finančnú kontrolu podľa zákona o finančnej kontrole, zároveň je však jeho služobný úrad v postavení zamestnávateľa, podľa zákona o štátnej službe. V tomto prípade je MF SR zriadená jedna elektronická schránka ako orgánu verejnej moci a aj keď je v pozícii zamestnávateľa, doručuje sa mu do tejto elektronickej schránky, pričom preňho platia úložné lehoty, ako keby aj v postavení zamestnávateľa bol orgánom verejnej moci.

<h2>Verejnoprávna inštitúcia (školy, zdravotné poisťovne, Sociálna poisťovňa)</h2>

Verejnoprávnym inštitúciám s vlastnou právnou subjektivitou sa v súčasnosti zriaďujú dve elektronické schránky ako:

<ul>
<li>orgán verejnej moci,</li>
<li>právnická osoba.</li>
</ul>

Elektronické schránky zriadené verejnoprávnym inštitúciám pre ich právne postavenie orgánov verejnej moci sú aktivované na doručovanie prvým prihlásením sa do schránky, najneskôr však na desiaty deň od dňa zriadenia. Na desiaty deň po zriadení elektronickej schránky bude orgán verejnej moci sprístupnený v sekcii „Nájsť službu“ a bude mu priradená služba „Všeobecnej agendy“, prostredníctvom ktorej majú fyzické alebo právnické osoby možnosť zasielať podania, akými sú napr. žiadosť, <a href="https://www.slovensko.sk/sk/slovnik/detail/_staznost">sťažnosť</a>, stanovisko a pod.

<p>Elektronická schránka zriadená verejnoprávnej inštitúcii pre jej právne postavenie právnickej osoby slúži na doručovanie výstupov z konaní zo strany iných orgánov verejnej moci, ak ide o činnosti v ktorých je právnickou osobou (napr. ako zamestnávateľ). Elektronická schránka právnickej osoby nezapísanej v Obchodnom registri SR, bude na doručovanie automaticky aktivovaná 1. 5. 2018.</p>',	NULL,	615,	'Orgán verejnej moci'),
('5. Ak má orgán verejnej moci viacero „pobočiek“ (napr. Sociálna poisťovňa), je potrebné zriaďovať im elektronické schránky ako organizačným zložkám?',	'Je na zvážení orgánu verejnej moci, či považuje zriadenie elektronických schránok pre svoje pobočky za potrebné. Je však nevyhnutné, aby povinné osoby v konaniach, v ktorých vykonáva verejnú moc priamo pobočka orgánu verejnej moci, mali umožnené doručovať aj takejto organizačnej zložke. Ak má napr. Sociálna poisťovňa ako orgán verejnej moci len jednu elektronickú schránku a zabezpečí distribúciu podaní, ktoré sú smerované na jej pobočky, tak je účel zákona naplnený a nie je potrebné, aby každá pobočka Sociálnej poisťovne mala svoju vlastnú elektronickú schránku.

<p><b>Uvedený postup platí rovnako aj pre Generálnu prokuratúru, Policajný zbor, úrady práce, daňové úrady na úrovni krajov a okresov, prípadne ak jeden zriaďovateľ má vo svojej pôsobnosti viacero škôl.</b></p>',	NULL,	616,	'Orgán verejnej moci'),
('6. Sú súkromné zdravotné poisťovne povinnými osobami podľa zákona o eGovernmente?',	'Sú nimi v rozsahu, v akom vykonávajú verejnú moc, napríklad zákonné kompetencie a rozhodovanie o právach a povinnostiach osôb v oblasti verejného zdravotného poistenia. V ostatných veciach nie sú orgánmi verejnej moci, ale iba bežnými právnickými osobami, povinnosti, ktoré sa na nich v zmysle zákona vzťahujú, sú limitované (napr. automatická aktivácia elektronickej schránky na doručovanie, potrebné obstaranie eID kariet pre prístup do nich a pod.).',	NULL,	617,	'Orgán verejnej moci'),
('7. Môžem využiť svoju elektronickú podateľňu alebo musím použiť modul centrálnej podateľne <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>?',	'<b>Funkcionalitu elektronickej podateľne môže orgán verejnej moci zabezpečovať sám</b> tak, že v rámci svojho systému implementuje systém elektronickej podateľne a prepojí ho na spracovanie správ doručovaných do jeho elektronickej schránky.

<p><b>Orgán verejnej moci však môže využiť aj funkcionalitu modulu centrálnej elektronickej podateľne <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a></b>, ktorá zabezpečí spracovanie správ doručovaných do jeho elektronickej schránky v súlade s požiadavkami zákona „v mene“ príslušného orgánu verejnej moci, pričom je na samotnom orgáne verejnej moci, ktorý spôsob si vyberie, tieto možnosti sa však vylučujú.</p>',	NULL,	618,	'Orgán verejnej moci'),
('8. Potrebujeme mať (ako orgán verejnej moci) vlastnú elektronickú podateľňu, keď máme elektronickú schránku?',	'Elektronická <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-podatelna">podateľňa</a> a elektronická schránka sú dve odlišné veci. Elektronická schránka je niečo ako poštová schránka, do ktorej poštár vhadzuje poštu. Elektronická schránka však ďalej poštu nespracováva – na to slúži práve <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-podatelna">elektronická podateľňa</a>, ktorá vytvára doručenky pre podania adresované orgánu verejnej moci, a zároveň je vstupom do systému registratúr a ďalšieho spracovania v procesoch príslušného úradu.

<p>V súčasnosti sa môže orgán verejnej moci sám rozhodnúť, či si vybuduje vlastnú podateľňu alebo bude využívať centrálnu elektronickú podateľňu, pričom obe z týchto riešení si vyžadujú určité finančné náklady a ľudské zdroje. Zároveň upozorňujeme, že novela zákona o e-Governmente <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2017/238/20180101.html">č. 238/2017 Z. z.</a> zaviedla od 1. novembra 2017 prechodné obdobie, v ktorom môžu orgány verejnej moci používať vlastné elektronické podateľne a prispôsobiť informačné systémy na povinné používanie modulu centrálnej elektronickej podateľne (po 31.decembri 2020). Použitie výnimiek podľa § 10 ods. 13 a 14 zákona o e-Governmente je možné aplikovať aj počas plynutia prechodného obdobia.</p>',	NULL,	619,	'Orgán verejnej moci'),
('9. Na čo využijem zaručenú konverziu dokumentu?',	'Zaručená konverzia je technický postup, pri ktorom sa obsah pôvodného dokumentu transformuje z pôvodného dokumentu do novovzniknutého dokumentu v inej podobe (z listinnej do elektronickej alebo naopak), ktorý je možné využiť na rovnaké právne účely ako pôvodný dokument.

<p>S dokumentom skonvertovaným podľa zákona o eGovernmente možno plnohodnotne nakladať ako s dokumentom v pôvodnej podobe, vďaka čomu sa napr. výrazne zvyšuje rýchlosť komunikácie, nároky na priestory pri archivácii, rýchlosť dostupnosti dokumentov a podobne. Nie je to bežný scan alebo tlač, účelom tohto postupu je najmä možnosť použiť dokument v transformovanej podobe pri elektronickej komunikácii s orgánmi verejnej moci, pričom k tomu existujú garancie obdobne ako pri úradnom osvedčovaní podpisu.</p>

<p>Viac informácií o zaručenej konverzii nájdete na <a href="https://www.mirri.gov.sk/sekcie/informatizacia/governance-a-standardy/zakon-o-e-governmente/zarucena-konverzia/index.html">webovom sídle Ministerstva investícií, regionálneho rozvoja a informatizácie SR...</a></p>',	NULL,	620,	'Orgán verejnej moci'),
('10. Je orgán verejnej moci povinný zverejňovať na Centrálnej elektronickej úradnej tabuli?',	'Povinnosť orgánu verejnej moci používať <a href="https://cuet.slovensko.sk/">Centrálnu úradnú elektronickú tabuľu</a> (<a href="https://www.slovensko.sk/sk/slovnik/detail/_cuet">CUET</a>) platí vo všeobecnosti od 1. 11. 2016. Podľa zákona o eGovernmente sú orgány verejnej moci (aj obce) povinné na výkon verejnej moci používať spoločné moduly, pričom riešenie <a href="https://www.slovensko.sk/sk/slovnik/detail/_cuet">CUET</a> je súčasťou modulu podľa <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20180101#paragraf-10.odsek-3.pismeno-f">§ 10 odseku 3 písm. f)</a>. Inými slovami, ak má orgán verejnej moci integráciu na spoločné moduly <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, mal by mať sprístupnenú funkcionalitu na zverejňovanie na <a href="https://www.slovensko.sk/sk/slovnik/detail/_cuet">CUET</a>.

<p><b>V súčasnosti je orgán verejnej moci povinný zverejňovať na <a href="https://www.slovensko.sk/sk/slovnik/detail/_cuet">CUET</a> jedna k jednej všetko to, čo na fyzickú úradnú tabuľu.</b></p>

<p>Od 1.1.2018 má povinnosť zverejňovať na elektronickej úradnej tabuli aj Úrad pre reguláciu elektronických komunikácií a poštových služieb všetko, čo zverejňuje vo vestníku. Zverejnenie má informatívny charakter.</p>',	NULL,	621,	'Orgán verejnej moci'),
('11. Zobrazujú sa pri podpise kvalifikovaným elektronickým podpisom s mandátnym certifikátom osobné údaje fyzickej osoby (rodné číslo a bydlisko), ktorá koná za orgán verejnej moci?',	'Podľa § 8 a § 9 zákona <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2016/272/20171231#paragraf-8">č. 272/2016 Z. z.</a> o dôveryhodných službách mandátny certifikát vydávaný fyzickej osobe oprávnenej konať za orgán verejnej moci neobsahuje údaje ako rodné číslo fyzickej osoby alebo jej bydlisko.
Povinnými atribútmi sú meno a priezvisko  oprávnenej osoby a identifikačné číslo dokladu (občiansky preukaz alebo iný doklad, napr. služobný preukaz). Povinné údaje oprávnenej osoby sa potom zobrazujú a sú sprístupnené aj v prostredí elektronickej schránky na ústrednom portáli verejnej správ',	NULL,	622,	'Orgán verejnej moci'),
('12. Ako vybaviť kvalifikovaný certifikát k elektronickej pečati v prípade, že orgán verejnej moci bude využívať iba všeobecné formuláre dostupné v elektronickej schránke?',	'Kvalifikovanú elektronickú pečať je možné na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> vytvárať pomocou kľúčového páru v HSM module <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> nasledovnými spôsobmi: integráciou na centrálnu elektronickú podateľňu (CEP) alebo na portáli slovensko.sk v konštruktore správy v elektronickej schránke OVM pomocou tlačidla „Zapečatiť“. Návod na využívanie kvalifikovanej elektronickej pečate v konštruktore správy je zverejnený na portáli slovensko.sk pod názvom „<a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/navod_spolocna_autorizacia.pdf">Spoločná autorizácia elektronických dokumentov orgánmi verejnej moci na portáli slovensko.sk</a>". Autorizovať elektronické dokumenty kvalifikovanou elektronickou pečaťou je možné aj prostredníctvom vlastného externého certifikovaného zariadenia (čipová karta, USB kľúč a pod., t. j. nie v HSM module <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>). Tieto produkty poskytujú jednotliví kvalifikovaní poskytovatelia dôveryhodných služieb. <a href="https://www.nbu.gov.sk/doveryhodne-sluzby/doveryhodna-infrastruktura/akreditovane-certifikacne-autority/index.html">Zoznam poskytovateľov</a> zverejňuje Národný bezpečnostný úrad.

<ul>
<li><a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/navod_KSC.pdf">Návod na vydanie a inicializáciu kvalifikovaného certifikátu pre kvalifikovanú elektronickú pečať na autorizovanie rozhodnutí OVM<</a>/li>
<li><a href="https://www.slovensko.sk/sk/institucie-formulare-a-ziado/dostupnost-a-pouzitie-tlacidla">Dostupnosť a použitie tlačidla „Zapečatiť“ v elektronickej schránke OVM</a></li>
</ul>',	NULL,	623,	'Orgán verejnej moci'),
('13. Akou formou môžu orgány verejnej moci komunikovať so zahraničnými právnickými a fyzickými osobami, ktoré na Slovensku nemajú sídlo alebo miesto podnikania?',	'V zmysle zákona o e-Governmente je miestom na elektronické doručovanie aktivovaná elektronická schránka. Zahraničná fyzická alebo právnická osoba má možnosť požiadať si o zriadenie elektronickej schránky. Povinnou náležitosťou žiadostí o zriadenie schránok pre zahraničné subjekty sú atribúty ako názov a adresa sídla právnickej osoby a jej identifikátor (za identifikátor sa v tomto prípade považuje podľa § 3 písm. n) bod 3 zákona o e-Governmente identifikačné číslo organizácie alebo obdobné číslo alebo iný identifikátor, ktorý je jej pridelený alebo určený na účely jednoznačnej identifikácie podľa právneho poriadku štátu, v ktorom má sídlo alebo miesto podnikania) a identifikátor fyzickej osoby (za identifikátor sa podľa § 3 písm. n) bod 1 zákona o e-Governmente považuje obdobné číslo ako rodné číslo alebo identifikátor, ktorý je fyzickej osobe pridelený na účely jednoznačnej identifikácie podľa právneho poriadku štátu, ktorého je fyzická osoba občanom v spojení s menom a priezviskom).

<p>V prípade, že sa na portál slovensko.sk prihlási zahraničná osoba cez <a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> Node (momentálne je takéto prihlásenie dostupné len pre fyzické osoby s nemeckým občianskym preukazom alebo dokladom o pobyte cudzinca žijúceho v Nemecku), údaje o takejto osobe sa pri prvom prihlásení zapíšu z <a href="https://www.slovensko.sk/sk/slovnik/detail/_eidas">eIDAS</a> Node do IAM a vytvorí sa jej elektronická schránka. Elektronická schránka nie je automaticky aktivovaná na doručovanie, ale zahraničná osoba si ju môže aktivovať sama.</p>

<p>Ak zahraničná fyzická alebo právnická osoba elektronickú schránku na portáli slovensko.sk zriadenú a aktivovanú na doručovanie nemá, úradné rozhodnutia jej treba doručiť listinným spôsobom.</p>',	'Podnikanie',	624,	'Orgán verejnej moci'),
('14. Prečo sa nezobrazujú viacnásobne vnorené podpisy a jednotlivé dokumenty z viacnásobne vnorených podpisov? Prečo sa po stiahnutí nepodpísaného obsahu
stiahne ASiC súbor a nerozbalí sa jeho obsah?',	'<a href="https://www.slovensko.sk/sk/slovnik/detail/_cep">Centrálna elektronická podateľňa</a> neumožňuje automatizovane overovať a teda ani zobrazovať podpisy a objekty nachádzajúce sa vo vnútri jednotlivých externe podpísaných dátových objektov (takzvané vnorené podpisy alebo vnorené podpisové kontajnery).

<p><a href="https://www.slovensko.sk/sk/slovnik/detail/_cep">Centrálna elektronická podateľňa</a> podporuje vytváranie a overovanie podpisov pre formáty, ktoré sú uvedené <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">v dokumentácii Centrálnej elektronickej podateľne</a>.</p>

<p>V prostredí elektronickej schránky je možné funkciou "Overiť podpisy" zobraziť väzby medzi podpismi a podpísanými dokumentami, vrátane viacnásobných podpisov. Pre viacnásobne vnorené podpisy a kontajnery je potrebné manuálne stiahnutie súboru z podpisového kontajnera a jeho následné manuálne overenie cez službu overenia, prípadne manuálne rozbalenie.</p>

<p>Napríklad v prípade potreby rozbalenia vnoreného ASiC nachádzajúceho sa vo vnútri ASiC je potrebné tento vnorený ASiC stiahnuť a rozbaliť napríklad priložením do prílohy v konštruktore správy, prípadne použitím aplikácie ako je napríklad D.Viewer.</p>

<p>V prípade PDF súborov, ktoré sú len priamo podpísané podpisom PAdES, sa v prostredí <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> umožňuje stiahnuť PDF súbor ako celok, nie je teda poskytovaná možnosť rozbaliť PDF súbor do podoby jednotlivých verzií PDF súboru, v akej bol podpisovaný. Na účel získania konkrétnej podoby PDF súboru podpísanej konkrétnym podpisom (t.j. PDF bez informácií pridanými s ďalšími podpismi alebo úpravami PDF súboru) odporúčame používať špecifické aplikácie, ako je napríklad Adobe Reader.</p>',	NULL,	625,	'Orgán verejnej moci'),
('15. Aký formát musia mať úradné dokumenty, aby sa bezproblémovo zobrazovali?',	'Dokumenty musia spĺňať požiadavky v zmysle štandardov, ktoré sú súčasťou Vyhlášky <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">č. 78/2020 Z. z.</a> o štandardoch pre informačné technológie verejnej správy (vyhláška o štandardoch ITVS).',	NULL,	626,	'Orgán verejnej moci'),
('33. Ako otvoriť súbor bez prípony, ktorý sa nachádza v ASiC alebo v elektronickej správe? ',	'V grafickom rozhraní elektronickej schránky na Ústrednom portáli verejnej správy sa automaticky dopĺňa v názve súboru prípona pre tie súbory, ktoré nemajú v názve príponu alebo majú uvedenú nesprávnu príponu. Prípona sa dopĺňa podľa princípov uvedených v <a href="https://www.slovensko.sk/sk/o-portali/technicke-informacie-o-upvs">technických informáciách o funkčnosti portálu</a>.

<p>V prípade využitia aplikácie D.Viewer na otváranie alebo ukladanie podpísaného súboru bez prípony sa automaticky dopĺňa prípona súboru len pre základné formáty súborov na základe hodnoty mimetype.</p>

Pravidlá technickej funkčnosti elektronickej schránky sú uvedené v dokumente <a href="https://www.slovensko.sk/_img/CMS4/eDESK/Dokumentacia_funkcnosti_eDesk.pdf">Dokumentácia funkčnosti elektronickej schránky</a>. [.pdf, 494.9 kB]',	NULL,	644,	'Orgán verejnej moci'),
('16. V akom formáte musí byť príloha, aby ju Centrálna elektronická podateľňa vyhodnotila za správnu?',	'V zmysle Vyhlášky <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">č. 78/2020 Z. z.</a> o štandardoch pre informačné technológie verejnej správy povinné osoby pre odosielanie alebo zverejňovanie textových súborov používajú najmä formát PDF, ak sa od adresáta nevyžaduje ďalšia úprava tohto súboru a tiež v prípade, ak je súčasťou textového súboru aj grafika.

<p>Všetky prílohy úradných rozhodnutí, ktoré sú vo formáte PDF a sú podpísané elektronickým podpisom alebo opatrené elektronickou pečaťou, musia byť podľa vyhlášky o štandardoch ITVS vo formáte PDF/A-1, PDF/A-2 alebo PDF/A-3. Tak sa zabezpečí, že sa budú správne zobrazovať.</p>

Do 30. júna 2017 bola v Centrálnej elektronickej podateľni podmieňovaná <a href="https://www.slovensko.sk/sk/faq/_vykon-verejnej-moci-organy-ve#neplatnost">platnosť autorizácie</a> vo formátoch XAdES_ZEP a ZEPf súladom podpísaných PDF súborov voči formátu PDF/A-1a podľa proprietárneho validátora používajúceho špecifické posudzovanie validnosti, ktorý aj niektoré súladné PDF/A súbory označuje za nevalidné, v dôsledku čoho mohla byť platná autorizácia vyhodnotená ako neplatná. Od 1. júla 2017 <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">validácia PDF súborov nemá v centrálnej elektronickej podateľni</a> vplyv na platnosť autorizácie a tento validátor sa v centrálnej elektronickej podateľni používa iba pre informatívne účely. Podpora pre referenčný validátor VeraPDF sa v centrálnej elektronickej podateľni pripravuje.</p>

<p>Do 30. júna 2017 bola v Centrálnej elektronickej podateľni podmieňovaná <a href="https://www.slovensko.sk/sk/faq/_vykon-verejnej-moci-organy-ve#neplatnost">platnosť autorizácie</a> vo formátoch XAdES_ZEP a ZEPf validnosťnou podpísaných PDF súborov voči formátu PDF/A-1a v proprietárnom validátore používajúcom špecifické posudzovanie validnosti, ktorý aj niektoré validné PDF/A súbory označuje za nevalidné, v dôsledku čoho mohla byť platná autorizácia vyhodnotená ako neplatná. Od 1. júla 2017 <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">validácia PDF súborov nemá v centrálnej elektronickej podateľni</a> vplyv na platnosť autorizácie a tento validátor sa v centrálnej elektronickej podateľni používa iba pre informatívne účely. Podpora pre referenčný validátor VeraPDF sa v centrálnej elektronickej podateľni pripravuje.</p>

<p><b>Príklad z praxe, ktorý môže nastať:</b></p>

<p>V prípade zobrazenia technických informácií vo výsledku overenia podpisu môže používateľov zmiasť informácia o neplatnosti validácie objektu, t.j. validácie formátu podpísaného dokumentu voči ich špecifikácii. Výsledok validácie objektu však nemá žiaden vplyv na platnosť autorizácie a nemusí byť presný vzhľadom na špecifické používané validátory. Podstatná pre platnosť autorizácie je informácia o platnosti podpisu. Podľa účinnej Vyhlášky o štandardoch pre ITVS <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">č. 78/2020 Z. z.</a>, je verejná správa povinná akceptovať podpísané PDF súbory aj v iných verziách než je PDF/A-1a. To znamená, že pokiaľ sa vám vo výsledku overenia podpisu objekt v časti výsledku validácie objektu zobrazuje ako neplatný, nemá to vplyv na platnosť autorizácie. <a href="https://www.slovensko.sk/sk/slovnik/detail/_cep">Centrálna elektronická podateľňa</a> vykonáva informatívne validácie len niektorých formátov súborov a len pri niektorých formátoch podpisov. Podrobnosti sú uvedené <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">v dokumentácii Centrálnej elektronickej podateľne</a>.</p>',	NULL,	627,	'Orgán verejnej moci'),
('17. Musia orgány verejnej moci využívať elektronické schránky aj na internú komunikáciu, prípadne komunikáciu medzi sebou?',	'Orgán verejnej moci môže na komunikáciu s iným orgánom verejnej moci (ak ani jeden z nich nie je v postavení účastníka konania) využívať modul procesnej integrácie a integrácie údajov <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> (po jeho plnom sprevádzkovaní) alebo priamy elektronický kontakt; rovnako tak môže používať aj automatické funkcie informačných systémov, ako napr. prístupy do príslušných registrov atď. Nesmie však ísť o prípady elektronického doručovania podaní a rozhodnutí, kde je povinnosť používania elektronických schránok – teda napríklad o prípad, keď je orgán verejnej moci účastníkom konania vedeného iným orgánom verejnej moci.',	NULL,	628,	'Orgán verejnej moci'),
('18. Ako má orgán verejnej moci postupovať v prípade, že v overení autorizácie prílohy je autorizácia označená ako neplatná?',	'Ústredný portál verejnej správy v niektorých prípadoch vyhodnocuje autorizáciu v súboroch ZEPf (.zep) a XAdES_ZEP (.xzep), ktoré by sa v zmysle legislatívy účinnej od 15. októbra 2015 obvykle nemali vytvárať, ako neplatnú.

<p>Ide napríklad o prípady, ak je autorizovaný elektronický dokument v inom formáte ako je:</p>

<ul>
<li>.pdf, rtf, .txt, .png, .xml, tiff, .odt, ktoré boli do 14. októbra 2015 predpísané v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2009/136/20090408.html#prilohy">prílohe č. 2</a> Vyhlášky NBÚ č. 136/2009 Z.z.,</li>
<li>.pdf (PDF/A-1, PDF/A-2, PDF 1.3 - 2.0), .txt, .png, .xml (XMLDataContainer), ktoré sú od 15. októbra 2015 podrobne predpísané vo Vyhláške o štandardoch,</li>
<li>alebo ak <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> elektronický dokument vyhodnotí ako nevalidný podľa špecifikácie daného formátu.</li>
</ul>

<p>Aktuálne informácie o akceptovaných formátoch sú uvedené v dokumentácii <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">centrálnej elektronickej podateľne</a>.</p>

<p>Príkladom je autorizácia vyhodnotená ako neplatná s kódom výsledku overenia č. 110. V týchto prípadoch je potrebné na overenie autorizácie použiť niektorý z dostupných certifikovaných produktov namiesto služby overenia autorizácie na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.</p>

<p>Od 1. júla 2017 bola na portáli <a href="https://www.slovensko.sk/sk/titulna-stranka">slovensko.sk</a> <a href="https://www.slovensko.sk/sk/oznamy/detail/_oprava-overenia-autorizacie">odstránená nekompatibilita pri vyhodnocovaní platnosti autorizácie</a> elektronických dokumentov, ktoré sú vo formátoch PDF/A-1, PDF 1.3 a PDF 1.4 (.pdf) podpísané v súboroch ZEPf (.zep) alebo XAdES_ZEP (.xzep). Do 30. júna 2017 bola autorizácia elektronických dokumentov vo formátoch PDF/A-1, PDF 1.3 a PDF 1.4 v súboroch ZEPf (.zep) a XAdES_ZEP (.xzep) na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> vyhodnocovaná ako neplatná s kódom výsledku overenia č. 2104 a 2105 v prípade, že autorizovaný dokument bol vyhodnotený ako nevalidný podľa špecifikácie PDF/A-1a.</p>

<p>Zosúladenie <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> s Nariadením Európskeho parlamentu a Rady (EÚ) <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32014R0910&from=EN">č. 910/2014</a> a s technickými špecifikáciami elektronických podpisov podľa Vykonávacieho rozhodnutia Komisie (EÚ) <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">2015/1506</a> bude zrealizované v nasledujúcom období.</p>

<p>Príklady výsledkov overenia autorizácie:</p>

<p>Prípad č. 1:</p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/110_neplatna_autorizacia.png">
</picture></p>

<p>"Popis stavu overenia autorizácie: Neplatná"
<br>"Kód výsledku overenia: 110"
<br>"Popis výsledku overenia: Neúspešná validácia podpísaných dátových objektov."</br></p>

<p>Prípad č. 2:</p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/overenie_kep_chyba_2.png">
</picture></p>

<p>"Popis stavu overenia autorizácie: Neplatná"
<br>"Kód výsledku overenia: 2105"
<br>"Popis výsledku overenia: Chyba pri vyhodnocovaní súladu so špecifikáciou PDF/A-1."</br></p>',	NULL,	629,	'Orgán verejnej moci'),
('19. Aké prípony majú elektronicky podpísané súbory (.asice, .xzep, .pdf, ...)?',	'Súbory obsahujúce elektronické podpisy alebo pečate môžu v názve súboru používať rôzne prípony, avšak samotná prípona súboru nijako negarantuje, že súbor je skutočne podpísaný.

<p>Pre zistenie, či je súbor podpísaný platným kvalifikovaným elektronickým podpisom alebo kvalifikovanou elektronickou pečaťou, je potrebné využiť službu overenia podpisov. Pre informatívne overenie je k dispozícii služba na <a href="https://www.slovensko.sk/sk/e-sluzby/sluzba-overenia-zep">slovensko.sk</a>.</p>

<p>V prípade súborov obsahujúcich elektronické podpisy môže ísť o:</p>

<ul>
<li>podpisové kontajnery, ktoré obvykle obsahujú samostatné elektronické dokumenty a samostatné podpisy alebo pečate</li>
<li>podpisy obsahujúce nimi podpisované dokumenty ako svoju súčasť</li>
<li>podpisované elektronické dokumenty, ktoré obsahujú podpisy ako svoju súčasť</li>
</ul>

<p>Podpisové kontajnery vytvorené v súlade s platnou legislatívou účinnou od 1. júla 2016 - Vykonávacie rozhodnutie Komisie (EÚ) <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">č. 2015/1506</a>:</p>

<ul>
<li>podpisové kontajnery ASiC-E používajú prípony: <b>.asice, .sce, .zip</b></li>
<li>podpisové kontajnery ASiC-S používajú prípony: <b>.asics, .scs, .zip</b></li>
</ul>

<p>Podpisové kontajnery vytvorené na základe slovenských pravidiel účinných do 30. júna 2016 alebo po tomto dátume v prípade vzájomnej dohody všetkých strán príslušnej komunikácie:</p>

<ul>
<li>podpisové kontajnery ZEPf obvykle používajú príponu: <b>.zep</b></li>
<li>podpisové kontajnery a podpisy XAdES_ZEP používajú obvykle prípony: <b>.xzep, .zepx</b> (nesprávne sa niekedy používa prípona .xml alebo .zep)</li>
</ul>

<p>Elektronické dokumenty, ktoré obsahujú podpisy ako svoju súčasť:</p>

<ul>
<li>PDF súbory obsahujúce podpis PAdES používajú príponu: <b>.pdf</b></li>
<li>XML súbory obsahujúce podpis XAdES enveloped používajú príponu: <b>.xml</b> (alebo inú) (Tieto podpisy nie sú v súčasnosti v Centrálnej elektronickej podateľni podporované.)</li>
</ul>

<p>Elektronické podpisy, ktoré obsahujú nimi podpisované elektronické dokumenty ako svoju súčasť: (Tieto podpisy nie sú v súčasnosti v Centrálnej elektronickej podateľni podporované.)</p>

<ul>
<li>podpisy CAdES (enveloping) používajú príponu: <b>.p7m</b></li>
<li>podpisy XAdES enveloping používajú príponu: <b>.xml</b></li>
</ul>

<p>Elektronické podpisy oddelené od podpísaných elektronických dokumentov</p>

<ul>
<li>podpisy CAdES "detached" používajú príponu: <b>.p7s</b></li>
<li>podpisy XAdES "detached" používajú príponu: <b>.xml</b></li>
</ul>

<p>Časové pečiatky oddelené od elektronických dokumentov na ktoré sa vzťahujú</p>

<ul>
<li>používajú príponu: <b>.tst<b></li>
</ul>

<p>Elektronické dokumenty, ktoré sú podpísané alebo zapečatené v podpisových kontajneroch alebo v elektronických podpisoch, môžu mať rôzne formáty, napríklad .pdf, .txt, .png. Orgány verejnej moci sú <a href="https://www.slovensko.sk/sk/faq/faq-podania/#dokumenty">povinné prijímať a vytvárať formáty elektronických dokumentov predpísané vo Vyhláške</a> <a href="https://www.slovensko.sk/sk/faq/faq-podania/#dokumenty">č. 78/2020 Z. z.</a> o štandardoch pre informačné technológie verejnej správy SR.</p>

<p>Overovanie elektronických podpisov a pečatí XAdES enveloping (.xml), XAdES enveloped (.xml), CAdES enveloping (.p7m) a samostatných časových pečiatok dokumentov (.tst) nie sú na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v súčasnosti plne podporované.</p>

<p>Overovanie elektronických podpisov a pečatí XAdES enveloping (.xml), XAdES enveloped (.xml), CAdES enveloping (.p7m) a samostatných časových pečiatok dokumentov (.tst) nie sú na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v súčasnosti plne podporované.</p>

<p>Pre tieto formáty je preto potrebné použiť inú službu overenia podpisov. Podpisy "detached" oddelené od podpísaných dokumentov (.p7s, .xml) je možné na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v súčasnosti spracúvať a  overovať len v podpisovom kontajneri.</p>

<p>Podrobnosti o podporovaných formátoch podpisov na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> môžete nájsť <a href="LINK">SLOVO</a>v dokumentácii funkčnosti centrálnej elektronickej podateľne.</p>',	NULL,	630,	'Orgán verejnej moci'),
('20. Aké formáty elektronických podpisov musia orgány verejnej moci prijímať a vytvárať?',	'Povinné formáty kvalifikovaných elektronických podpisov a pečatí ako aj povinné formáty podpisových kontajnerov <a href="http://www.nbusr.sk/wp-content/uploads/doveryhodne-sluzby/docs/Povinne-formatyQESpre-subjekt-verejneho-sektora.pdf">sú uvedené v osobitnom dokumente NBÚ</a> a vyplývajú z nariadenia Európskeho parlamentu a Rady (EÚ) <a href="https://eur-lex.europa.eu/legal-content/SK/ALL/?uri=CELEX%3A32014R0910">č. 910/2014</a> a z Vykonávacieho rozhodnutia Komisie (EÚ) <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32015D1506&from=EN">č. 2015/1506</a>. Ide o formáty XAdES, CAdES, PAdES a ASiC, ktorých obvyklé prípony sú uvedené v predošlej otázke.

<p>Pred nadobudnutím účinnosti tejto legislatívy boli v Slovenskej republike definované aj formáty XAdES_ZEP (.xzep, .zepx) a ZEPf (.zep), ktoré boli informatívne uvedené aj v <a href="http://www.nbusr.sk/wp-content/uploads/doveryhodne-sluzby/docs/formaty_zep.pdf">štandardoch NBÚ</a> účinných do 30.6.2016. V zmysle <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> [.pdf, 383.6 kB], formát XAdES_ZEP (.xzep, .zepx) po tomto dátume nie sú orgány verejnej moci povinné prijímať, nakoľko tento formát má požiadavky nad rámec požiadaviek prílohy Vykonávacieho rozhodnutia Komisie (EÚ) č. 2015/1506. Z formátu ZEPf (.zep) sú orgány verejnej moci podľa <a href="https://www.slovensko.sk/_img/CMS4/sposob_vyhodnocovania_QTS_a_QES.PDF">stanoviska NBÚ</a> [.pdf, 383.6 kB] povinné prijímať podpis CAdES (prípadne XAdES), nakoľko tento je v súlade s prílohou Vykonávacieho rozhodnutia Komisie (EÚ) č. 2015/1506 a je ho možné validovať ako samostatný podpis súboru .eml (obsahujúci base64 kódované súbory) alebo vložiť do ASiC a validovať ako ASiC v súlade s nariadením Európskeho parlamentu a Rady č. 910/2014.</p>

<p>Formát XAdES_ZEP (.xzep, .zepx) a kontajnery ZEPf (.zep) sa v zmysle platnej legislatívy už nemajú vytvárať. Za vytvorenie podpisu alebo pečate vo formáte, ktorý nie sú v súlade s Vykonávacím rozhodnutím Komisie (EÚ) č. 2015/1506, sa v zmysle § 14 ods. 3 zákona č. 272/2016 Z.z. môže orgánu verejnej moci udeľovať sankcia.</p>',	NULL,	631,	'Orgán verejnej moci'),
('21. Ako zistím, či je súbor elektronicky podpísaný?',	'Súbor podpísaný kvalifikovaným elektronickým podpisom alebo opatrený kvalifikovanou elektronickou pečaťou nemusí obsahovať písomnú podobu vlastnoručného podpisu alebo pečiatky.

<p>Pre overenie či je súbor elektronicky podpísaný, je potrebné použiť aplikáciu alebo službu určenú na spracovanie a overovanie elektronických podpisov.</p>

<p>Funkcia informatívneho overovania podpisov je dostupná pre dokumenty v elektronických správach v rámci funkcií elektronických schránok. Pre informatívne overenie podpisov je možné využiť aj verejnú <a href="https://www.slovensko.sk/sk/e-sluzby/sluzba-overenia-zep">službu overovania podpisov</a>.</p>

<p>Stránka <a href="https://www.slovensko.sk/sk/titulna-stranka">slovensko.sk</a> podporuje informatívne overovanie podpisov elektronických dokumentov len v <a href="https://www.slovensko.sk/sk/faq/_vykon-verejnej-moci-organy-ve#neplatnost">niektorých formátoch</a>. Pre overenie podpisov pre iné formáty súborov odporúčame využiť iné dostupné certifikované nástroje.</p>',	NULL,	632,	'Orgán verejnej moci'),
('22. Ako môžem otvoriť elektronicky podpísané dokumenty?',	'Elektronicky podpísané dokumenty sa prenášajú najmä v špecifických formátoch podpisových kontajnerov alebo podpisov, pre ktorých otvorenie je potrebný špecifický softvér.

Elektronické schránky na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> priamo umožňujú zobraziť podpísaný elektronický dokument, stiahnuť podpísaný elektronický dokument v jeho podpísanej pôvodnej forme (obvykle v podpisovom kontajneri), ako aj uložiť z podporovaného podpisového kontajnera samotný elektronický dokument. Je na to možné využiť funkcie "Zobraziť", "Stiahnuť" alebo "Stiahnuť nepodpísaný obsah" po kliknutí na tri bodky pri súbore v elektronickej správe. V prípade použitia funkcie uloženia nepodpísaného obsahu však výsledný súbor neobsahuje podpis.

<p>V prípade PDF súborov priamo podpísaných podpisom PAdES je možné pre zobrazenie obsahu použiť bežný prehliadač PDF súborov.</p>

<p style="color:Red;">Ponuka "Otvoriť v D.Viewer" bola z menu v novej elektronickej schránke vypustená, nahradili ju pokročilé funkcie dostupné priamo v elektronickej schránke s detailnými informáciami o podpisoch, väzbách podpisov na dokumenty a o kontajneroch. Aplikácia D. Viewer je naďalej použiteľná po stiahnutí a otvorení podpísaného súboru v počítači. V aplikácii D.Viewer sa však nachádzajú iba informácie z podpisov vo väzbe na dokumenty, neumožňuje overenie platnosti podpisov a ani zobrazenie údajov vyplnených podľa väčšiny elektronických formulárov.</p>

<p>Pre zobrazenie súborov bez použitia funkcie elektronickej schránky je možné použiť aj samostatnú aplikáciu D.Viewer pre MS Windows dostupnú na stránke "Na stiahnutie" alebo jej <a href="https://www.slovensko.sk/static/zep/java_apps/dviewer_standalone_2.0.jnlp">Java verziu pre MS Windows, MacOS X a GNU/Linux</a>, prípadne iné aplikácie od iných výrobcov.</p>

Formáty XAdES_ZEP (.xzep, zepx) a ZEPf (.zep), ktoré vznikli v Slovenskej republike pred účinnosťou Nariadenia <a href="https://eur-lex.europa.eu/legal-content/SK/ALL/?uri=CELEX%3A32014R0910">č. 910/2014</a>, nie sú používané mimo SR a nemusia byť ani akceptované členskými štátmi EÚ.',	NULL,	633,	'Orgán verejnej moci'),
('23. Ako sa elektronicky podpisujú úradné dokumenty?',	'Pri výkone verejnej moci elektronicky riaditeľ, starosta, (oprávnená osoba) rozhodnutia podpisuje prostredníctvom mandátneho certifikátu alebo autorizuje kvalifikovanou elektronickou pečaťou, a teda nie svojím osobným kvalifikovaným certifikátom uloženým na eID (na elektronickom občianskom preukaze s čipom).

<p>V praxi platí, že ak úradný dokument vyžaduje podpis konkrétnej osoby v konkrétnej funkcii (napríklad starosta), použije sa na autorizáciu mandátny certifikát. Ak však osobitný právny predpis neustanovuje podpis konkrétnej osoby na úradnom dokumente, teda vyžaduje iba podpis oprávnenej osoby ako prejav vôle konať v mene orgánu verejnej moci (v listinne podobe je ekvivalentom pečiatka úradu), použije sa na autorizáciu mandátny certifikát alebo kvalifikovaná elektronická pečať orgánu verejnej moci.</p>

<ul>
<li><a href="https://www.slovensko.sk/sk/agendy/agenda/_ako-vybavit-mandatny-certifika/">Ako si vybaviť mandátny certifikát...</a></li>
<li><a href="https://www.slovensko.sk/sk/agendy/agenda/_usmernenie-ku-konaniu-o-vydani/">Ako si vybaviť kvalifikovaný certifikát pre kvalifikovanú elektronickú pečať...</a></li>
</ul>',	NULL,	634,	'Orgán verejnej moci'),
('24.Existuje služba, ktorá zabezpečí, aby bola doložka právoplatnosti a vykonateľnosti neoddeliteľne spojená s úradným dokumentom?',	'<a href="LINK">SLOVO</a>Centrálna elektronická podateľňa (CEP) už dnes poskytuje službu pre spoločnú autorizáciu elektronických dokumentov, ktorá je dostupná po integrácii daného orgánu verejnej moci na CEP. To znamená, že funkcie je možné využívať prostredníctvom informačného systému orgánu verejnej moci, ktorý sa integruje na CEP a bude volať jej služby. Ďalšie inštrukcie pre poskytovateľov služieb prostredníctvom <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> sú dostupné na webovom sídle <a href="https://www.slovensko.sk/sk/slovnik/detail/_nases">NASES</a> a v integračných manuáloch dostupných na <a href="https://kp.gov.sk/pf/_layouts/PFSharePointProject/Login.aspx?ReturnUrl=%2fpf%2f_layouts%2fAuthenticate.aspx%3fSource%3d%252Fpf%252FLists%252FOznamy%252FAllItems%252Easpx&Source=%2Fpf%2FLists%2FOznamy%2FAllItems%2Easpx">Partner Framework Portáli</a> v sekcii <i>Integrácia na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v časti OVM.</i>

<p>Možnosť spoločnej autorizácie viacerých dokumentov orgánmi verejnej moci je na Ústrednom portáli verejnej správy poskytovaná ako funkcia používateľského rozhrania pri vypĺňaní formulárov, resp. v konštruktore správy v elektronickej schránke. Viac informácií nájdete v sekcii <a href="https://www.slovensko.sk/sk/navody/navody-pre-institucie">Návody pre inštitúcie</a> v návode s názvom Spoločná autorizácia elektronických dokumentov orgánmi verejnej moci.</p>',	NULL,	635,	'Orgán verejnej moci'),
('25. Môže orgán verejnej moci vytvoriť obdobný formulár nahrádzajúci Všeobecnú agendu so základnými údajmi a ostatné informácie by vložil do elektronicky podpísaného PDF dokumentu?',	'Z <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20171101#paragraf-28.odsek-6">§ 28 ods. 6</a> zákona o e-Governmente vyplýva, že je možné vytvárať napríklad rozhodnutia pozostávajúce z vyplnených údajov podľa elektronického formulára a zároveň z PDF súboru, pričom tieto musia byť spoločne autorizované. Nemôže teda ísť o samostatnú autorizáciu PDF súboru a samostatnú autorizáciu vyplnených údajov podľa elektronického formulára. Zároveň je potrebné, aby vyplnené údaje elektronického formulára tvorili súčasť elektronického úradného dokumentu, to znamená, že nemôže ísť iba o sprievodný list.',	NULL,	636,	'Orgán verejnej moci'),
('26. Čo je povinnou súčasťou elektronického formulára pred zaregistrovaním a schválením v module elektronických formulárov?',	'Každý elektronický formulár musí v zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2020/78/">Vyhlášky o štandardoch pre IT VS č. 78/2020 Z. z.</a> obsahovať:

<ul>
<li>Content/form.x.sb.xslt - zobrazenie pre podpisovanie (XSLT transformácia do HTML/XHTML, pričom pri formulároch s viac ako 50procesnými krokmi môže byť aj TXT)</li>
<li>Content/form.x.html.xslt - zobrazenie v schránke (XSLT transformácia do HTML/XHTML)</li>
<li>Content/form.x.fo.xsl - zobrazenie pre tlač (XSLT transformácia do XSL-FO a následne PDF)</li>
<li>META-INF/manifest.xml - automatizovane spracovateľné pravidlá</li>
<li>data.xml - príkladná dátová štruktúra</li>
<li>meta.xml - identifikačné údaje (zobrazované aj vo webovom rozhraní)</li>
<li>mimetype - technický súbor kontajnera</li>
<li>schema.xsd - definícia dátovej štruktúry</li>
</ul>

<p>*Názvy súborov v adresári “Content/“ nie sú predpísané, uvedené názvy vytvára Form Designer, je možné použiť aj iné.</p>

<p>Technické podrobnosti nájdete v prílohe č. 1 Vyhlášky o štandardoch a tiež v <a href="LINK">príručke na registráciu a správu formulárov</a>.</p>',	NULL,	637,	'Orgán verejnej moci'),
('34. Ako spoločne autorizovať elektronické dokumenty?',	'Bližšie informácie o funkciách a dokumentoch, ktoré sú dostupné vzhľadom na povinnosť používania spoločnej autorizácie elektronických dokumentov v prípade postupu podľa § 28 ods. 6 alebo § 36 zákona o e-Governmente a tiež vzhľadom na možnosť podľa § 28 ods. 3 nájdete v článku <a href="https://www.slovensko.sk/sk/spolocna-autorizacia-na-upvs">Spoločná autorizácia na ÚPVS</a>.',	NULL,	645,	'Orgán verejnej moci'),
('27. Aké sú štandardné parametre fontu pre transformáciu elektronického formulára do PDF a pre korektné vyhotovenie (tlač) listinného rovnopisu?',	'<ul>
<li>100 Thin</li>
<li>200 Extra Light</li>
<li>300 Light</li>
<li>400 Normal</li>
<li>500 Medium</li>
<li>600 Semi Bold
<li>700 Bold</li>
<li>800 Extra Bold</li>
<li>900 Ultra Bold</li>
</ul>

<p>Uvedené hodnoty sú používané v atribúte „font-weight“ v súbore XSL/XSLT.
<br>Pre fonty Arial, Helvetica, Georgia, by sa nemali používať iné hrúbky ako 400 a 700, resp. použiť atribúty normal alebo bold. Pre Arial sú k dispozícii alternatívy:</p>

<ul>
<li>Arial, normal, normal (ekvivalent k Arial, normal, 400)</li>
<li>Arial, normal, bold (ekvivalent k Arial, normal, 700)</li>
<li>Arial, italic, normal (ekvivalent k Arial, italic, 400)</li>
<li>Arial, italic, bold (ekvivalent k Arial, italic, 700)</li>
</ul>

<p>Uvedené kombinácie hodnôt sú uvádzané v atribútoch „font-family“, „font-style“, „font-weight“ v súbore XSL/XSLT.
<br>Odporúčame, aby sa v rámci elektronických formulárov používali štandardné nastavenia, fonty a odporúčané parametre tak, ako je vyššie uvedené. Iné ako štandardné fonty je potrebné vložiť do XSLT transformácií.</p>

<p><b>Poznámka:</b><p>
Podľa bodu 2.6.8 prílohy č. 1 Vyhlášky č. 78/2020 Z. z. o štandardoch pre informačné technológie verejnej správy platí pri používaní značkovacieho jazyka XSLFO povinnosť ako prvý font požadovaný pre zobrazenie využívať Arial, Times New Roman alebo Courier New. Ostatné fonty nie sú k dispozícii pre vytváranie tlačovej prezentácie do formátu PDF (v schránke funkcia "Stiahnuť ako PDF").',	NULL,	638,	'Orgán verejnej moci'),
('28. Z akého dôvodu sa podpis vyhodnocuje ako „neoveriteľný“ a ktoré overenie je platné?',	'Pri predbežnom/úplnom overení podpisov (tzv. asynchrónne overenie), ktoré sa automaticky zasiela do elektronickej schránky orgánu verejnej moci (OVM), ak má nastavenú ako svoju podateľňu Centrálnu elektronickú podateľňu (CEP), je <b>pri určovaní formátu overovaného objektu v elektronickej správe</b> rozhodujúca hodnota v atribúte mimetype v elemente „Object“. Ak je v elektronickej správe hodnota v atribúte mimetype, ktorá nie je v súlade s formátom súboru v elemente „Object“, podpisy sa neoveria a výsledkom je informácia <b>o neoveriteľnosti ( „Neoveriteľná") a chyba</p>. Predpísané <b>podporované</b> hodnoty v atribúte <b>mimetype</b> sú zverejnené v <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">Dokumentácii funkčnosti Centrálnej elektronickej podateľne</a>. Hodnota atribútu mimetype podľa Výnosu MF/009269/2014-173 o jednotnom formáte elektronických správ určuje dátový formát objektu.

<p>Pri ručnom spustení overenia podpisov pre konkrétny objekt správy cez ponuku „...“ v elektronickej schránke na Ústrednom portáli verejnej správy slovensko.sk (<a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>) sa automaticky volá synchrónna služba CEP „informatívne overenie 3“. Táto služba sa pri overovaní podpisov jedného objektu (t. j. nie celého MessageContainer) v súčasnosti neriadi hodnotou mimetype a namiesto toho pri overovaní podpisov skúša postupne všetky overovače (pre XAdES, CAdES, PAdES). Ak niektorý z nich nájde prítomnosť podpisu, vypíše výsledok overenia a ak nezistí prítomnosť podpisu, zobrazí o tom informáciu. CEP zatiaľ nie je možné z výkonnostných dôvodov nastaviť tak, aby sa pri predbežnom a úplnom overení automaticky zasielanom do schránok ignorovala hodnota mimetype a skúšali sa všetky overovače.</p>

Zároveň platí, že medzi predbežným/úplným overením vytváraným asynchrónne a synchrónnym overením <b>(volaním v elektronickej schránke alebo volaním služby cez integráciu)</b> nie je z hľadiska platnosti žiadny rozdiel, pokiaľ je vo výsledku konečná informácia (t. j. nefiguruje v ňom napríklad informácia „predbežne platná“).',	NULL,	639,	'Orgán verejnej moci'),
('29. Musí sa elektronická správa odoslaná cez <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> vždy úspešne doručiť?',	'Zo zákona o e-Governmente vyplýva povinnosť zabezpečiť na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>
na účely elektronickej úradnej komunikácie vytváranie elektronických správ, a to v jednotnom formáte. Tento formát definuje Výnos č. MF/009269/2014-173 o jednotnom formáte elektronických správ. Národná agentúra pre sieťové a elektronické služby (<a href="https://www.slovensko.sk/sk/slovnik/detail/_nases">NASES</a>) teda zabezpečuje vytváranie, odosielanie a doručovanie takých elektronických správ, ktoré spĺňajú náležitosti v zmysle uvedeného výnosu.

<p>Vzhľadom na uvedené, sa niektoré náležitosti elektronických správ predpísané legislatívou na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>
automatizovane kontrolujú. Odoslané elektronické správy, ktoré nespĺňajú legislatívou predpísané požiadavky, sa nemusia adresátovi úspešne doručiť. Odosielateľ je v takomto prípade automaticky informovaný chybovou správou. Chybovú správu o neúspešnom doručení systém odosielateľovi nezašle automaticky v prípade, ak ide o špecifickú chybu alebo ak konkrétnu chybu neodhalí z dôvodu neštandardného obsahu správy.</p>

<p><u>Príklady, kedy nemusí prísť k úspešnému doručeniu správy:</u></p>

<ul>
<li>Ak hlavný objekt v elektronickej správe (s triedou class=FORM) obsahuje podpísaný súbor (podpisový kontajner), avšak formát tohto objektu <a href="https://www.slovensko.sk/_img/CMS4/Dokumentacia_funkcnosti_CEP.pdf">nie je podporovaný v Centrálnej elektronickej podateľni </a>(CEP).  Príkladom môže byť chybný ASiC kontajner, ktorý nie je vytvorený v súlade so špecifikáciou podľa Vykonávacieho rozhodnutia Komisie EÚ č. 2015/1506 alebo podpísaný chybný súbor XMLDataContainer, ktorý nie vytvorený v súlade s prílohou č. 7 Vyhlášky č. 78/2020 Z. z. o štandardoch pre IT VS.</li>
<li>Ak hlavný objekt v správe (class=FORM) obsahuje nepodpísané údaje vyplnené podľa elektronického formulára, ktoré však nie sú v súlade so schémou príslušného formulára publikovaného v module elektronických formulárov.</li>
<li>Ak elektronická správa nie je v súlade s XSD schémou zverejnenou v dokumente <a href="https://www.slovensko.sk/_img/CMS4/Sch%C3%A9my%20spr%C3%A1v%20Sk-Talk%20pre%20asynchr%C3%B3nnu%20komunik%C3%A1ciu%20s%20%C3%9APVS.pdf">Schémy správ Sk-Talk pre asynchrónnu komunikáciu s ÚPVS</a>.</li>
<li>Ak v štruktúre správy Sk-Talk je v elementoch PospID a PospVersion uvedený taký identifikátor alebo verzia formulára, ktoré neexistujú, resp. nie sú sprístupnené v module elektronických formulárov.</li>
<li>Ak hlavný objekt v elektronickej správe (s triedou class="FORM") <b>obsahuje prázdnu hodnotu alebo</b> poškodený súbor alebo chybne kódovaný súbor, napríklad je nedekódovateľný alebo jeho kódovanie je v rozpore s hodnotou v atribúte "Encoding".</li>
<li>Ak hlavný objekt v správe (class=FORM) obsahuje údaje vyplnené podľa elektronického formulára, pričom tento elektronický formulár je sprístupnený v module elektronických formulárov avšak nie je automatizovane spracovateľný z dôvodu rozporu so štandardom pre elektronické formuláre (napríklad obsahuje nespracovateľnú hodnotu v atribúte "media-destination").</li>
<li>Ak v odoslanej elektronickej správe je v elemente SenderId identifikátor, ktorý neexistuje v evidencii IAM.</li>
</ul>',	NULL,	640,	'Orgán verejnej moci'),
('30. Pre ktoré typy správ dostaneme úplný výsledok overenia podpisov?',	'Výsledok overenia podpisov sa zasiela aj pre správy obsahujúce elektronické úradné dokumenty alebo elektronické podania, ktoré neobsahujú podpísané súbory, a to v prípade orgánov verejnej moci, ktoré používajú Centrálnu elektronickú podateľňu Ústredného portálu verejnej správy. Výsledok overenia podpisov sa zasiela aj pre správy, ktoré neobsahujú podpísané dokumenty.

<p><b>Prečo správa obsahuje podpis bez časovej pečiatky, keď vo výsledku overenia podpisov je informácia o časovej pečiatke?</b></p>

<p>Orgány verejnej moci, ktoré používajú centrálnu elektronickú podateľňu ako svoju elektronickú podateľňu, dostávajú do svojej elektronickej schránky v rámci služby zaevidovania prijatej správy podania alebo elektronického úradného dokumentu aj výsledok overenia podpisov v doručovanej správe, t.j. technickú správu Sk-Talk s Class "SIGN_VERIFY_RESULT".</p>

<p><a href="https://www.slovensko.sk/sk/slovnik/detail/_cep">Centrálna elektronická podateľňa</a> v rámci zaevidovania prijatej správy pre tie podpisy, ktoré časovú pečiatku neobsahujú, dopĺňa vo svojej internej evidencii kvalifikovanú časovú pečiatku.</p>

<p>Kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> je následne použitá pri overení podpisu, ako dôveryhodná informácia o čase existencie podpisu. Vo výsledku overenia podpisu zasielaného do schránky OVM je preto uvedená informácia o kvalifikovanej časovej pečiatke. Keďže sa kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> pri zaevidovaní správy nedopĺňa priamo do správy, podpis v správe zostáva v pôvodnom stave, v akom bol zaslaný. V prípade overenia podpisov cez funkciu "Overiť podpis" v elektronickej schránke alebo v prípade uloženia podpísaného súboru zo správy do počítača a následného overenia podpisov je preto výsledkom informácia o absencii časovej pečiatky.</p>

Kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a> sa nedopĺňa priamo do podpisu v elektronickej správe a uchováva sa len interne v CEP z dôvodu, že doplnením do elektronickej správy by prišlo k narušeniu digitálneho odtlačku správy uvádzaného v doručenke. Pre získanie časovej pečiatky uchovávanej len v tejto internej evidencii CEP v súčasnosti nie je na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> poskytovaná služba.',	NULL,	641,	'Orgán verejnej moci'),
('31. Ako je možné získať kvalifikovanú časovú pečiatku?',	'Pri vytváraní kvalifikovaného elektronického podpisu prostredníctvom portálu slovensko.sk v tzv. konštruktore správy (po potvrdení úspešného podpísania v aplikácii D.Signer/XAdES) sa automaticky k podpisu pripojí aj kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>.

<p>V prípade, ak používateľ pripojí do prílohy podania už podpísaný elektronický dokument, ktorý v podpise časovú pečiatku neobsahuje, portál kvalifikovanú časovú pečiatku do takéhoto podpisu nepripája. Ak pre autorizáciu daného dokumentu v zmysle zákona nepostačuje vlastnoručný podpis a vyžaduje sa úradne osvedčený podpis a používateľ disponuje už podpísaným dokumentom bez kvalifikovanej časovej pečiatky, môže kvalifikovanú časovú pečiatku podpisu získať vytvorením podpisu na portáli alebo pre doplnenie kvalifikovanej časovej pečiatky využiť služby iného poskytovateľa služieb.</p>

Rovnaký princíp platí aj pri vytváraní kvalifikovanej elektronickej pečate prostredníctvom portálu slovensko.sk. V prípade integrácie na centrálnu elektronickú podateľňu je pri vytváraní kvalifikovanej elektronickej pečate automaticky dopĺňaná aj kvalifikovaná <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>. Taktiež je možné prostredníctvom integrácie využiť webovú službu doplnenia kvalifikovanej časovej pečiatky do už existujúceho podpisu alebo pečate, ktoré časovú pečiatku neobsahujú.',	NULL,	642,	'Orgán verejnej moci'),
('32. Prečo sa v schránke nezobrazí obsah elektronického úradného dokumentu?',	'Nezobrazujúci sa obsah dokumentu v elektronickej schránke môže byť následkom:

<ul>
<li>v HTML transformácii je použitá nepovolená funkcia nepodporovaná XSL transformáciou vykonávanou Ústredným portálom verejnej správy (napr. používajúca príkazy nad rámec XSLT 1.0),</li>
<li>neexistujúceho formuláru v MEF (Modul elektronických formulárov),</li>
<li>chýbajúcej informácie o použitom elektronickom formulári,</li>
<li>XML údajov, ktoré nie sú vyplnené vo formulári,</li>
<li>elektronického formuláru, v ktorom chýba vizualizácia pre <a href="https://www.slovensko.sk/sk/slovnik/detail/_edesk">eDesk</a> alebo formuláru, ktorý obsahuje chybnú vizualizáciu</li>
<li>v rozpore s Vyhláškou o štandardoch pre ITVS č. 78/2020 Z. z.</li>
</ul>',	NULL,	643,	'Orgán verejnej moci'),
('35. Ako autorizovať elektronický úradný dokument určený na použitie v zahraničí?',	'Od 1. septembra 2019 v zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20200101#paragraf-23.odsek-3">§ 23 ods. 3</a> zákona o e-Governmente orgán verejnej moci na autorizáciu dokumentu určeného pre použitie v zahraničí použije <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> vyhotovený s použitím mandátneho certifikátu, ku ktorému pripojí kvalifikovanú elektronickú pečať a kvalifikovanú elektronickú časovú pečiatku. Pripojenie kvalifikovanej elektronickej pečate k už existujúcemu kvalifikovanému elektronickému podpisu je autorizáciou rovnakého dokumentu dvoma rôznymi prostriedkami autorizácie (v súlade s <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/PDF/?uri=CELEX:32014R0910&from=SK">Nariadením eIDAS</a>).

<p>V praxi je možné takúto autorizáciu vykonať:</p>

<ul>
<li>využitím funkcie "<b>zapečatiť</b>" v elektronickej schránke, ak má orgán verejnej moci kvalifikovanú elektronickú pečať inicializovanú v tzv. HSM module Centrálnej elektronickej podateľne Ústredného portálu verejnej správy. Viac informácií v článku <a href="https://www.slovensko.sk/sk/institucie-formulare-a-ziado/dostupnost-a-pouzitie-tlacidla">Dostupnosť a použitie tlačidla „Zapečatiť“ v elektronickej schránke OVM</a> a v návode <a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/navod_spolocna_autorizacia.pdf">Spoločná autorizácia elektronických dokumentov orgánmi verejnej moci na portáli slovensko.sk</a>.</li>
<li>využitím funkcie "<b>podpísať</b>" v elektronickej schránke, ak má orgán verejnej moci kvalifikovanú elektronickú pečať uloženú na prenosnom zariadení (napríklad USB token, čipová karta a pod.). Pri podpisovaní je potrebné v aplikácii pre podpisovanie zvoliť certifikát z tohto zariadenia. (Podporovaný je formát ASiC-XAdES).</li>
<li><b>integráciou</b> systémov tretích strán na Centrálnu elektronickú podateľňu Ústredného portálu verejnej správy a využitím služby „Podpísanie dokumentov 2", ktorá umožňuje zapečatiť kvalifikovanou elektronickou pečaťou aj dokumenty, ktoré sú už autorizované. V tomto prípade sa najskôr dodávatelia orgánu verejnej moci musia obrátiť na Národnú agentúru pre sieťové a elektronické služby na adresu <a href="mailto:integracie@nases.gov.sk">integracie@nases.gov.sk</a> pre vytvorenie integrácie na použitie tejto služby.</li>
</ul>',	'Občania iných krajín',	646,	'Orgán verejnej moci'),
('36. Ako predĺžiť dôveryhodnosť podpisov po uplynutí ich technologickej platnosti?',	'<h2>A) Kvalifikovaná služba uchovávania kvalifikovaných elektronických podpisov a pečatí SNCA4</h2>

Služba poskytuje prevod podpisov a pečatí na archívnu formu (LTA). <a href="https://www.slovensko.sk/sk/slovnik/detail/_nases">NASES</a> v súčasnosti túto službu aktívne neposkytuje, jej poskytovanie sa predpokladá začať do konca roka 2022.

<p>Základná informácia k funkčnosti: Odberateľ služby musí vo svojom informačnom systéme publikovať službu (implementujúcu rozhranie DMSWS podľa integračnej dokumentácie), prostredníctvom ktorej sprístupní dokumenty určené na archiváciu kvalifikovanej službe uchovávania. Samotné dokumenty sú fyzicky uchovávané na strane Odberateľa služby, prípadne u Spoliehajúcej sa strany. Tento subjekt sprístupňuje kvalifikovanej službe uchovávania rozhranie (DMSWS), prostredníctvom ktorého si kvalifikovaná služba dokument stiahne na nevyhnutný čas na vykonanie archivačného procesu. Po rozšírení dokumentu (resp. podpisov dokumentu) do LTA formy vráti služba takto obohatený dokument prostredníctvom rozhrania DMSWS naspäť Odberateľovi, prípadne spoliehajúcej sa strane. Kvalifikovaná služba uchovávania teda publikuje Notifikačný servis, na ktorý sa Odberateľ integruje podľa integračnej dokumentácie.</p>

<h2>B) Kvalifikovaná služba časových pečiatok SNCA4</h2>
Pokiaľ má subjekt už implementovanú funkcionalitu prevodu podpisov na archívnu formu a potrebuje iba samotnú archívnu časovú pečiatku, môže využiť kvalifikovanú službu časových pečiatok SNCA4, a to jednou z možností:

<ul>
<li>integráciou na službu centrálnej elektronickej podateľne, ktorá umožňuje vyžiadať kvalifikovanú časovú pečiatku,</li>
<li>priamou integráciou na kvalifikovanú službu časových pečiatok SNCA4.</li>
</ul>

<h2>C) Kvalifikovaná služba uchovávania v module dlhodobého uchovávania <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a></h2>
Modul dlhodobého uchovávania na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> umožňuje uchovávať elektronické dokumenty a chrániť uchovávané dokumenty, kvalifikované elektronické podpisy a pečate takzvaným integritným podpisom.

<p>Služba neprevádza na archívnu formu jednotlivé podpisy a pečate. Na archívnu formu sú prevádzané zapečatené manifesty obsahujúce zoznamy digitálnych odtlačkov chránených elektronických dokumentov a dôkazových materiálov (CRL a certifikátov) potrebných pre overenie kvalifikovaných elektronických podpisov a pečatí. V prípade potreby preukázania platnosti jednotlivých podpisov a pečatí je preto potrebný špecifický postup. <a href="https://www.slovensko.sk/_img/CMS4/OPortali/Dokumentacia_funkcnosti_MDU.pdf">Podrobnosti o základnej funkčnosti a obmedzeniach tejto služby...</a></>',	NULL,	647,	'Orgán verejnej moci'),
('1. Je škola a školské zariadenie orgánom verejnej moci?',	'Na účely zákona o e-Governmente je orgánom verejnej moci bez ohľadu na zriaďovateľa:

<ul>
<li>riaditeľ materskej školy (od 1. januára 2021),</li>
<li>riaditeľ základnej školy,</li>
<li>riaditeľ základnej školy s materskou školou,</li>
<li>riaditeľ strednej školy,</li>
<li>riaditeľ spojenej školy, ktorej súčasťou je základná alebo stredná škola.</li>
</ul>

<p>Orgánmi verejnej moci sú aj riaditelia cirkevných škôl a riaditelia súkromných škôl (základných škôl alebo stredných škôl).
Na účely zákona o e-Governmente nie je orgánom verejnej moci bez ohľadu na zriaďovateľa:</p>

<ul>
<li>riaditeľ základnej umeleckej školy,</li>
<li>riaditeľ jazykovej školy,</li>
<li>riaditeľ školského zariadenia.</li>
</ul>

<p>Viac informácií nájdete aj priamo na stránke Ministerstva školstva, vedy, výskumu a športu SR, v časti <a href="https://www.minedu.sk/data/att/15072.pdf">Súhrnné informácie pre školy a školské zariadenia k povinnostiam podľa zákona o e-Governmente</a> a v <a href="https://www.slovensko.sk/_img/CMS4/MIRRI_stanoviska/postavenie_materske_skoly_MIRRI_stanovisko.pdf">Stanovisku Ministerstva investícií, regionálneho rozvoja a informatizácie Slovenskej republiky k postaveniu materských škôl a autorizácii elektronických podaní a elektronických úradných dokumentov</a>. [.pdf, 448 kB].',	'Školy',	648,	'Orgán verejnej moci'),
('2. Kto má spravovať elektronickú schránku školy, ak je zriaďovateľom školy obec, a teda štatutárom je starosta obce?',	'Ak je zriaďovateľom školy obec, elektronickú schránku školy spravuje štatutárny orgán školy – riaditeľ. Starosta obce má automaticky vytvorený zákonný prístup do elektronickej schránky školy. V listinnej žiadosti (Formulár pre nahlásenie údajov na účely zriadenia elektronickej schránky orgánu verejnej moci, organizačnej zložky alebo organizácie bez právnej subjektivity podľa § 12 ods. 6 zákona <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/">č. 305/2013 Z. z.</a> o e-Governmente) a v elektronickej žiadosti (<a href="https://schranka.slovensko.sk/FormConstructor/Default.aspx?IdService=7574">Žiadosť o zriadenie elektronickej schránky pre organizačnú zložku alebo organizáciu bez právnej subjektivity</a>) je potrebné uviesť v časti Identifikátor vedúceho OVM riaditeľa danej školy.',	'Školy',	649,	'Orgán verejnej moci'),
('3. Ako bude škole zriadená elektronická schránka v prípade, že nemá samostatné IČO?',	'V prípade, že škola nemá samostatné IČO, použije sa ustanovenie <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20200101#paragraf-12.odsek-6">§ 12 ods. 6</a> zákona 305/2013 Z. z. o e-Governmente a elektronická schránka jej bude vytvorená ako elektronická schránka organizačnej zložky.',	'Školy',	650,	'Orgán verejnej moci'),
('4. Kde nájdeme viacej informácií k zriadeniu schránok?',	'V súvislosti s elektronickou schránkou dávame do pozornosti <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20200101#paragraf-11">§ 11</a>, <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20200101#paragraf-12">§ 12</a> a nasl. zákona 305/2013 Z.z. o e-Govermente, ktoré hovoria o <a href="https://www.slovensko.sk/_img/CMS4/Navody/postup_zriadenie_es_organizacna_zlozka_ovm.pdf">zriadení elektronickej schránky</a>. Ďalšie informácie nájdete na portáli <a href="https://www.slovensko.sk/sk/titulna-stranka">www.slovensko.sk</a>, kde sú uverejnené aj <a href="https://www.slovensko.sk/sk/dokumenty-a-tlaciva/_1/A/5556b9af-9cac-49a7-8d8d-a3fb00fe238e">príslušné formuláre</a> – žiadosť na zriadenie elektronickej schránky, ako aj žiadosť o udelenie oprávnenia na prístup a disponovanie s elektronickou schránkou.',	'Školy',	651,	'Orgán verejnej moci'),
('5. Odkedy majú školy povinnosť komunikovať elektronicky?',	'Všetky orgány verejnej moci sú povinné komunikovať elektronicky od 1. novembra 2016.',	'Školy',	652,	'Orgán verejnej moci'),
('7. Musia školy požiadať o mandátny certifikát a časovú pečiatku alebo im postačí <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> riaditeľa?',	'Pri výkone verejnej moci elektronicky riaditeľ rozhodnutia podpisuje prostredníctvom mandátneho certifikátu alebo ich pečatí kvalifikovanou elektronickou pečaťou, a teda nie svojím osobným kvalifikovaným certifikátom uloženým na eID (na elektronickom občianskom preukaze s čipom).

<p>Mandátny certifikát sa vydáva fyzickej osobe oprávnenej zo zákona alebo na základe zákona konať za inú osobu alebo orgán verejnej moci (<a href="https://www.slovensko.sk/sk/faq/$https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2016/272/20190801#paragraf-8">§ 8</a> zákona č. 272/2016 Z. z.).</p>

Mandátny certifikát vydáva <a href="https://www.slovensko.sk/sk/slovnik/detail/_kvalifikovany-certifikat">kvalifikovaný poskytovateľ dôveryhodných služieb</a>. V praxi platí, že ak úradný dokument vyžaduje podpis konkrétnej osoby v konkrétnej funkcii, použije sa ako autorizácia <a href="https://www.slovensko.sk/sk/slovnik/detail/_kep">kvalifikovaný elektronický podpis</a> s mandátnym certifikátom. Ak však osobitný právny predpis neustanovuje podpis konkrétnej osoby na úradnom dokumente, teda vyžaduje iba podpis oprávnenej osoby ako prejav vôle konať v mene orgánu verejnej moci, použije sa na autorizáciu elektronický podpis s mandátnym certifikátom alebo kvalifikovaná elektronická pečať orgánu verejnej moci.',	'Školy',	654,	'Orgán verejnej moci'),
('8. Ako vybaviť kvalifikovaný certifikát k elektronickej pečati?',	'Kvalifikovanú elektronickú pečať je možné na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> vytvárať pomocou kľúčového páru v HSM module <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> nasledovnými spôsobmi: integráciou na centrálnu elektronickú podateľňu (CEP), na portáli slovensko.sk v konštruktore správy v elektronickej schránke pomocou tlačidla „Zapečatiť“. Bližšie informácie k využívaniu kvalifikovanej elektronickej pečate v konštruktore správy nájdete v sekcii „<a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/navod_spolocna_autorizacia.pdf">Návody pre inštitúcie</a>“ a v <a href="https://www.slovensko.sk/_img/CMS4/metodicke_usmernenia/metodicke_usmernenie_registracia_KSC.pdf"><b>Metodickom usmernení k vydaniu a inicializácii kvalifikovaného certifikátu pre kvalifikovanú elektronickú pečať na ústrednom portáli</b></a>. Metodické usmernenie <b>nie je určené pre tie subjekty, ktoré chcú autorizovať elektronické dokumenty kvalifikovanou elektronickou pečaťou vytváranou prostredníctvom vlastného externého certifikovaného zariadenia</b> (čipová karta, USB kľúč a pod., t. j. nie v HSM module <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>). V takomto prípade je potrebné sa obrátiť priamo na vybraného kvalifikovaného poskytovateľa dôveryhodných služieb. Zoznam poskytovateľov je zverejnený na stránke <a href="https://www.nbu.gov.sk/doveryhodne-sluzby/doveryhodna-infrastruktura/akreditovane-certifikacne-autority/index.html">Národného bezpečnostného úradu SR</a>.',	'Školy',	655,	'Orgán verejnej moci'),
('9. Zriaďovateľom súkromnej základnej školy je občianske združenie, ktoré nie je zapísané v obchodnom registri. Od kedy má povinnosť využívať elektronickú schránku?',	'Aktivácia elektronických schránok občianskych združení na doručovanie prebehla v júni 2020.',	'Školy',	656,	'Orgán verejnej moci'),
('10. V akých prípadoch a odkedy je vysoká škola povinná využívať elektronickú schránku?',	'Využívanie elektronickej schránky vysokou školou je ovplyvnené tým, aké konania škola práve vykonáva. Ak ide o rozhodovanie o prijatí či neprijatí, v tomto prípade koná vysoká škola ako orgán verejnej moci. Pri takýchto konaniach platí povinnosť komunikovať elektronicky od 1. novembra 2016. Ak koná v iných oblastiach, nemá postavenie orgánu verejnej moci, a je teda právnickou osobu nezapísanou do Obchodného registra SR. V tomto prípade bude mať elektronickú schránku zriadenú a aktivovanú na doručovanie v zmysle <a href="https://www.slovensko.sk/_img/CMS4/Indikativny_harmonogram_aktivacie_eschranok_PO_mimo_ORSR_aktualizovany.pdf">indikatívneho harmonogramu</a>.',	'Školy',	657,	'Orgán verejnej moci'),
('11. Vzťahuje sa povinnosť zriadiť elektronické schránky aj na centrá voľného času a na ostatné školské zariadenia?',	'Nakoľko <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2008/245/20170901#predpis.clanok-1.cast-deviata">centrá voľného času a ostatné školské zariadenia</a> nie sú orgánmi verejnej moci, ale v zmysle zákona o e-Governmente sa chápu ako právnické osoby, ktoré sa nezapisujú do obchodného registra, majú povinnosť mať elektronické schránky zriadené a aktivované v zmysle <a href="https://www.slovensko.sk/_img/CMS4/Indikativny_harmonogram_aktivacie_eschranok_PO_mimo_ORSR_aktualizovany.pdf">indikatívneho harmonogramu</a>.',	'Školy',	658,	'Orgán verejnej moci'),
('12. Sú školy povinné využívať centrálne úradné doručovanie (CÚD)?',	'Uvedenú povinnosť majú iba orgány verejnej moci, ktoré sú štátne rozpočtové organizácie. Školy, ktorých zriaďovateľmi sú obce alebo samosprávne kraje túto podmienku nespĺňajú. Za štátne rozpočtové organizácie sa považujú <b>školy, ktorých zriaďovateľom je okresný úrad v sídle kraja</b>, a ktoré sú definované v zákone o štátnej správe v školstve:

<ul>
<li>materské školy,</li>
<li>základné školy,</li>
<li>stredné školy (gymnáziá, odborné školy, športové školy, konzervatóriá, škola umeleckého priemyslu),</li>
<li>základné školy pre žiakov so špeciálnymi výchovno-vzdelávacími potrebami,</li>
<li>stredné školy pre žiakov so špeciálnymi výchovno-vzdelávacími potrebami,</li>
<li>praktické školy,</li>
<li>odborné učilištia, školy, v ktorých sa vzdelávanie a výchova uskutočňuje v cudzom jazyku na základe medzinárodnej dohody.</li>
</ul>',	'Školy',	659,	'Orgán verejnej moci'),
('<a href="https://stopbyrokracii.sk/otazky-a-odpovede/">Najčastejšie otázky a odpovede týkajúce sa zákona proti byrokracii</a>',	NULL,	'Podnikanie',	660,	'Orgán verejnej moci'),
('9.  Aké parametre musí spĺňať certifikát?',	'<ul>
<li>Certifikát môže byť vydaný samotným žiadateľom (tzv. self-signed certifikát). V prípade certifikátu vydaného certifikačnou autoritou nie je potrebné údaje o tejto autorite vydávajúcej certifikát zasielať do NASES. Register autentifikačných certifikátov obsahuje všetky informácie  o platnosti certifikátov a nijako nezohľadňuje stav autentifikačného certifikátu podľa CRL vydávajúcej certifikačnej autority. Certifikáty je potrebné rušiť zaslaním žiadosti do registra.
<li>Formát certifikátu X.509 v kódovaní DER podľa ISO/IEC 8825-1 (obvyklá prípona súboru: „.cer“)
<li>Platnosť: 2 roky (729 až 731 dní)
<li>Distinguished name (DN): Môže obsahovať výlučne Common name (CN) a nesmie obsahovať žiadne ďalšie údaje.
<li>Common name (CN):
<p>- v prípade fyzickej osoby: rc-rodné číslo (príklad: rc-8001011234 ),</p>
<p>- v prípade právnickej osoby: ico-identifikačné číslo organizácie _ suffix (príklad: ico-12345678 alebo ico-12345678_10001 alebo ico-123456789012 )
Dĺžka kľúča: 2048 bit</p></li>
<li>Algoritmus: Public Key Algorithm: RSA, Signature Algorithm - jedna z možností: sha256WithRSAEncryption, sha512WithRSAEncryption, SHA256withRSA SHA512withRSA</li>
</ul>',	NULL,	669,	'Orgán verejnej moci'),
('1. Čo je autentifikačný certifikát a na čo sa používa?',	'Autentifikačný certifikát je elektronický dokument - súbor vo formáte DER (.cer) podľa ISO/IEC 8825-1, ktorý obsahuje identifikátor osoby, ktorej bol vydaný a slúži na preukazovanie jej elektronickej identity.

<p>Autentifikačný certifikát sa používa na účely identifikácie a autentifikácie pri automatizovanom prístupe k informačnému systému alebo elektronickej komunikácii, ktoré súvisia s výkonom verejnej moci, alebo na účely prístupu do elektronickej schránky a disponovania s elektronickou schránkou.</p>

<p>Používa sa na prístup technickými alebo programovými prostriedkami, ktoré sa prihlasujú automatizovane cez aplikačné rozhrania. Neslúži na prihlasovanie na portáli slovensko.sk prostredníctvom občianskeho preukazu s čipom (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid">eID karta</a>), dokladom o pobyte s čipom alebo alternatívnym autentifikátorom.</p>

<p>Certifikát si vytvára a vydáva žiadateľ sám (certifikát podpísaný sám sebou, z angl. self-signed certificate), alebo môže o vydanie požiadať inú osobu.</p>

<p>Podmienkou použitia je úspešné zapísanie platného autentifikačného certifikátu do registra autentifikačných certifikátov na Ústrednom portáli verejnej správy (<a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>) na základe žiadosti podpísanej kvalifikovaným elektronickým podpisom alebo na základe úradne overeného podpisu.</p>',	NULL,	661,	'Orgán verejnej moci'),
('2. Čo je technický účet a na čo sa používa?',	'Technický účet vzniká na základe žiadosti o registráciu autentifikačného certifikátu s technickým účtom. Je potrebný pre používanie autentifikačného certifikátu.

<p>Technický účet je špeciálny typ identity vytvorený interne v systéme správy identít v module IAM, pre fyzickú osobu, právnickú osobu alebo orgán verejnej moci za účelom identifikácie a autentifikácie technickým alebo programovým prostriedkom použitím autentifikačného certifikátu. Technický účet zastupuje identitu vlastníka technického účtu.</p>

<p>Technický účet v module IAM (Identity Access Management, systém správy identít na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>) resp. zastupovanie technickým účtom určuje rozsah oprávnení a disponovania s elektronickou schránkou osoby zastupovanej technickými prostriedkami prostredníctvom podporovaných komunikačných rozhraní a v prípade orgánov verejnej moci aj rozsah oprávnení pri prístupe k službám spoločných modulov <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.</p>',	NULL,	662,	'Orgán verejnej moci'),
('3. Kto môže o zápis autentifikačného certifikátu a o vytvorenie technického účtu požiadať?',	'Žiadateľom môže byť orgán verejnej moci, fyzická osoba, podnikateľ a právnická osoba.',	NULL,	663,	'Orgán verejnej moci'),
('4. Aké sú výhody použitia autentifikačného certifikátu?',	'Prostredníctvom technických alebo programových prostriedkov umožňuje získať automatizovaný prístup k službám spoločných modulov <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> a automatizovaný prístup do elektronickej schránky alebo disponovanie s elektronickou schránkou na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> bez nutnosti použitia občianskeho preukazu s čipom (<a href="https://www.slovensko.sk/sk/slovnik/detail/_eid">eID karta</a>). Technické a programové prostriedky môže osoba získať od tretích strán alebo vytvoriť si vlastné po splnení podmienok úspešnej integrácie na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	664,	'Orgán verejnej moci'),
('5. Môže jeden autentifikačný certifikát pristupovať do viacerých elektronických schránok?',	'Áno, môže, v prípade, že má osoba, ku ktorej technickému účtu je autentifikačný certifikát priradený, udelené oprávnenie na prístup do viacerých elektronických schránok. V praxi to znamená, že po zaslaní formulára pre udelenie oprávnenia fyzickej alebo právnickej osobe na zastupovanie (dostupný priamo v elektronickej schránke) bude môcť takto oprávnená osoba pristupovať do elektronickej schránky aj použitím autentifikačného certifikátu. Formulár je možné zaslať aj v listinnej forme.

<p>Jeden subjekt (FO/PO/OVM) môže zastupovať neobmedzený počet iných subjektov. Pri každom takomto zastupovaní môže pre prístup využívať rovnaký autentifikačný certifikát alebo viaceré autentifikačné certifikáty, podľa vlastnej potreby.</p>

<p>K udeleniu oprávnenia na prístup a disponovanie s elektronickou schránkou odporúčame využiť až nový formulár (jeho dostupnosť bude oznámená v druhej polovici mesiaca december 2020), ktorý udelí zastupovanie len pre prístup technickým účtom s autentifikačným certifikátom (s voliteľnou možnosťou aj cez eID a pod.), čím sa zamedzí nežiadúcemu zobrazovaniu zastupovaní na prihlasovacej stránke štatutárovi zastupujúcej identity pri jeho prihlasovaní s eID. Zároveň bude pri použití nových formulárov automaticky zasielaná  správa o vytvorení zastupovania obsahujúca údaj <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> IdentityID (UUID identifikátor) zastupovanej identity potrebný pre volanie STS v zastúpení s parametrom OnBehalfOfId. Tento údaj je tiež možné zistiť v Profile identity v poli "ID identity", ktorej bolo udelené zastupovanie a tiež identity, ktorá zastupovanie udelila.</p.>',	NULL,	665,	'Orgán verejnej moci'),
('6. Koľko autentifikačných certifikátov a technických účtov môže mať jedna identita?',	'Jedna identita môže mať zaregistrovaných viacero technických účtov a viacero autentifikačných certifikátov.

<p>Jeden autentifikačný certifikát môže byť zaregistrovaný iba jedenkrát, a teda iba na jeden technický účet. Registrácia rovnakého autentifikačného certifikátu bude zamietnutá vzhľadom na zhodu jeho digitálneho odtlačku.</p>

<p>Pre jeden technický účet môže byť zaregistrovaný neobmedzený počet autentifikačných certifikátov. (Počet nie je obmedzený, avšak v prípade potreby veľkých počtov pre jednu identitu - rádovo stoviek - je žiadúce vopred konzultovať s odborom integrácií.)</p>',	NULL,	666,	'Orgán verejnej moci'),
('7. Koľko subjektov môže zastupovať jeden technický účet ?',	'Technický účet zastupuje jeden subjekt FO/PO/OVM – vlastníka technického účtu. Následne tento subjekt môže zastupovať ľubovoľný počet subjektov na základe udeleného oprávnenia. Príklad: Právnická osoba - spoločnosť poskytujúca určité služby pre rôzne subjekty (klientov) si môže zaregistrovať technický účet s naparovaným autentifikačným certifikátom a následne na základe udelenia oprávnení môže zastupovať ľubovoľný počet klientov.',	NULL,	667,	'Orgán verejnej moci'),
('8. Ako sa vytvára autentifikačný certifikát?',	'Na vytvorenie autentifikačného certifikátu a privátneho kľúča je možné použiť napríklad voľne dostupný softvér OpenSSL s nasledovnými príkazmi:

<ul>
<li>penssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 730 -out certificate.pem</li>
<li>openssl x509 -outform der -in certificate.pem -out certificate.cer</li>
<li>openssl pkcs12 -export -out key.p12 -inkey key.pem -in certificate.pem</li>
</ul>

<p>Po spustení prvého príkazu si aplikácia vyžiada údaje o identite. V údajoch sa nesmie vyplniť žiadna položka okrem CN - Subject.</p>',	NULL,	668,	'Orgán verejnej moci'),
('10. Aké údaje má certifikát správne obsahovať?',	'Vygenerovaný certifikát so správnou hodnotou CN a dobou platnosti 2 roky je znázornený na Obr. 1.

<ul>
<li>Povinná hodnota CN je v tvare ico-XXXXXXXX , kde „XXXXXXXX" je IČO subjektu, pre ktorý certifikát registrujete. Ak by ste mali zriadenú organizačnú jednotku, tak sa uvádza v tvare ico-XXXXXXXX_suffix.</li>
<li>Povinná doba platnosti je aktuálne 2 roky (t. j. 729 až 731 dní).</li>
</ul>

<p>Správny tvar subjektu certifikátu, algoritmu a dĺžky kľúča je zobrazený na Obr. 2.</p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/certifikat-ukazka.png">
</picture></p>

<p>Obr. 1 - Hodnota CN bez suffixu/Hodnota CN so suffixom</p>

<p><picture>
  <img src="https://www.slovensko.sk/_img/CMS4/oznamy/certifikat-ukazka4.png">
</picture></p>

<p>Obr. 2 - Správny tvar držiteľa, algoritmu a dĺžky kľúča</p>',	NULL,	670,	'Orgán verejnej moci'),
('11. Má autentifikačný certifikát a technický účet obmedzenú platnosť ?',	'V zmysle aktuálne platného integračného manuálu IAM je platnosť autentifikačného certifikátu 2 roky. Platnosť technického účtu je neobmedzená.

<p>Žiadateľ môže obmedziť len platnosť zastupovania medzi technickým účtom a vlastníkom. „Platnosť od“ a „Platnosť do“ určuje platnosť zastupovania a tým aj oprávnenia na prístup a disponovanie s elektronickou schránkou. Koniec platnosti zastupovania nie je povinné uvádzať. Technický účet je aktívny aj po skončení platnosti autentifikačného certifikátu, ale nie je ním možné sa prihlásiť. Po zaregistrovaní platného autentifikačného certifikátu je opäť možné sa technickým účtom prihlasovať.</p>',	NULL,	671,	'Orgán verejnej moci'),
('12. Ako sa dozviem o blížiacom sa uplynutí platnosti autentifikačného certifikátu alebo certifikátu z metadát poskytovateľa služieb (SP - service provider)?',	'Notifikačné správy o blížiacom sa uplynutí platnosti autentifikačného certifikátu alebo certifikátu poskytovateľa služieb (SP) sa zasielajú do elektronickej schránky vlastníka 30 dní, 14 dní, 7 dní, 1 deň pred uplynutím platnosti a aj posledný deň platnosti. V prípade, ak ste vyplnili kontaktné údaje v žiadosti, notifikačné správy vám budú doručené aj na vami uvedenú e-mailovú adresu.',	NULL,	672,	'Orgán verejnej moci'),
('13. Aký formulár mám použiť, ak chcem zaregistrovať autentifikačný certifikát a zároveň vytvoriť technický účet?',	'Technický účet je technickou podmienkou používania autentifikačného certifikátu a preto prvý zápis autentifkačného certifikátu musí byť zároveň s vytvorením technického účtu.

<p>Je potrebné použiť formulár s názvom „Žiadosť o zápis autentifikačného certifikátu do registra autentifikačných certifikátov“. Formulár nájdete v časti „Profil“ po otvorení „Technické účty a certifikáty“ alebo na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“.</p>

<p>Žiadosť je možné podať aj bez prihlásenia, v takom prípade je potrebné po elektronickom odoslaní žiadosť vytlačiť, podpísať a podpis na nej úradne osvedčiť a zaslať do Národnej agentúry pre sieťové a elektronické služby.</p>',	NULL,	673,	'Orgán verejnej moci'),
('14. Ako sa dozviem o úspešnej registrácii autentifikačného certifikátu a o vytvorení technického účtu?',	'O úspešnej registrácii autentifikačného certifikátu a o vytvorení technického účtu sa dozviete prostredníctvom informačnej správy o výsledku spracovania žiadosti zaslanej do elektronickej schránky vlastníka a na e-mailovú adresu uvedenú v žiadosti ako kontaktný údaj.',	NULL,	674,	'Orgán verejnej moci'),
('15. Úspešne som si zaregistroval autentifikačný certifikát a vytvoril technický účet a zároveň mám integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. Ako ďalej?',	'Zaregistrovaný technický účet s naparovaným autentifikačným certifikátom môže subjekt využiť  na získanie časovo obmedzeného SAML tokenu, ktorým preukáže svoju totožnosť pri autentifikovanom prístupe k službám <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> napr. pri automatizovanom získavaní obsahu elektronickej schránky.',	NULL,	675,	'Orgán verejnej moci'),
('16. Úspešne som si zaregistroval autentifikačný certifikát a vytvoril technický účet a nemám integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. Bude mi to fungovať?',	'Pre využívanie automatizovaného prístupu prostredníctvom autentifikačného certifikátu a technického účtu je potrebné sa najskôr integrovať na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>. O potrebných krokoch sa môžete informovať prostredníctvom Ústredného kontaktného centra na tel. č. +421 2 35 803 083 alebo vyplnením <a href="https://helpdesk.slovensko.sk/new-incident/">kontaktného formulára</a>.',	NULL,	676,	'Orgán verejnej moci'),
('17. Aký formulár mám použiť, ak potrebujem pre existujúci technický  účet upraviť rozsah oprávnenia na prístup k elektronickej schránke alebo dobu platnosti oprávnenia?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu v prístupových oprávneniach technického účtu“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom technickom účte kliknutím na tlačidlo „Upraviť“ .',	NULL,	677,	'Orgán verejnej moci'),
('18. Aký formulár mám použiť, ak mi končí platnosť autentifikačného certifikátu k existujúcemu technickému účtu?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu zápisu autentifikačného certifikátu v registri autentifikačných certifikátov“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom autentifikačnom certifikáte kliknutím na tlačidlo „Pridať“.',	NULL,	678,	'Orgán verejnej moci'),
('19. Aký formulár mám použiť, ak chcem zrušiť autentifikačný certifikát?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie autentifikačného certifikátu v registri autentifikačných certifikátov“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ kliknutím na názov technického účtu, ku ktorému sa autentifikačný certifikát viaže a pri konkrétnom autentifikačnom certifikáte je potrebné kliknúť na tlačidlo „Zneplatniť“.',	NULL,	679,	'Orgán verejnej moci'),
('20. Aký formulár mám použiť, ak chcem zrušiť technický účet?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie prístupových oprávnení technického účtu (zrušenie technického účtu)“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, časť „Technické účty a certifikáty“ pri konkrétnom technickom účte kliknutím na tlačidlo „Zrušiť“.',	NULL,	680,	'Orgán verejnej moci'),
('23. Ak sa vo formulári nachádza povinné pole „Názov technického účtu“, ako zistím tento údaj?',	'Názov technického účtu nájdete buď v informačnej správe o výsledku spracovania žiadosti o registráciu autentifikačného certifikátu a o vytvorení technického účtu (zaslanej do elektronickej schránky vlastníka) alebo po prihlásení sa na portál slovensko.sk v časti „Profil“, „Technické účty a certifikáty“, alebo sa môžete obrátiť na operátorov nášho Ústredného kontaktného centra. V prípade, že máte integráciu na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, môžete zistiť názov technického účtu aj zavolaním požiadavky o vydanie STS tokenu v elemente Actor.ID.',	NULL,	683,	'Orgán verejnej moci'),
('24. Môžem si zaregistrovať autentifikačný certifikát aj bez existencie technického účtu?',	'Nie, nie je to možné, autentifikačný certifikát musí byť naviazaný na technický účet.',	NULL,	684,	'Orgán verejnej moci'),
('25. Aký formulár mám použiť, ak sa chcem zaregistrovať ako poskytovateľ služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o registráciu poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider).',	NULL,	685,	'Orgán verejnej moci'),
('26. Aký formulár mám použiť, ak mi končí platnosť certifikátu poskytovateľa služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o zmenu údajov poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider) kliknúť na tlačidlo „Upraviť“.',	NULL,	686,	'Orgán verejnej moci'),
('27. Aký formulár mám použiť, ak chcem zrušiť poskytovateľa služieb služieb (SP – service provider)?',	'Je potrebné použiť formulár s názvom „Žiadosť o zrušenie poskytovateľa služieb v module IAM“. Formulár nájdete po prihlásení sa na <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a> v sekcii „Nájsť službu“ alebo v sekcii „Profil“, v časti „Technické účty a certifikáty“ - Poskytovatelia služieb (Service provider) kliknúť na tlačidlo „Zrušiť“.',	NULL,	687,	'Orgán verejnej moci'),
('28. Ako postupovať v prípade potreby hromadnej registrácie autentifikačných certifikátov?',	'V rámci Registra autentifikačných certifikátov nie sú možné hromadné registrácie autentifikačných certifikátov jednou žiadosťou. V prípadoch potreby hromadných registrácií musí integrovaný subjekt postupovať jednou z možností:

<ul>
<li>začať využívať volania STS služby s jedným autentifikačným certifikátom v zastúpení iných osôb (s parametrom OnBehalfOfId) namiesto samostatnej registrácie certifikátov za každý zastupovaný subjekt (túto možnosť umožňuje aj dodatok k DIZ so splnomocnením na udelenie zastupovania a na zrušenie doterajšieho autentifikačného certifikátu, na základe ktorého môžete zmigrovať svoje súčasné riešenie z množstva samostatných autentifikačných certifikátov na jeden certifikát),</li>
<li>implementovať si automatizovanú registráciu autentifikačných certifikátov prostredníctvom na to určeného elektronického formulára a zasielať žiadosti prostredníctvom integračného rozhrania,</li>
<li>manuálne registrovať každý autentifikačný certifikát zvlášť.</li>
</ul>',	NULL,	688,	'Orgán verejnej moci'),
('1. Čo je listinný rovnopis a kedy sa vyhotovuje?',	'Listinný rovnopis sa vyhotovuje z elektronického úradného dokumentu (rozhodnutia) vrátane jeho príloh. Má rovnaké právne účinky ako elektronický úradný dokument, z ktorého bol vytvorený. V prípade, že adresát, nemá elektronickú schránku aktivovanú na doručovanie, OVM sú zo zákona povinné vyhotoviť listinný rovnopis rozhodnutia a doručiť ho adresátovi listinne.

<p>Listinný rovnopis musí obsahovať informácie o tom, kto elektronický úradný dokument autorizoval a informácie o spôsobe a čase autorizácie (uvádza sa v doložke o autorizácii, ktorá je súčasťou rovnopisu).</p>

Podrobnosti o spôsobe vyhotovenia a náležitostiach listinného rovnopisu sú uvedené vo <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2018/85/">Vyhláške č. 85/2018 Z. z.</a>',	NULL,	689,	'Orgán verejnej moci'),
('2. Ako vytvorím listinný rovnopis v prostredí <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>?',	'V prípade, že ste povinnou osobou zapojenou do <a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_centralne-uradne-dorucovanie/">Centrálneho úradného doručovania (CÚD)</a> alebo služby CÚD využívate dobrovoľne, vyhotovenie listinného rovnopisu zabezpečí modul elektronického doručovania automatizovane, ak elektronická schránka adresáta nie je aktivovaná na doručovanie.

<p>Ak pracujete v prostredí elektronickej schránky a zároveň nevyužívate služby CÚD, je možné vytvoriť listinný rovnopis aj priamo v schránke. Podmienkou je pridelenie špeciálnej roly „Vytvorenie autorizačnej doložky k elektronickému úradnému dokumentu".</p>

Viac informácií o detailnejšom postupe nájdete v súvisiacom návode „<a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/navod_dolozka_o_autorizacii.pdf">Vytvorenie listinného rovnopisu elektronického úradného dokumentu (rozhodnutia) v elektronickej schránke inštitúcie</a> (PDF, 1258 kB)" alebo videonávode „<a href="https://youtu.be/wSub0TigMWA">Doložka o autorizácii</a>".',	NULL,	690,	'Orgán verejnej moci'),
('3. Ak nie som zapojený do Centrálneho úradného doručovania (CÚD), ako zistím, či mám v elektronickej schránke dostupnú funkciu vytvárania listinných rovnopisov?',	'V prvom kroku je potrebné overiť si, či máte sprístupnenú špeciálnu rolu „Vytvorenie autorizačnej doložky k elektronickému úradnému dokumentu". Skontrolujte si, či sa vaša inštitúcia nachádza v <a href="https://data.gov.sk/dataset/zoznam-ovm-s-pridelenou-rolou-na-vytvaranie-listinneho-rovnopisu-v-schranke">zozname používateľov</a>, ktorí majú túto rolu pridelenú.

<p>V prípade, že takúto rolu nemáte pridelenú, môžete o ňu požiadať cez elektronickú schránku prostredníctvom formulára „<a href="https://www.slovensko.sk/sk/najst-sluzbu?CurrentPage=1&ServiceTitle=V%c5%a1eobecn%c3%a1+agenda&InstitutionName=N%c3%a1rodn%c3%a1+agent%c3%bara+pre+sie%c5%a5ov%c3%a9+a+elektronick%c3%a9+slu%c5%beby">Všeobecná agenda</a>".</p>

<p>Vzor žiadosti:</p>

<b>Adresát:</b> Národná agentúra pre sieťové a elektronické služby.
<br><b>Predmet:</b> Žiadosť o sprístupnenie vytvárania listinného rovnopisu.
<br><b>Text:</b> Žiadosť o pridelenie roly „Vytvorenie autorizačnej doložky k elektronickému úradnému dokumentu“.

<i><b><p>Upozornenie:</p></b>

<p>O rolu môžu požiadať orgány verejnej moci (OVM), ktoré:</p>

<ul>
<li>nevyužívajú služby <a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_centralne-uradne-dorucovanie/">Centrálneho úradného doručovania</a> (CÚD),</li>
<li>pracujú v používateľskom prostredí <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, najmä v elektronickej schránke inštitúcie.</i></li>
</ul>',	NULL,	691,	'Orgán verejnej moci'),
('4. Od kedy sa vytvára listinný rovnopis priamo v prostredí elektronickej schránky? Môže sa nová funkcia autorizačnej doložky využiť aj pri dávnejšie odoslaných rozhodnutiach?',	'Vytvorenie listinného rovnopisu s doložkou o autorizácii sa <a href="https://data.gov.sk/dataset/zoznam-ovm-s-pridelenou-rolou-na-vytvaranie-listinneho-rovnopisu-v-schranke">niektorým inštitúciám</a> umožnilo automaticky dňa 17. februára 2021. Iným orgánom verejnej moci, ak spĺňajú stanovené <a href="https://www.slovensko.sk/sk/faq/_listinny-rovnopis-s-autorizacn?fbclid=IwAR1AGlkOoQm_p7cSEID9SN8d2uzmv3i-7-r9KqlfFYOLCuwCM79FI8oBe2k#cud">podmienky</a>, môže byť špeciálna rola „Vytvorenie autorizačnej doložky k elektronickému úradnému dokumentu“ pridelená na základe ich <a href="https://www.slovensko.sk/sk/faq/_listinny-rovnopis-s-autorizacn?fbclid=IwAR1AGlkOoQm_p7cSEID9SN8d2uzmv3i-7-r9KqlfFYOLCuwCM79FI8oBe2k#cud">žiadosti</a>.

<p>Funkciu na vytváranie listinných rovnopisov s doložkou o autorizácii je  možné v elektronickej schránke využívať až <b>odo dňa automatického hromadného udelenia roly, a teda od 17. februára 2021 alebo od dátumu sprístupnenia roly na žiadosť</b>. Vytvorenie autorizačnej doložky k rozhodnutiam vyhotoveným skôr než bola rola pridelená, nie je v elektronickej schránke možné. Stav elektronickej schránky adresáta je potrebné vyhodnocovať vždy v okamihu vytvárania a doručovania rozhodnutia, nakoľko sa môže meniť.</p>',	NULL,	692,	'Orgán verejnej moci'),
('5. Ako funguje proces vytvorenia listinného rovnopisu v elektronickej schránke?',	'Ak už máte pridelenú špeciálnu rolu „Vytvorenie autorizačnej doložky k elektronickému úradnému dokumentu" v elektronickej schránke sa vám sprístupní funkcia vytvorenia listinného rovnopisu. Listinný rovnopis je možné vytvoriť len vtedy, keď aspoň jeden z adresátov, ktorému chcete doručiť úradné rozhodnutie, nemá elektronickú schránku aktivovanú na doručovanie.

V elektronickej schránke si vyplníte elektronický formulár - rozhodnutie. Ak obsah rozhodnutia nie je možné vytvoriť podľa elektronického formulára (§ 28 ods. 6 zákona o e-Governmente), môžete priložiť ďalší elektronický dokument ako prílohu k hlavnému formuláru. Formulár rozhodnutia je potrebné autorizovať.

Len čo vyplníte a autorizujete elektronický formulár, po kliknutí na tlačidlo „Odoslať“ vás systém vyzve na doplnenie údajov o pracovnej pozícii osoby, ktorá doložku o autorizácii vyhotovila. Následne po potvrdení a odoslaní sa takáto správa nedoručí adresátovi, ktorý nemá elektronickú schránku aktivovanú na doručovanie elektronicky, ale automaticky sa uloží v schránke do záložky „Odoslané správy“. Do prílohy správy systém vloží doložku o autorizácii. V detaile správy si  môžete následne listinný rovnopis stiahnuť, vytlačiť a doručiť adresátovi poštou.',	NULL,	693,	'Orgán verejnej moci'),
('6. Ako autorizujem elektronický formulár rozhodnutia?',	'OVM musia formulár elektronického úradného dokumentu (EÚD) - rozhodnutia autorizovať podľa <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20201230#paragraf-23.odsek-1">§ 23 ods. 1</a> zákona o e-Governmente kvalifikovaným elektronickým podpisom vyhotoveným s použitím mandátneho certifikátu alebo kvalifikovanou elektronickou pečaťou, ku ktorým sa v prostredí schránky automaticky pripojí kvalifikovaná elektronická <a href="https://www.slovensko.sk/sk/slovnik/detail/_elektronicka-casova-peciatka">časová pečiatka</a>.

<p>Viac informácií o autorizácií nájdete v súvisiacom návode „<a href="https://www.slovensko.sk/_img/CMS4/Navody/Nove_ES/navod_spolocna_autorizacia.pdf">Spoločná autorizácia elektronických dokumentov orgánmi verejnej moci</a> (PDF, 1073 kB)".</p>',	NULL,	694,	'Orgán verejnej moci'),
('7. Ako si zobrazím listinný rovnopis v schránke?',	'Listinný rovnopis je sprístupnený v elektronickej schránke (v detaile správy) len v prípade tých adresátov, ktorí v čase odosielania rozhodnutia nemali elektronickú schránku aktivovanú na doručovanie. Pre týchto adresátov sa rozhodnutie nedoručí elektronicky, ale správa sa uloží spolu s autorizačnou doložkou v jej prílohe do záložky odoslaných správ, zároveň sa označí štítkom „Listinný rovnopis“. Po kliknutí na správu sa vám zobrazí tzv. detail správy, v ktorom budete mať sprístupnené zelené tlačidlo „Vytlačiť rovnopis".

<p>Po kliknutí na tlačidlo sa vám zobrazí PDF dokument, ktorý obsahuje doložku o autorizácii a listinnú podobu elektronického úradného dokumentu (prípadne príloh, ak boli súčasťou správy). PDF dokument bude v dolnej časti obsahovať aj údaje o počte strán a referenciu na dokument/dokumenty uvádzané v doložke. PDF dokument si môžete stiahnuť do počítača a vytlačiť, následne ho doručiť adresátovi v listinnej podobe.</p>',	NULL,	695,	'Orgán verejnej moci'),
('8. Čo mám robiť, keď si neviem listinný rovnopis vytlačiť?',	'V prípade, že vám nefunguje tlačidlo „Vytlačiť rovnopis“ a objaví sa vám chybová hláška, je potrebné skontrolovať, v akom formáte sú dokumenty, ktoré sú súčasťou elektronickej správy (rozhodnutia). Tlačidlo na vytlačenie listinného rovnopisu vám nebude fungovať napr. vtedy, ak boli súčasťou rozhodnutia dokumenty vo formáte .png alebo .txt, vtedy je potrebné ich stiahnuť/vytlačiť samostatne.

<p>V detaile správy sa v hornom menu nachádza políčko „Stiahnuť", ďalej stačí kliknúť na „Stiahnuť obsah s pdf vizualizáciami (.zip)", čím sa vám uložia dokumenty do vášho počítača. Následne si ich môžete jednoducho vytlačiť ako samostatné dokumenty.</p>',	NULL,	696,	'Orgán verejnej moci');

-- 2022-09-21 13:13:58.808444+02
