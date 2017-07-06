{# Usage: #}
{#   jupyter nbconvert --to html --template='tools/jdhp_html_fr.tpl' --execute 'file.ipynb' #}
{# See http://nbconvert.readthedocs.io/en/latest/customizing.html#Custom-Templates #}
{# The full.tpl template is there: ~/anaconda/pkgs/nbconvert-5.1.1-py36_0/lib/python3.6/site-packages/nbconvert/templates/html/full.tpl #}
{#  #}
{# TODO: #}
{# - [x] tags "hide", "hide_code", "hide_output" #}
{# - [ ] bloc "meta" (auteur, date de création, dernière mise à jours, licence) #}
{# - [ ] balises HTML <head> ... <meta ...> ... </head> #}
{# - [ ] entête jdhp.org (?) #}
{# - [x] supprimer les "compteurs" ipython sur la gauche des cellules #}
{# - [ ] améliorer le CSS #}
{# - [ ] footer: disqus #}
{# - [ ] table des matières #}
{# - [x] note avertissant quand un document est un brouillon #}
{# - [x] images matplotlib centrées #}


{%- extends 'basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}

## UPDATE HEADER BLOCK ########################################################

{%- block header -%}
<!DOCTYPE html>
<html>
<head>
{%- block html_head -%}
<meta charset="utf-8" />
<title>{{resources['metadata']['name']}}</title>

{%- if "widgets" in nb.metadata -%}
<script src="https://unpkg.com/jupyter-js-widgets@2.0.*/dist/embed.js"></script>
{%- endif-%}

<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<style type="text/css">
/* Overrides of notebook CSS for static HTML export */
body {
  overflow: visible;
  padding: 8px;
}

div#notebook {
  overflow: visible;
  border-top: none;
}

/* START OF JDHP UPDATES ************ */

.rendered_html h1 {
    margin-left: 56px;
}

div#meta-container {
    padding: 2em;
    text-align: center;
}

div#sandbox-note {
    background: #ffedcc;
    padding: 12px;
    line-height: 24px;
    margin-bottom: 8px;
}

div#sandbox-note p.admonition-title {
    background: #f0b37e;
    display: block;
    font-weight: bold;
    color: #fff;
    margin: -12px -12px 12px;
    padding: 6px 12px;
}

div#sandbox-note p.last {
    margin-bottom: 0px;
}

h1 {
    text-align: center;
}

/* Hide the execution count */

div.prompt {
    display: none;
}

.output_png {
    display: table-cell;
    text-align: center;
    vertical-align: middle;
}

/* END OF JDHP UPDATES ************** */

@media print {
  div.cell {
    display: block;
    page-break-inside: avoid;
  } 
  div.output_wrapper { 
    display: block;
    page-break-inside: avoid; 
  }
  div.output { 
    display: block;
    page-break-inside: avoid; 
  }
}
</style>

<!-- Custom stylesheet, it must be in the same directory as the html file -->
<link rel="stylesheet" href="custom.css">

<!-- Loading mathjax macro -->
{{ mathjax() }}
{%- endblock html_head -%}
</head>
{%- endblock header -%}

## UPDATE BODY BLOCK ##########################################################

{% block body %}
<body>
  <div tabindex="-1" id="notebook" class="border-box-sizing">
    <div class="container" id="notebook-container">
{{ super() }}
    </div>
  </div>
</body>
{%- endblock body %}

## UPDATE FOOTER BLOCK ########################################################

{% block footer %}
{{ super() }}
</html>
{% endblock footer %}

## UPDATE ANY_CELL BLOCK ######################################################

{% block any_cell %}

{% if 'hide' in cell['metadata'].get('tags', []) %}
{% else %}
    {{ super() }}
{% endif %}

{% if 'meta' in cell['metadata'].get('tags', []) %}
<div id="meta-container">
  <p>Jérémie Decock (<a href="http://www.jdhp.org">www.jdhp.org</a>)</p>
  <!-- <p>Auteur: Jérémie Decock (jd.jdhp@gmail.com)</p> -->
  <!-- <p>Date de création: TODO</p> -->
  <!-- <p>Dernière mise à jours: TODO</p> -->
</div>
{% endif %}

{% if 'draft' in cell['metadata'].get('tags', []) %}
<div id="sandbox-note">
<p class="admonition-title">Attention:</p>
<p class="last">Veuillez noter que ce document est en cours de rédaction. Dans son état actuel, il n'est pas destiné à être lu par d'autres personnes que ses auteurs.</p>
</div>
{% endif %}

{% endblock any_cell %}

## UPDATE INPUT GROUP BLOCK ###################################################

{% block input_group %}

{% if 'hide_code' in cell['metadata'].get('tags', []) %}
{% else %}
    {{ super() }}
{% endif %}

{% endblock input_group %}

## UPDATE OUTPUT GROUP BLOCK ##################################################

{% block output_group %}

{% if 'hide_output' in cell['metadata'].get('tags', []) %}
{% else %}
    {{ super() }}
{% endif %}

{% endblock output_group %}

