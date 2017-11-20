{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

<!--Header-->
{% if heading %}
<h1>{{ heading }} <small>({{ quantity }})</small></h1>
{% else %}
<h2>{{ title }} <small>({{ quantity }})</small></h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<!--Products-->
{% if products %}
{% include 'html/products/block' %}
{% else %}
<p>
  {{ '_' | jtext: 'COM_JKASSA_ACCOUNT_VIEWED_NO_PRODUCTS' }}
</p>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}

{% if viewtmpl == '' %}
<!--Return button-->
<p class="text-center">
  <button onclick="history.back();" type="button" class="button">
    <span class="icon-arrow-left"></span> {{ '_' | jtext: 'JPREV' }}
  </button>
</p>
{% endif %}