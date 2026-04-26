<?xml version="1.0" encoding="UTF-8"?>
<!-- Commande : xsltproc styles/main.xsl data/catalogue.xml > output/rapport.html -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>

  <!-- Template racine pour génère la page HTML -->
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Bibliothèque Scientifique</title>
        <style>
          body { font-family: Arial, sans-serif; padding: 2rem; background: #f5f5f5; }
          h1   { color: #1a365d; }
          table { width: 100%; border-collapse: collapse; background: white; }
          th   { background: #2b6cb0; color: white; padding: 10px; text-align: left; }
          td   { padding: 10px; border-bottom: 1px solid #ddd; }
          tr:hover { background: #ebf8ff; }
        </style>
      </head>
      <body>
        <h1>📚 Bibliothèque Scientifique</h1>

        <!-- count() = fonction XPath pour compter les livres -->
        <p>Total : <strong><xsl:value-of select="count(//livre)"/></strong> livres</p>

        <table>
          <tr>
            <th>ID</th>
            <th>Titre</th>
            <th>Auteur</th>
            <th>ISBN</th>
            <th>Année</th>
            <th>Domaine</th>
          </tr>

          <!-- Boucle sur chaque livre -->
          <xsl:for-each select="bibliotheque/livre">
            <tr>
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="titre"/></td>
              <td><xsl:value-of select="auteur"/></td>
              <td><xsl:value-of select="isbn"/></td>
              <td><xsl:value-of select="annee"/></td>
              <td><xsl:value-of select="domaine"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
