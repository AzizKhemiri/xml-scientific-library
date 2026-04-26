(: XQuery : requêtes et statistiques sur le catalogue :)
(: Commande : basex queries/requetes.xq :)

declare variable $livres := doc('../data/catalogue.xml')//livre;

(: ── Requête 1 : Tous les titres ── :)
<tous_les_titres>
  { for $l in $livres
    return <titre>{$l/titre/string()}</titre> }
</tous_les_titres>
,

(: ── Requête 2 : Livres par domaine ── :)
<livres_IA>
  { for $l in $livres[domaine = 'Intelligence Artificielle']
    return <livre>{$l/titre/string()} ({$l/annee/string()})</livre> }
</livres_IA>
,

(: ── Requête 3 : Nombre de livres par domaine ── :)
<stats_domaines>
  { for $d in distinct-values($livres/domaine)
    return <domaine nom="{$d}">{count($livres[domaine = $d])}</domaine> }
</stats_domaines>
,

(: ── Requête 4 : Livres publiés après 2015 ── :)
<livres_recents>
  { for $l in $livres[xs:integer(annee) > 2015]
    order by $l/annee descending
    return <livre annee="{$l/annee/string()}">{$l/titre/string()}</livre> }
</livres_recents>
