# 📚 Projet : Bibliothèque Scientifique

**Système de Gestion de Bibliothèque Scientifique** utilisant XML, XSD, DTD, XSLT et XQuery.

---

## 📋 Table des matières

- [Objectif](#-objectif)
- [Architecture](#-architecture)
- [Prérequis & Installation](#️-prérequis--installation)
- [Démarrer le projet](#-démarrer-le-projet)
- [Structure des fichiers](#-structure-des-fichiers)
- [Exemples XPath](#-exemples-xpath-rapides)
- [Troubleshooting](#-troubleshooting)
- [Ressources](#-ressources)
- [Auteur](#-auteur)

---

## 🎯 Objectif

Ce projet démontre les **technologies XML** essentielles :

| Technologie | Rôle |
|-------------|------|
| **XML**    | Format de données structuré |
| **XSD**    | Schéma de validation strict |
| **DTD**    | Document Type Definition |
| **XSLT**   | Transformation XML → HTML |
| **XQuery** | Requêtes et interrogation |
| **XPath**  | Navigation dans le document |

**Cas d'usage** : Gestion d'un catalogue de 5 livres scientifiques avec recherche et filtrage.

---

## 🏗️ Architecture

```
XML (données) ──► XSD/DTD (validation) ──► XSLT (transformation) ──► HTML (résultat)
                                       └──► XQuery (requêtes)    ──► Terminal
```

---

## ⚙️ Prérequis & Installation

### Système requis

| Élément | Minimum |
|---------|---------|
| OS      | macOS 10.15+ ou Linux (Debian/Ubuntu) ou Windows 10+ |
| RAM     | 512 MB |
| Disque  | 100 MB |

---

### 🍎 Installation sur macOS

#### Étape 1 — Installer Homebrew (gestionnaire de paquets)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> Homebrew est le gestionnaire de paquets standard sur macOS.

#### Étape 2 — Installer libxml2 (fournit `xmllint`)

```bash
brew install libxml2
```

```bash
# Ajouter libxml2 au PATH
echo 'export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

#### Étape 3 — Installer libxslt (fournit `xsltproc`)

```bash
brew install libxslt
```

#### Étape 4 — Installer BaseX (moteur XQuery)

```bash
brew install basex
```

#### Étape 5 — Vérifier toutes les installations

```bash
xmllint --version
xsltproc --version
basex -version
```

Résultat attendu :

```
xmllint: using libxml version 2.x.x
xsltproc was compiled against libxml 2.x.x
BaseX 10.x
```

---

### 🐧 Installation sur Linux (Debian / Ubuntu)

#### Étape 1 — Mettre à jour les paquets

```bash
sudo apt-get update
```

#### Étape 2 — Installer xmllint

```bash
sudo apt-get install libxml2-utils
```

#### Étape 3 — Installer xsltproc

```bash
sudo apt-get install xsltproc
```

#### Étape 4 — Installer BaseX

```bash
sudo apt-get install basex
```

> Si BaseX n'est pas dans apt, installation manuelle :

```bash
wget https://files.basex.org/releases/10.7/BaseX107.zip
unzip BaseX107.zip
cd basex/bin && chmod +x basex
echo 'export PATH="$HOME/basex/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

#### Étape 5 — Vérifier toutes les installations

```bash
xmllint --version
xsltproc --version
basex -version
```

---

### 🪟 Installation sur Windows

#### Option A — Via WSL 

```bash
# 1. Dans PowerShell en administrateur :
wsl --install

# 2. Redémarrer, ouvrir Ubuntu, puis suivre les étapes Linux ci-dessus
```

#### Option B — Outils natifs via Chocolatey

```bash
# 1. Installer Chocolatey dans PowerShell (administrateur) :
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# 2. Installer les outils :
choco install xsltproc
choco install basex
```

---

### 🖥️ Extension VS Code recommandée

```
Nom     : XML by Red Hat 

---

## 📁 Structure des fichiers

```
projet-biblio-simple/
├── README.md                  ← Ce fichier
├── data/
│   └── catalogue.xml          ← Données (5 livres)
├── schemas/
│   ├── bibliotheque.xsd       ← Schéma XSD (validation stricte)
│   └── bibliotheque.dtd       ← DTD (structure des balises)
├── styles/
│   └── main.xsl               ← Transformation XSLT → HTML
├── queries/
│   └── requetes.xq            ← Requêtes XQuery
└── output/
    └── rapport.html           ← HTML généré (ne pas modifier manuellement)
```

---

## 🚀 Démarrer le projet

### 1️⃣ Valider le XML contre le schéma XSD

```bash
xmllint --schema schemas/bibliotheque.xsd data/catalogue.xml --noout
```

Résultat attendu :

```
data/catalogue.xml validates
```

### 2️⃣ Générer le rapport HTML

```bash
xsltproc styles/main.xsl data/catalogue.xml > output/rapport.html
```

Ouvrir dans le navigateur :

```bash
open output/rapport.html        # macOS
xdg-open output/rapport.html    # Linux
start output/rapport.html       # Windows
```

### 3️⃣ Exécuter les requêtes XQuery

```bash
basex queries/requetes.xq
```

---

## 🔍 Exemples XPath commandes

```bash
# Tous les titres
xmllint --xpath "//titre/text()" data/catalogue.xml

# Livres sur l'IA
xmllint --xpath "//livre[domaine='Intelligence Artificielle']/titre/text()" data/catalogue.xml

# Livres publiés après 2015
xmllint --xpath "//livre[annee>2015]/titre/text()" data/catalogue.xml

# Titre du livre L003
xmllint --xpath "//livre[@id='L003']/titre/text()" data/catalogue.xml
```


---

## 📖 Ressources

| Sujet | Lien |
|-------|------|
| XML / XSD | https://www.w3schools.com/xml |
| XSLT | https://www.w3schools.com/xml/xsl_intro.asp |
| XQuery | https://www.w3schools.com/xml/xquery_intro.asp |
| XPath | https://www.w3schools.com/xml/xpath_intro.asp |
| BaseX (docs) | https://docs.basex.org |
| libxml2 | https://gnome.pages.gitlab.gnome.org/libxml2 |

---

## 👥 Auteur

**Aziz Khemiri & Khadija Ben Abdlkader**