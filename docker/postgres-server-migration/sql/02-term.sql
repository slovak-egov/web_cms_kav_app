-- Adminer 4.8.1 PostgreSQL 13.8 dump

DROP TABLE IF EXISTS "term";
DROP SEQUENCE IF EXISTS term_id_seq1;
CREATE SEQUENCE term_id_seq1 INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."term" (
    "title" text,
    "text" text,
    "category" text,
    "id" integer DEFAULT nextval('term_id_seq1') NOT NULL,
    CONSTRAINT "term_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "term" ("title", "text", "category", "id") VALUES
('Adopcia',	'V zmysle slovenského právneho poriadku ide o osvojenie, prijatie cudzej osoby, väčšinou dieťaťa za vlastné. Osvojením vzniká medzi osvojiteľom a osvojencom rovnaký vzťah, aký je medzi rodičmi a deťmi. Medzi osvojencom a príbuznými osvojiteľa vzniká osvojením. 
 

 Osvojiť maloleté dieťa môžu manželia alebo jeden z manželov, ktorý žije s niektorým z rodičov dieťaťa v manželstve, alebo pozostalý manžel po rodičovi alebo osvojiteľovi maloletého dieťaťa. Maloleté dieťa môže výnimočne osvojiť aj osamelá osoba, ak sú splnené predpoklady, že osvojenie bude v záujme dieťaťa. príbuzenský vzťah. Osvojitelia majú pri výchove detí rovnakú zodpovednosť a rovnaké práva a povinnosti ako rodičia.',	NULL,	1),
('Agenda',	'Konkrétna vecná oblasť príslušného úseku správy, ktorú vybavuje povinná osoba v súlade s kompetenciami, podmienkami a postupmi, ustanovenými osobitnými predpismi.',	'Legislatíva sk',	2),
('AGS',	'Agendový systém eDOV - eDemokracia a otvorená vláda (<a href="https://open.slovensko.sk/">open.slovensko.sk</a>).',	NULL,	3),
('Asignácia dane',	'Asignácia dane (tzv. 2 % z daní) je právo daňovníka použiť určitú časť ním zaplatenej dane z príjmov na osobitné účely. Asignácia dane alebo použitie podielu zaplatenej dane na osobitné účely je upravená v <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2003/595/20170201#paragraf-50/">§ 50</a> zákona č. 595/2003 Z. z. o dani z príjmov.',	NULL,	4),
('Autorizácia',	'Pod autorizáciou sa rozumie vyjadrenie súhlasu s obsahom právneho úkonu a s vykonaním tohto právneho úkonu v elektronickej podobe.
 

 V zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2013/305/20170301#paragraf-23">§ 23</a> zákona o e-Governmente:
 

 - orgán verejnej moci vykoná autorizáciu kvalifikovaným elektronickým podpisom a mandátnym certifikátom s pripojenou časovou pečiatkou alebo kvalifikovanou elektronickou pečaťou s pripojenou časovou pečiatkou. 
 - osoba, ktorá nie je orgánom verejnej moci, vykoná autorizáciu kvalifikovaným elektronickým podpisom alebo kvalifikovanou elektronickou pečaťou (ak je náležitosťou právneho úkonu vlastnoručný podpis), ak je náležitosťou právneho úkonu úradne overený vlastnoručný podpis, pripojí aj časovú pečiatku.',	'Štátna správa sk',	5),
('BOK',	'Bezpečnostný osobný kód (BOK) slúži na potvrdenie totožnosti držiteľa občianskeho preukazu pri elektronickej komunikácii s informačnými systémami orgánov verejnej správy alebo s inými fyzickými osobami či právnickými osobami a pozostáva z kombinácie šiestich ľubovoľných číslic.',	NULL,	6),
('CEP',	'Centrálna elektronická podateľňa (CEP) je podľa zákona o e-Governmente spoločným modulom ústredného portálu, určeným na spracovanie elektronických dokumentov v administratívnom styku s kvalifikovaným elektronickým podpisom.',	'Štátna správa sk',	7),
('Colný kódex',	'Sú pravidlá Európskeho Spoločenstva, v ktorom sa ustanovujú a vymedzujú právne predpisy pre dovoz a vývoz tovaru medzi Spoločenstvom a tretími krajinami. Cieľom tohto kódexu je uľahčiť obchodovanie a zároveň zaručiť vysokú úroveň bezpečnosti na hraniciach.',	'Štátna správa sk',	8),
('CUET',	'Centrálna úradná elektronická tabuľa (<a href="https://cuet.slovensko.sk/">cuet.slovensko.sk</a>).',	NULL,	9),
('Duševné vlastníctvo',	'Duševné vlastníctvo je „majetok" nehmotnej povahy, ktorý je výsledkom tvorivej duševnej činnosti.',	'Štátna správa sk',	10),
('eDesk',	'Modul elektronických komunikačných schránok <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	11),
('eDOV',	'Je skratka pre portál eDemokracia a otvorená vláda (<a href="https://open.slovensko.sk/">open.slovensko.sk</a>).',	NULL,	12),
('e-Government',	'Využívanie informačných a komunikačných technológií on-line vo verejnej správe spojené s organizačnými zmenami a novými zručnosťami s cieľom zlepšiť služby verejnej správy a uplatňovanie demokratických postupov, ako aj posilniť podporu verejných politík.',	NULL,	13),
('eID',	'Elektronická identifikačná karta (eID) je slovenský občiansky preukaz s elektronickým čipom.
 

 Na účel autentifikácie je možné využiť aj <a href="https://www.slovensko.sk/sk/agendy/agenda/_pobyt-cudzincov/">doklad o pobyte s elektronickým čipom</a>, <a href="https://www.slovensko.sk/sk/zivotne-situacie/zivotna-situacia/_ako-si-vybavit-alternativny-au/">alternatívny autentifikátor</a>, <a href="https://www.slovensko.sk/sk/elektronicka-schranka/_register-autentifikacnych-cert">autentifikačný certifikát</a> alebo prostriedok elektronickej identifikácie z iného štátu EÚ (<a href="https://www.slovensko.sk/sk/eidas/informacie-o-prihlaseni-cez-ei">eIDAS node</a>).',	NULL,	14),
('eID klient',	'Aplikácia, slúžiaca na elektronickú identifikáciu majiteľa občianskeho preukazu s čipom a na prihlasovanie sa na portál www.slovensko.sk, do elektronických schránok alebo na iný špecializovaný portál verejnej správy.',	NULL,	15),
('eIDAS',	'<i>eIDAS sú pravidlá Európskej únie pre elektronickú identifikáciu, autentifikáciu, dôveryhodné služby, elektronické podpisy, elektronické pečate, elektronické časové pečiatky, elektronické dokumenty, elektronické doručovacie služby pre registrované zásielky, certifikačné služby pre autentifikáciu webových sídiel, predpísané <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/HTML/?uri=CELEX:32014R0910&from=EN">Nariadením Európskeho parlamentu a Rady EÚ č. 910/2014</a>.</i>',	NULL,	16),
('EKR',	'Skratka pre Externé komunikačné rozhranie.',	NULL,	17),
('Elektronická časová pečiatka',	'Informácia pripojená alebo inak logicky spojená s elektronickým dokumentom, ktorá umožňuje jednoznačne identifikovať dátum a čas, kedy bola vyhotovená.',	NULL,	18),
('Elektronická podateľňa',	'Technické zariadenie slúžiace najmä na prijímanie, odosielanie a potvrdzovanie prijatia elektronických dokumentov a elektronických dokumentov podpísaných kvalifikovaným elektronickým podpisom alebo zapečatených kvalifikovanou elektronickou pečaťou.',	NULL,	19),
('Elektronická schránka',	'Elektronická schránka podľa zákona o e-Governmente je elektronické úložisko, v ktorom sa uchovávajú elektronické správy a notifikácie. Elektronická schránka umožňuje komunikovať občanom a podnikateľským subjektom s verejnou správou elektronicky.',	NULL,	20),
('Elektronická služba',	'Služba poskytovaná v elektronickej podobe pomocou informačno-komunikačných prostriedkov. Pre oblasť e-governmentu sú to služby verejného záujmu.',	NULL,	21),
('Elektronická žaloba',	'Elektronická forma žaloby, ktorú je možné podať na portáli Ministerstva spravodlivosti SR. Bližšie informácie nájdete na portáli <a href="https://obcan.justice.sk/ezaloby/">e-Žaloby</a>.',	NULL,	22),
('Elektronické podanie',	'Elektronickým podaním sú údaje vyplnené podľa elektronického formulára, ktoré v konaní o právach, právom chránených záujmoch a povinnostiach osôb alebo na účely jeho začatia, zasiela účastník konania v rámci elektronickej komunikácii orgánu verejnej moci osoba. Vzhľadom na štandardne používané kódovanie base 64, celková veľkosť všetkých objektov vložených do elektronickej správy v závislosti od jej ďalšieho obsahu <b>všeobecne nemôže presiahnuť 33 MB</b> .',	NULL,	23),
('Elektronické zdravotníctvo',	'Cieľom <b>elektronického zdravotníctva</b> je prostredníctvom informačných a komunikačných technológií poskytnúť správne informácie v správny čas na správnom mieste vo všetkých etapách a procesoch starostlivosti o zdravie občanov, čo <b>výrazne prispeje k zlepšovaniu zdravotnej starostlivosti</b> a tým aj k zvyšovaniu kvality života občanov. Elektronické zdravotníctvo má zároveň priniesť výrazné finančné úspory, ktoré môžu byť využité v celom systéme zdravotníctva. Legislatívny rámec elektronického zdravotníctva je vymedzený zákonom č. 153/2013 Z. z. o národnom zdravotníckom informačnom systéme a o zmene a doplnení niektorých zákonov. Bližšie informácie sa dozviete <a href="http://www.nczisk.sk/eHealth/Pages/default.aspx">na tejto stránke</a>.
 

 Webové sídlo obsahujúce aplikácie a objektivizované informácie súvisiace so zdravotnou starostlivosťou, so službami súvisiacimi s poskytovaním zdravotnej starostlivosti a informácie o verejnom zdraví a sprostredkujúce prístup do národného zdravotníckeho informačného systému je <a href="https://www.npz.sk/sites/npz/NzpBasePages/home.aspx">Národný portál zdravia</a>. Prostredníctvom Elektronickej zdravotnej knižky portál ponúka občanovi aktuálne informácie o predpísaných liekoch a poskytnutých zdravotných výkonoch, výsledky laboratórnych vyšetrení, údaje o vykonaných očkovaniach...
 

  <b>Zdravotnícky pracovník</b> nájde na Národnom portáli zdravia aktuálne informácie z oblasti legislatívy v zdravotníctve v SR aj v EÚ, databázy odborných článkov, prehľady odborných a metodických usmernení, ako i zoznam časopisov z oblasti medicíny a farmakológie dostupných v SR.
 

  <a href="http://www.nczisk.sk/Kontakty/Kontaktne-centrum-NCZI/Pages/default.aspx">Call centrum NCZI</a> - pre používateľov služieb elektronického zdravotníctva a lekárov, ktorí sa chcú pripojiť do systému',	NULL,	24),
('Elektronický podpis',	'Elektronický podpis je informácia pripojená alebo inak logicky spojená s elektronickým dokumentom, ktorá musí spĺňať požiadavky zákona č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2016/272/20170301">272/2016 Z.z.</a> o dôveryhodných službách pre elektronické transakcie na vnútornom trhu.',	NULL,	25),
('eNotify',	'Skratka pre Notifikačný modul <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	26),
('EORI',	'EORI je jedinečný systém registrácie a identifikácie hospodárskych subjektov a iných osôb, ktoré podnikajú na území EÚ, ako je ustanovené vo <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/?qid=1588170014935&uri=CELEX:32015R2447">vykonávacom nariadení (ES) č. 2447/2015</a>. Číslo EORI je maximálne 17 znakový alfanumerický kód. Počiatočné písmená sú kód členského štátu EÚ, v ktorom je subjekt zaregistrovaný. V prípade slovenských subjektov je to kód „SK“.
 

 Tento jedinečný identifikátor slúži na identifikáciu hospodárskych subjektov pri komunikácii s colnými orgánmi členských štátov EÚ bez toho, aby sa tieto hospodárske subjekty museli zaregistrovať v každom členskom štáte, v ktorom vykonávajú svoje podnikateľské aktivity.
 

 Každý členský štát EÚ má v zmysle platnej legislatívy právo ustanoviť, ako bude tento identifikátor vyzerať. Finančné riaditeľstvo Slovenskej republiky (FR SR) sa rozhodlo využiť identifikátory, ktoré už hospodárske subjekty majú pridelené. Najčastejšie je to číslo identické s <b>IČ DPH alebo SK + DIČ</b>. Spoločnostiam a fyzickým osobám podnikateľom, ktorí <b>nemajú pridelené DIČ</b>, bude číslo EORI pozostávať z SK + 0I +IČO.',	'Štátna správa sk',	27),
('EURES',	'Európsky portál pre pracovnú mobilitu Európskej komisie, kde je možné jednoduchým spôsobom vyhľadávať informácie o pracovných a študijných možnostiach v Európe. Bližšie informácie sa dozviete na portáli <a href="https://www.eures.sk/">EURES</a>.',	NULL,	28),
('Fikcia doručenia',	'Pri doručovaní sa môže uplatňovať fikcia doručenia. Ak sa fikcia doručenia uplatňuje, elektronická správa sa považuje za doručenú uplynutím úložnej lehoty alebo potvrdením notifikácie o doručení. Úložná lehota je podľa zákona o e-Governmente 15 dní odo dňa nasledujúceho po dni uloženia elektronickej správy, pričom uložením elektronickej správy je okamih, odkedy je správa prijímateľovi objektívne prístupná.
 Ak vám bolo do schránky zaslané rozhodnutie určené do vlastných rúk s fikciou doručenia a v úložnej lehote nepotvrdíte notifikáciu o doručení, rozhodnutie sa považuje márnym uplynutím tejto lehoty za doručené a nastávajú jeho právne účinky.',	NULL,	29),
('Finančná správa SR',	'Je ústredným orgánom štátnej správy podriadeným Ministerstvu financií SR. Predmetom činnosti finančnej správy je vykonávanie úloh ustanovených zákonom č. 333/2011 Z. z., zákonom č. 479/2009 Z. z. o orgánoch štátnej správy v oblasti daní a poplatkov a o zmene a doplnení niektorých zákonov v znení neskorších predpisov (ďalej len „zákon č. 479/2009 Z. z.“), zákonom č. 652/2004 Z. z. o orgánoch štátnej správy v colníctve a o zmene a doplnení niektorých zákonov v znení neskorších predpisov (ďalej len „zákon č. 652/2004 Z. z.“) a inými všeobecne záväznými právnymi predpismi, ako aj medzinárodnými zmluvami, ktorými je SR viazaná.',	NULL,	30),
('G2G',	'Skratka z angl. Government to Government predstavuje komunikáciu verejnej správy medzi sebou pomocou middleware platformy.',	NULL,	31),
('Govnet',	'Vyhradená neverejná logická IP sieť, nezávislá na fyzickej infraštruktúre, ktorá je bezpečne oddelená od vonkajších sietí a vnútorných sietí subjektov verejnej správy; je určená na vzájomnú komunikáciu subjektov verejnej správy a na sprostredkovanie ich externej komunikácie s inými osobami (internet, TESTA II, špecializovaní poskytovatelia ďalších služieb, verejnosť a pod.).',	NULL,	32),
('Habilitácia',	'Je dosiahnutie akademickej hodnosti docenta na vysokej škole alebo skrátené označenie pre habilitačné pokračovanie. Habilitácia je výsledkom habilitačného pokračovania, ktorého súčasťou je obhajoba habilitačnej práce a habilitačná prednáška. Podmienky vymenúvania docentov presne neupravuje zákon, ale je v pôsobnosti vedeckej rady vysokej školy.',	NULL,	33),
('IAM',	'Skratka pre autentifikačný modul <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>, z angl. Identity Access Management.',	NULL,	34),
('IS PEP',	'Skratka pre informačný systém pre platby a evidenciu správnych a súdnych poplatkov, ktorý je súčasť služby E-kolok.',	NULL,	35),
('ITMS',	'Skratka pre informačný systém slúžiaci na zabezpečenie jednotného spôsobu evidencie, spracovávania, exportu a monitorovania dát o programovaní, projektovom a finančnom riadení, kontrole a audite programov financovaných zo štrukturálnych fondov a Kohézneho fondu.',	NULL,	36),
('JKM',	'Skrátený názov pre Jednotné kontaktné miesto. Funkciou jednotných kontaktných miest je vybaviť všetky povinné administratívne úkony súvisiace so začiatkom podnikania a niektoré úkony súvisiace s podnikateľskou činnosťou na jednom mieste (napr. ohlásiť živnosť, požiadať o zápis do obchodného reigstra, prihlásiť sa do systému povinného zdravotného poistenia, oznámiť zmeny, ukončiť podnikanie a pod.). Od 1. januára 2012 funguje v SR jedno <a href="https://www.minv.sk/?elektronicke-jednotne-kontaktne-miesto">elektronické JKM</a>.',	NULL,	37),
('KEP',	'Kvalifikovaný elektronický podpis je podľa <a href="https://eur-lex.europa.eu/legal-content/SK/TXT/?uri=CELEX:32014R0910">Nariadenia Európskeho parlamentu a Rady (EÚ) č. 910/2014</a> zo dňa 23. júla 2014 o elektronickej identifikácii a dôveryhodných službách pre elektronické transakcie na vnútornom trhu a o zrušení smernice 1999/93/ES, zdokonalený elektronický podpis vyhotovený s použitím kvalifikovaného zariadenia na vyhotovenie elektronického podpisu a založený na kvalifikovanom certifikáte pre elektronické podpisy.',	NULL,	38),
('Kvalifikovaný certifikát',	'Kvalifikovaný certifikát je elektronický dokument, ktorým vydavateľ certifikátu potvrdzuje, že uvedený verejný kľúč patrí osobe, ktorej je certifikát vydaný (držiteľ certifikátu). Vydavateľom kvalifikovaného certifikátu môže byť len kvalifikovaný poskytovateľ dôveryhodných služieb. Zoznamy kvalifikovaných poskytovateľov dôveryhodných služieb vedú orgány jednotlivých členských štátov EÚ. Odkazy na jednotlivé národné dôveryhodné zoznamy zverejňuje Európska komisia a je ich možné vyhľadávať <a href="https://esignature.ec.europa.eu/efda/tl-browser/#/screen/tl/SK">na stránke Európskej komisie</a>.',	NULL,	39),
('MDS',	'Skratka pre Modul dotačných schém dostupný na <a href="https://data.gov.sk/dotacie">data.gov.sk/dotacie</a>. Obsahuje informácie o poskytnutých dotáciách financovaných zo zdrojov verejnej správy.',	NULL,	40),
('MDURZ',	'Skratka pre Modul dlhodobého uchovávania registratúrnych záznamov.',	NULL,	41),
('MED',	'Skratka pre Modul elektronického doručovania <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	42),
('MEF',	'MEF alebo eForm je skratka pre Modul elektronických formulárov <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	43),
('MEP',	'Skratka pre Platobný modul <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	44),
('MOD',	'Skratka pre Modul otvorených dát dostupný na portáli <a href="https://data.gov.sk/">data.gov.sk</a>.',	NULL,	45),
('MOV',	'Skratka pre Modul otvorenej vlády - <a href="https://rokovania.gov.sk/">rokovania.gov.sk</a>.',	NULL,	46),
('MSP',	'Skratka pre Modul správy poplatkov.',	NULL,	47),
('NASES',	'Skratka pre Národnú agentúru pre sieťové a elektronické služby.',	NULL,	48),
('Ombudsman',	'Je verejný ochranca práv a nezávislý orgán SR, ktorý v rozsahu a spôsobom ustanoveným zákonom chráni základné práva a slobody fyzických osôb a právnických osôb v konaní pred orgánmi verejnej správy a ďalšími orgánmi verejnej moci, ak je ich konanie, rozhodovanie alebo nečinnosť v rozpore s právnym poriadkom. V zákonom ustanovených prípadoch sa verejný ochranca práv môže podieľať na uplatnení zodpovednosti osôb pôsobiacich v orgánoch verejnej moci, ak tieto osoby porušili základné právo alebo slobodu fyzických osôb a právnických osôb.',	'Štátna správa sk',	49),
('Petícia',	'Pod petíciou sa rozumie právo občana spoločne s inými obracať sa vo veciach verejného alebo iného spoločného záujmu na štátne orgány a orgány územnej samosprávy so žiadosťou, návrhom alebo sťažnosťou. Podmienky podania petície upravuje zákon č. 85/1990 Z. z. o petičnom práve.',	NULL,	50),
('PK',	'Skratka pre Prístupový komponent <a href="https://www.slovensko.sk/sk/slovnik/detail/_upvs">ÚPVS</a>.',	NULL,	51),
('Podpisovač',	'Aplikácia na vytvorenie kvalifikovaného elektronického podpisu. Na portáli www.slovensko.sk je v sekcii ,,Na stiahnutie" dostupná aplikácia D.Suite/eIDAS.',	NULL,	52),
('Povinná osoba',	'Povinnou osobou na účely poskytovania elektornických služieb sa rozumie osoba v zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2006/275/20170401#paragraf-3">§ 3 ods. 3</a> zákona č. 275/2006 Z. z. o informačných systémoch verejnej správy.',	NULL,	53),
('PZP',	'Každý držiteľ motorového vozidla musí mať zo zákona uzatvorené povinné zmluvné poistenie zodpovednosti za škodu spôsobenú prevádzkou motorových vozidiel.',	NULL,	54),
('RSS',	'RSS je rodina XML formátov určených na čítanie noviniek na webových stránkach a všeobecne o syndikácii obsahu. Technológia RSS umožňuje užívateľom Internetu prihlásiť sa k odberu noviniek z webu, ktorý ponúka RSS zdroj (RSS feed, tiež RSS kanál, RSS channel). Tento zdroj sa väčšinou vyskytuje na stránkach, kde sa obsah mení a pridáva veľmi často (napríklad spravodajské servery). RSS formát poskytuje obsah celého článku, príp. jeho časť, odkaz na pôvodný článok a tiež iné metadáta. Tieto informácie sa posielajú ako XML súbor nazývaný RSS zdroj, webový zdroj, RSS stream, RSS feed alebo RSS kanál.',	NULL,	55),
('RTF',	'Rich Text Format - je proprietárny formát na ukladanie dokumentov.',	NULL,	56),
('RVK',	'Skratka pre <a href="https://open.slovensko.sk/VK/SelectionProcedureList">Register výberových konaní</a>.',	NULL,	57),
('SPM',	'Skratka pre Spoločné moduly eDOV - eDemokracia a otvorená vláda (<a href="https://open.slovensko.sk/">open.slovensko.sk</a>).',	NULL,	58),
('SPR',	'Skratka pre Modul Správa prístupov a rolí.',	NULL,	59),
('Správne poplatky',	'Sú poplatky, ktoré sa platia za úkony a konania orgánov štátnej správy, vyšších územných celkov, obcí, štátnych archívov a DataCentra ("správny orgán"). Správne poplatky sú uvedené v sadzobníku správnych poplatkov, ktorý tvorí <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/1995/145/20170401#prilohy">prílohu</a> zákona č. 145/1995 Z. z. o správnych poplatkoch.',	'Štátna správa sk',	60),
('Sťažnosť',	'V zmysle <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2010/9/20170601#paragraf-3">§ 3</a> zákona č. 9/2010 Z. z. o sťažnostiach je sťažnosťou podanie fyzickej osoby alebo právnickej osoby, ktorým:
 

 a) sa domáha ochrany svojich práv alebo právom chránených záujmov, o ktorých sa domnieva, že boli porušené činnosťou alebo nečinnosťou orgánu verejnej správy,
 

 b) poukazuje na konkrétne nedostatky, najmä na porušenie právnych predpisov, ktorých odstránenie je v pôsobnosti orgánu verejnej správy.',	'Štátna správa sk',	61),
('Súkromný kľúč',	'Súkromný kľúč je tajná informácia, ktorá slúži na vyhotovenie kvalifikovaného elektronického podpisu elektronického dokumentu.',	NULL,	62),
('SZČO',	'Skratka pre samostatne zárobkovo činnú osobu. SZČO je fyzická osoba podnikajúca najmä ako živnostník, a teda na základe živnostenského oprávnenia, ale aj na základe iného než živnostenského oprávnenia podľa osobitných predpisov alebo fyzická osoba, ktorá vykonáva poľnohospodársku výrobu a je zapísaná do evidencie podľa osobitného predpisu.',	'Štátna správa sk',	63),
('Štátna správa',	'Je jedna z foriem základných činností štátu. Vykonávajú ju orgány štátnej správy v zmysle tzv. kompetenčného zákona č. <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2001/575/20170101">575/2001 Z. z.</a> o organizácii činnosti vlády a organizácii ústrednej štátnej správy.
 

 Na Slovensku sa štátna správa delí takto:
 

 1. ústredná štátna správa - vláda, ministerstvá a ďalšie ústredné orgány
 2. miestna štátna správa - okresné úrady (od 1. októbra 2013)
 

 Štátna správa tvorí spolu so samosprávou verejnú správu.',	'Štátna správa sk',	64),
('Ťarcha',	'Pojem využívaný pre vecné bremeno (predkupné právo, záložné právo, právo doživotného bývania a užívania a pod.) a iné práva, ak boli dohodnuté ako vecné bremená.',	'Štátna správa sk',	65),
('Tretí pilier dôchodkového poistenia',	'Je dobrovoľné doplnkové dôchodkové sporenie príspevkovo definované, financované prostredníctvom kapitalizácie, vykonávané doplnkovými dôchodkovými spoločnosťami na základe zákona č. 650/2004 Z. z. o doplnkovom dôchodkovom sporení. Doplnkové dôchodkové sporenie predstavuje dobrovoľný, tzv. tretí pilier dôchodkového systému, v ktorom sú finančné prostriedky účastníkov doplnkového dôchodkového sporenia spravované súkromnými spoločnosťami – Doplnkovými dôchodkovými spoločnosťami tzv. DDS.',	NULL,	66),
('Univerzálne podanie',	'Je elektronická služba, ktorej predmetom je s využitím centrálnej elektronickej podateľne a ústredného portálu verejnej správy zabezpečiť časť administratívneho styku podľa <a href="https://www.slov-lex.sk/pravne-predpisy/SK/ZZ/2009/136/20151015#paragraf-2.pismeno-b">§ 2 písm. b)</a> vyhlášky Národného bezpečnostného úradu č. 136/2009 Z. z. medzi podávajúcim a prijímateľom podania, spočívajúcu v jednosmernej elektronickej komunikácii od podávajúceho k prijímateľovi podania, ktorej účelom je odosielanie, prijímanie a potvrdzovanie prijatia podania.',	NULL,	67),
('ÚPVS',	'Je skratka pre Ústredný portál verejnej správy. ÚPVS zabezpečuje centrálny a jednotný prístup k informačným zdrojom a službám verejnej správy. Informácie (rady, návody, popisy), ktoré návštevník hľadá, sú v súčasnosti mnohokrát súčasťou informačných serverov jednotlivých rezortov. Cieľom portálu je tieto informácie a služby zintegrovať a prehľadnou a prístupnou formou poskytovať používateľovi.',	NULL,	68),
('Verejný kľúč',	'Verejný kľúč je informácia dostupná overovateľovi, ktorá slúži na overenie správnosti kvalifikovaného elektronického podpisu vyhotoveného pomocou súkromného kľúča patriaceho k danému verejnému kľúču.',	NULL,	69),
('VKŠZ',	'Skratka pre výberové konania štátnych zamestnancov.',	NULL,	70),
('Záložné právo',	'Záložné právo je právny prostriedok zabezpečenia pohľadávky a jej príslušenstva tým, že záložného veriteľa oprávňuje uspokojiť sa alebo domáhať sa uspokojenia pohľadávky z predmetu záložného práva, ak pohľadávka nie je riadne a včas splnená. V slovenskom právnom poriadku je tento inštitút upravený § 151a až § 151me občianskeho zákonníka (40/1964 Zb.).',	'Štátna správa sk',	71),
('ZEP PIN',	'Bezpečnostný kód, pozostávajúci zo 6 čísel, ktorý slúži na vytvorenie kvalifikovaného elektronického podpisu.',	NULL,	72),
('ZEP PUK',	'Bezpečnostnou ochranou vytvárania ZEP prostredníctvom eID je limitovaný počet nesprávne zadanej hodnoty ZEP PIN-u. Po troch (3) nesprávne zadaných hodnôt ZEP PIN-u sa zablokuje možnosť použitia súkromného kľúča na vytvorenie ZEP-u. Odblokovanie je možné len prostredníctvom ZEP PUK-u.',	NULL,	73);

-- 2022-09-21 13:14:32.441778+02
