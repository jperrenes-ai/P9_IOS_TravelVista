# Rapport de tests manuels – TravelVista (version UIKit, avant migration SwiftUI)

| Élément | Valeur |
| --- | --- |
| Date | 21/10/2026 |
| Version testée | Commit `493d3ee` (branche `main`) |
| Appareil | Simulateur iPhone 18 Pro – iOS 27.0 (24A434) – 402×874 pt |
| Référentiel | « Liste des fonctionnalités de l'application Travel Vista » (11 fonctionnalités + 3 écrans types) |
| Données | `Source.json` : 5 régions, 9 pays |
| Résultat global | **11/11 fonctionnalités conformes** – aucun crash – écarts visuels mineurs sur les écrans types (liés à iOS 27) |

## 1. Tests fonctionnels (liste des fonctionnalités)

| # | Fonctionnalité attendue | Étapes réalisées | Résultat obtenu | Statut |
| --- | --- | --- | --- | --- |
| F01 | La première page est une liste scrollable de pays | Lancer l'app, faire défiler jusqu'en bas puis remonter | Écran « Liste de voyages » affiché au lancement, défilement fluide jusqu'à Canada | OK |
| F02 | Chaque cellule affiche une photo, un nom de pays, une capitale et une note sur 5 accompagnée d'une étoile | Lire les 9 cellules | Photo ronde, nom (bleu), capitale, note + étoile orange sur chaque cellule ; valeurs conformes à `Source.json` | OK |
| F03 | La liste contient 5 catégories : Europe, Asie, Océanie, Afrique, Amériques | Lire les en-têtes de section | 5 sections dans l'ordre : Europe, Asie, Oceanie, Afrique, Ameriques (libellés sans accents, comme sur l'écran type) | OK |
| F04 | Un clic sur une cellule affiche la page de détail du pays sélectionné | Toucher chacun des 9 pays | Le détail du bon pays s'ouvre à chaque fois (titre = nom du pays) | OK |
| F05 | Le détail affiche image, nom, capitale, note en étoiles, description et carte d'aperçu | Vérifier les 9 pages de détail | Tous les éléments présents ; nombre d'étoiles = note (ex. Norvège 4, Egypte 2, Islande 5) ; pas d'étoiles dupliquées après 10+ ouvertures | OK |
| F06 | La description est scrollable si elle est trop longue | Glisser dans la description (Norvège, Canada) | Le texte défile jusqu'à la fin (« …mer de Barents. » pour la Norvège) | OK |
| F07 | La carte du détail est un bouton qui ouvre l'écran carte | Toucher la mini-carte (Norvège, Canada) | L'écran carte plein écran s'ouvre | OK |
| F08 | L'écran carte est une carte interactive avec une étiquette situant la capitale | Observer, déplacer / zoomer la carte | Carte interactive, épingle positionnée sur la capitale | OK |
| F09 | L'étiquette contient le nom de la capitale | Lire l'étiquette de l'épingle | « Oslo » visible sous l'épingle sans toucher ; « Ottawa » pour le Canada | OK |
| F10 | La carte est centrée sur l'étiquette de la capitale | Observer la position de l'épingle à l'ouverture | Épingle au centre de l'écran | OK |
| F11 | Retour arrière possible avec la flèche en haut à gauche sur chaque nouvel écran | Carte → Détail → Liste avec la flèche (+ geste de bord) | Retours corrects depuis la carte et depuis le détail ; le geste de bord fonctionne aussi | OK |

Contrôles complémentaires : l'interface reste en portrait en mode paysage (app portrait uniquement) ; aucun crash sur l'ensemble de la session (même processus du début à la fin).

## 2. Tests d'interface (comparaison aux 3 écrans types)

### Écran 1 – Liste de voyages

| Élément | Référence | Observé | Conforme |
| --- | --- | --- | --- |
| Titre | « Liste de voyages », centré, gras | Identique | Oui |
| En-têtes de section | Texte gris, petit | Identique | Oui |
| Photo | Ronde, à gauche | Ronde (52 pt) | Oui |
| Nom du pays / capitale | Nom bleu en grand, capitale noire dessous | Identique | Oui |
| Note | Chiffre noir + étoile orange pleine | Identique | Oui |
| Ordre et valeurs | Norvège 4, Italie 3, Islande 5, Vietnam 4, … | Identique | Oui |
| En-têtes au défilement | – | Les en-têtes restent collés en haut, sans fond opaque : le texte des lignes passe au travers | Remarque (A2) |

### Écran 2 – Détail (Norvège)

| Élément | Référence | Observé | Conforme |
| --- | --- | --- | --- |
| Bouton retour | « < Back » orange | Bouton rond système iOS 27, chevron seul, sans texte ni teinte orange | Non (A1) |
| Titre | « Norvège » centré | Identique | Oui |
| Photo | Pleine largeur en haut | Identique | Oui |
| Nom / capitale | « Norvège » bleu, « Oslo » gris | Identique | Oui |
| Note | 4 étoiles orange à droite | Identique | Oui |
| Description | Texte multi-ligne, coupé en bas, défilable | Identique | Oui |
| Mini-carte | Cercle centré, bordure orange, Scandinavie | Identique | Oui |

### Écran 3 – Carte (Oslo)

| Élément | Référence | Observé | Conforme |
| --- | --- | --- | --- |
| Carte plein écran | Sous la barre d'état et la barre de navigation transparente | Identique | Oui |
| Bouton retour | « < Norvège » orange | Bouton rond système iOS 27, chevron seul, sans texte ni teinte orange | Non (A1) |
| Épingle | Ballon rouge | Marqueur rond rouge avec icône blanche (style iOS 27) | Différence d'apparence (A3) |
| Étiquette | « Oslo » visible sous l'épingle | Identique | Oui |
| Centrage | Centré sur Oslo | Identique | Oui |
| Logo Plans + « Legal » | En bas à gauche | Identique | Oui |

## 3. Écarts et remarques

| # | Écran | Description | Gravité |
| --- | --- | --- | --- |
| A1 | Détail, Carte | Le bouton retour n'affiche ni texte (« Back » / « Norvège ») ni teinte orange : style système iOS 27. La fonction de retour est conforme | Visuelle mineure (liée à l'OS) |
| A2 | Liste | Les en-têtes de section collants n'ont pas de fond : le texte des lignes passe au travers au défilement | Cosmétique |
| A3 | Carte | Forme du marqueur différente de la référence (style système iOS 27) | Cosmétique (liée à l'OS) |
| A4 | Liste | La cellule touchée reste surlignée au retour sur la liste (pas de `deselectRow`) | Mineure |
| A5 | Détail | Le bouton de la mini-carte est transparent, sans icône : rien n'indique que la carte est cliquable (identique à la référence) | Info |
| A6 | Données | Casse incohérente : « Nouvelle-zélande » (nom) / « Nouvelle-Zélande » (description) dans `Source.json` (identique à la référence) | Cosmétique |
| A7 | Détail, Carte | Tuiles de carte vides 1 à 3 s au premier affichage (comportement MapKit sur simulateur) | Info |

## 4. Console

Aucun crash, aucune exception, aucun avertissement Auto Layout, aucune erreur de décodage JSON.
Seuls des messages système / MapKit sans impact ont été relevés (`default.csv` introuvable, `CAMetalLayer ... size 0`, `animationDidStop without a matching animationDidStart`, `[AXUIA] VKMapView`).

## 5. Conclusion

Les **11 fonctionnalités** de la liste de référence sont présentes et fonctionnent dans la version UIKit actuelle. Les 3 écrans correspondent aux écrans types, à l'exception de détails visuels dus au design système d'iOS 27 (bouton retour, marqueur de carte) et de remarques cosmétiques mineures.

Ce rapport sert de référence pour valider la parité fonctionnelle et visuelle de la future version SwiftUI : chaque test F01 à F11 et chaque point des écrans types devra être rejoué après la migration.
