{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'behavior.modal' | jhtml: '.jk-quick_view' }}

{% if heading %}
<!--Heading-->
<h1>{{ heading }}</h1>
{% elsif title %}
<!--Title-->
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

{% if products or categories %}
  {% if products %}
  <!--List products-->
  <form action="{{ form_action }}" method="post" name="productsForm" id="productsForm">
    <ul class="actions">
      <li>
        <!--Sort by-->
        {{ '_' | jtext: 'COM_JKASSA_SORT_TITLE' }}:
        <select data-select="products-sorting" name="product-sorting" class="input-medium">
          {% for sort in sorting %}
          <option value="{{ sort.value }}" {{ sort.selected }}>{{ sort.title }}</option>
          {% endfor %}
        </select>
        <select data-select="products-limit" title="{{ '_' | jtext: 'JSHOW' }}" class="input-medium" style="width: auto;">
          {% for limit in limits %}
          <option value="{{ limit.value }}" {{ limit.selected }}>{{ limit.title }}</option>
          {% endfor %}
        </select>
      </li>
      <li>
        <!--Switch product layout-->
        {{ '_' | jtext: 'JSHOW' }}:
        <a href="#" data-click="display-block" class="{% if layout == 'block' %}active{% endif %}" title="{{ '_' | jtext: 'COM_JKASSA_DISPLAY_BLOCK' }}">
          <span class="icon-grid-view"></span>
        </a>
        <a href="#" data-click="display-list" class="{% if layout == 'list' %}active{% endif %}" title="{{ '_' | jtext: 'COM_JKASSA_DISPLAY_LIST' }}">
          <span class="icon-list-view"></span>
        </a>
      </li>
    </ul>
    
    <!--Layout products-->
    {{ products }}
    
    {% comment %}
        Code to add a link to submit an product.
    {% endcomment %}
    {% if create_icon %}
    <p>
      {{ create_icon }}
    </p>
    {% endif %}
    
    {% comment %}
        Pages links (pagination).
        See: html/pagination
    {% endcomment %}
    {{ pagesLinks }}
  </form>
  {% endif %}
  
  {% comment %}
      Categories.
      See: views/category/categories.tpl
  {% endcomment %}
  {% if categories %}
  {{ categories }}
  {% endif %}
{% else %}
  <!--No Matching Results-->
  <strong>
    {{ '_' | jtext: 'COM_JKASSA_NO_MATCHING_RESULTS' }}
  </strong>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}