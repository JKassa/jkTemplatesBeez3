{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<!--List items-->
{% if items %}
<form action="{{ form_action }}" method="post" name="manufacturersForm" id="manufacturersForm">
  
  <fieldset class="filters">
    <div class="pull-right">
      {{ '_' | jtext: 'JGLOBAL_DISPLAY_NUM' }}
      <select onchange="this.form.submit()" name="limit" title="{{ '_' | jtext: 'JSHOW' }}" style="width: auto;">
        {% for limit in limits %}
          <option value="{{ limit.value }}"{{ limit.selected }}>{{ limit.title }}</option>
        {% endfor %}
      </select>
    </div>
  </fieldset>
  
  <ul>
    {% for item in items %}
    <li style="float: left; width: 100%;">
      <a class="pull-left" href="{{ item.url }}" style="margin-right: 10px;">
        <img {{ item.thumbnail | img_exists: '35x35' }} alt="{{ item.alias }}" />
      </a>
      <div style="overflow: hidden;">
        <h4 style="margin: 0 0 5px;">
          <a href="{{ item.url }}">
            {{ item.name }}
          </a>
		  &nbsp;
		  <small>
			({{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', item.products_quantity }})
		  </small>
        </h4>
        {{ item.introtext }}
      </div>
    </li>
    {% endfor %}
  </ul>
  
  {% comment %}
      Pages links (pagination).
      See: html/pagination
  {% endcomment %}
  {{ pagesLinks }}
</form>
{% else %}
<p>
  {{ no_items }}
</p>
{% endif %}

{% if page_desc_2 %}
<!--Posttext-->
<div style="float: left; margin-top: 18px; width: 100%;">
  {{ posttext }}
</div>
{% endif %}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ Itemid | jkcomments: title }}