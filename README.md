## Drupal app
ÚPVS: WEB Rozhranie pre spravu obsahu https://cms.slovensko.sk

### Lokálne vývojové prostredie s https://lando.dev

#### Setup

``cp -i .env.lando.example .env``

#### Spustenie

``lando start``

#### Inštalácia závislosí

``lando composer install``

#### Inštalácia Drupal

``lando drush si --existing-config -y``

Prihlásenie pomocou linku

``lando drush uli``

#### Export zmien configu

``lando drush cex``

#### Import zmien v Drupal po git pull

``lando post-pull``
